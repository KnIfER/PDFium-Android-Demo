LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libpdfiumfpdfdoc

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall -DOPJ_STATIC \
                -DV8_DEPRECATION_WARNINGS -D_CRT_SECURE_NO_WARNINGS

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-sign-compare -Wno-unused-parameter
LOCAL_CLANG_CFLAGS += -Wno-sign-compare

LOCAL_SRC_FILES := \
    src/fpdfdoc/doc_action.cpp \
    src/fpdfdoc/doc_annot.cpp \
    src/fpdfdoc/doc_ap.cpp \
    src/fpdfdoc/doc_basic.cpp \
    src/fpdfdoc/doc_bookmark.cpp \
    src/fpdfdoc/doc_form.cpp \
    src/fpdfdoc/doc_formcontrol.cpp \
    src/fpdfdoc/doc_formfield.cpp \
    src/fpdfdoc/doc_link.cpp \
    src/fpdfdoc/doc_metadata.cpp \
    src/fpdfdoc/doc_ocg.cpp \
    src/fpdfdoc/doc_tagged.cpp \
    src/fpdfdoc/doc_utils.cpp \
    src/fpdfdoc/doc_viewerPreferences.cpp \
    src/fpdfdoc/doc_vt.cpp \
    src/fpdfdoc/doc_vtmodule.cpp

LOCAL_C_INCLUDES := \
    external/pdfium \
    external/freetype/include \
    external/freetype/include/freetype

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfpdfdoc := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfpdfdoc := $(addprefix build/$(_ARCH_PX_)/pdfiumfpdfdoc/, $(OBJS_pdfiumfpdfdoc))
	
libpdfiumfpdfdoc.a: $(OBJS_pdfiumfpdfdoc)
	$(AR) -rv libpdfiumfpdfdoc.a $(OBJS_pdfiumfpdfdoc)

build/$(_ARCH_PX_)/pdfiumfpdfdoc/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo