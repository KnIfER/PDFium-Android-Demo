LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libpdfiumfpdftext

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
    src/fpdftext/fpdf_text.cpp \
    src/fpdftext/fpdf_text_int.cpp \
    src/fpdftext/fpdf_text_search.cpp \
    src/fpdftext/unicodenormalization.cpp \
    src/fpdftext/unicodenormalizationdata.cpp \

LOCAL_C_INCLUDES := \
    external/pdfium \
    external/freetype/include \
    external/freetype/include/freetype

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfpdftext := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfpdftext := $(addprefix build/$(_ARCH_PX_)/pdfiumfpdftext/, $(OBJS_pdfiumfpdftext))
	
libpdfiumfpdftext.a: $(OBJS_pdfiumfpdftext)
	$(AR) -rv libpdfiumfpdftext.a $(OBJS_pdfiumfpdftext)

build/$(_ARCH_PX_)/pdfiumfpdftext/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo