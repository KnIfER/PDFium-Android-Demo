LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall -fPIC

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DADLER32_SIMD_NEON -DARMV8_OS_ANDROID -DINFLATE_CHUNK_SIMD_NEON 
	
ifeq ($(arch), arm64)
	LOCAL_CFLAGS += -DINFLATE_CHUNK_READ_64LE
endif

LOCAL_SRC_FILES := \
	pdfium/third_party/zlib/adler32.c \
	pdfium/third_party/zlib/compress.c \
	pdfium/third_party/zlib/crc32.c \
	pdfium/third_party/zlib/deflate.c \
	pdfium/third_party/zlib/gzclose.c \
	pdfium/third_party/zlib/gzlib.c \
	pdfium/third_party/zlib/gzread.c \
	pdfium/third_party/zlib/gzwrite.c \
	pdfium/third_party/zlib/infback.c \
	pdfium/third_party/zlib/inffast.c \
	pdfium/third_party/zlib/inftrees.c \
	pdfium/third_party/zlib/trees.c \
	pdfium/third_party/zlib/uncompr.c \
	pdfium/third_party/zlib/zutil.c \
	\
	pdfium/third_party/zlib/adler32_simd.c \
	\
	pdfium/third_party/zlib/arm_features.c \
	pdfium/third_party/zlib/crc32_simd.c \
	\
	pdfium/third_party/zlib/contrib/optimizations/inffast_chunk.c \
	pdfium/third_party/zlib/contrib/optimizations/inflate.c \
	\
	pdfium/third_party/zlib/simd_stub.c \
	
	
	
ZLIB_C_INCLUDES := \
    -I$(PWDW)/pdfium/third_party/zlib/ \
    -I$(PWDW)/pdfium/third_party/zlib/contrib\optimizations \
    -I$(NDKW)/sources/android/cpufeatures \

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumzlib := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumzlib := $(addprefix build/$(_ARCH_PX_)/pdfiumzlib/, $(OBJS_pdfiumzlib))
	
libpdfiumzlib.a: $(OBJS_pdfiumzlib)
	$(AR) -rv libpdfiumzlib.a $(OBJS_pdfiumzlib)

build/$(_ARCH_PX_)/pdfiumzlib/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(ZLIB_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""