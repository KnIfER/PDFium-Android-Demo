LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter

LOCAL_SRC_FILES := \
    zlib_v128/adler32.c \
    zlib_v128/compress.c \
    zlib_v128/crc32.c \
    zlib_v128/deflate.c \
    zlib_v128/gzclose.c \
    zlib_v128/gzlib.c \
    zlib_v128/gzread.c \
    zlib_v128/gzwrite.c \
    zlib_v128/infback.c \
    zlib_v128/inffast.c \
    zlib_v128/inflate.c \
    zlib_v128/inftrees.c \
    zlib_v128/trees.c \
    zlib_v128/uncompr.c \
    zlib_v128/zutil.c

LOCAL_C_INCLUDES := \
    external/pdfium

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumzlib := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumzlib := $(addprefix build/$(_ARCH_PX_)/pdfiumzlib/, $(OBJS_pdfiumzlib))
	
libpdfiumzlib.a: $(OBJS_pdfiumzlib)
	$(AR) -rv libpdfiumzlib.a $(OBJS_pdfiumzlib)

build/$(_ARCH_PX_)/pdfiumzlib/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" -I$(LOCAL_C_INCLUDES)
	echo