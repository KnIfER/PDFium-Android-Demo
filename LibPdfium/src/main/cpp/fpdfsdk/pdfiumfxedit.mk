LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libpdfiumfxedit

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
    src/fxedit/fxet_ap.cpp \
    src/fxedit/fxet_edit.cpp \
    src/fxedit/fxet_list.cpp \
    src/fxedit/fxet_module.cpp \
    src/fxedit/fxet_pageobjs.cpp

LOCAL_C_INCLUDES := \
    -I../ \
    -I../../freetype/include \
    -I../../freetype/include/freetype
	
include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfxedit := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfxedit := $(addprefix build/$(_ARCH_PX_)/pdfiumfxedit/, $(OBJS_pdfiumfxedit))
ALLOBJS += $(OBJS_pdfiumfxedit)
	
libpdfiumfxedit.a: $(OBJS_pdfiumfxedit)
	$(AR) -rv libpdfiumfxedit.a $(OBJS_pdfiumfxedit)

build/$(_ARCH_PX_)/pdfiumfxedit/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo