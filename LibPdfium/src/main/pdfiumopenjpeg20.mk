LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall -fPIC

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter

LOCAL_SRC_FILES := \
    pdfium/third_party/libopenjpeg20/bio.c \
    pdfium/third_party/libopenjpeg20/cio.c \
    pdfium/third_party/libopenjpeg20/dwt.c \
    pdfium/third_party/libopenjpeg20/event.c \
    pdfium/third_party/libopenjpeg20/function_list.c \
    pdfium/third_party/libopenjpeg20/image.c \
    pdfium/third_party/libopenjpeg20/invert.c \
    pdfium/third_party/libopenjpeg20/j2k.c \
    pdfium/third_party/libopenjpeg20/jp2.c \
    pdfium/third_party/libopenjpeg20/mct.c \
    pdfium/third_party/libopenjpeg20/mqc.c \
    pdfium/third_party/libopenjpeg20/openjpeg.c \
    pdfium/third_party/libopenjpeg20/opj_clock.c \
    pdfium/third_party/libopenjpeg20/pi.c \
    pdfium/third_party/libopenjpeg20/sparse_array.c \
    pdfium/third_party/libopenjpeg20/t1.c \
    pdfium/third_party/libopenjpeg20/t2.c \
    pdfium/third_party/libopenjpeg20/tcd.c \
    pdfium/third_party/libopenjpeg20/tgt.c \
    pdfium/third_party/libopenjpeg20/thread.c \
	
	

LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/third_party/libopenjpeg20/ \
	
	
include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumopenjpeg20 := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumopenjpeg20 := $(addprefix build/$(_ARCH_PX_)/pdfiumopenjpeg20/, $(OBJS_pdfiumopenjpeg20))
	
libpdfiumopenjpeg20.a: $(OBJS_pdfiumopenjpeg20)
	$(AR) -rv libpdfiumopenjpeg20.a $(OBJS_pdfiumopenjpeg20)

build/$(_ARCH_PX_)/pdfiumopenjpeg20/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""