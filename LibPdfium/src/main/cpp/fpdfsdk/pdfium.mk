LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfium

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall -DOPJ_STATIC \
                -DV8_DEPRECATION_WARNINGS -D_CRT_SECURE_NO_WARNINGS

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-sign-compare -Wno-unused-parameter
LOCAL_CLANG_CFLAGS += -Wno-sign-compare

LOCAL_STATIC_LIBRARIES := libpdfiumformfiller \
                          libpdfiumpdfwindow \
                          libpdfiumjavascript \
                          libpdfiumfpdfapi \
                          libpdfiumfxge \
                          libpdfiumfxedit \
                          libpdfiumfpdftext \
                          libpdfium \
                          libpdfiumfxcodec \
                          libpdfiumfpdfdoc \
                          libpdfiumfdrm \
                          libpdfiumagg23 \
                          libpdfiumbigint \
                          libpdfiumlcms \
                          libpdfiumjpeg \
                          libpdfiumopenjpeg \
                          libpdfiumzlib


# TODO: figure out why turning on exceptions requires manually linking libdl
LOCAL_SHARED_LIBRARIES := libdl libft2

LOCAL_SRC_FILES := \
    src/fpdf_dataavail.cpp \
    src/fpdf_ext.cpp \
    src/fpdf_flatten.cpp \
    src/fpdf_progressive.cpp \
    src/fpdf_searchex.cpp \
    src/fpdf_sysfontinfo.cpp \
    src/fpdf_transformpage.cpp \
    src/fpdfdoc.cpp \
    src/fpdfeditimg.cpp \
    src/fpdfeditpage.cpp \
    src/fpdfformfill.cpp \
    src/fpdfppo.cpp \
    src/fpdfsave.cpp \
    src/fpdftext.cpp \
    src/fpdfview.cpp \
    src/fsdk_actionhandler.cpp \
    src/fsdk_annothandler.cpp \
    src/fsdk_baseannot.cpp \
    src/fsdk_baseform.cpp \
    src/fsdk_mgr.cpp \
    src/fsdk_rendercontext.cpp

LOCAL_C_INCLUDES := \
    -I../ \
    -I../../freetype/include \
    -I../../freetype/include/freetype

include $(BUILD_SHARED_LIBRARY)

SRC_pdfium := $(LOCAL_SRC_FILES)
OBJS_pdfium := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfium := $(addprefix build/$(_ARCH_PX_)/pdfium/, $(OBJS_pdfium))
ALLOBJS += $(OBJS_pdfium)
	
libpdfium.a: $(OBJS_pdfium)
	$(AR) -rv libpdfium.a $(OBJS_pdfium)
	
	
	# libpdfiumpdfwindow.a\
	# libpdfiumformfiller.a\
	# libpdfiumfxedit.a\
	# libpdfiumjavascript.a\
	
pdflibs_ := \
	libpdfiumpdfwindow.a\
	libpdfiumformfiller.a\
	libpdfiumfxedit.a\
	libpdfiumjavascript.a\
	-Wl,--whole-archive\
	../third_party/libpdfiumzlib.a\
	../third_party/libpdfiumagg23.a\
	../third_party/libpdfiumbigint.a\
	../third_party/libpdfiumjpeg.a\
	../third_party/libpdfiumlcms.a\
	../third_party/libpdfiumopenjpeg.a\
	../core/libpdfiumfdrm.a\
	../core/libpdfiumfpdfapi.a\
	../core/libpdfiumfpdfdoc.a\
	../core/libpdfiumfpdftext.a\
	../core/libpdfiumfxcodec.a\
	../core/libpdfiumfxcrt.a\
	../core/libpdfiumfxge.a\
	-Wl,--no-whole-archive
	
libpdfium.so: $(LOCAL_SRC_FILES)
	$(CC) -fPIC -shared -Wl,-soname,libpdfium.so $(SRC_pdfium) -o libpdfium.so $(LOCAL_SRC_FILES) $(pdflibs_) -I"../" $(LOCAL_C_INCLUDES)\
	
	echo

build/$(_ARCH_PX_)/pdfium/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo