LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DADLER32_SIMD_NEON -DARMV8_OS_ANDROID -DINFLATE_CHUNK_SIMD_NEON -DINFLATE_CHUNK_READ_64LE

LOCAL_SRC_FILES := \
    pdfium/third_party/lcms/src/cmsalpha.c \
    pdfium/third_party/lcms/src/cmscam02.c \
    pdfium/third_party/lcms/src/cmscgats.c \
    pdfium/third_party/lcms/src/cmscnvrt.c \
    pdfium/third_party/lcms/src/cmserr.c \
    pdfium/third_party/lcms/src/cmsgamma.c \
    pdfium/third_party/lcms/src/cmsgmt.c \
    pdfium/third_party/lcms/src/cmshalf.c \
    pdfium/third_party/lcms/src/cmsintrp.c \
    pdfium/third_party/lcms/src/cmsio0.c \
    pdfium/third_party/lcms/src/cmsio1.c \
    pdfium/third_party/lcms/src/cmslut.c \
    pdfium/third_party/lcms/src/cmsmd5.c \
    pdfium/third_party/lcms/src/cmsmtrx.c \
    pdfium/third_party/lcms/src/cmsnamed.c \
    pdfium/third_party/lcms/src/cmsopt.c \
    pdfium/third_party/lcms/src/cmspack.c \
    pdfium/third_party/lcms/src/cmspcs.c \
    pdfium/third_party/lcms/src/cmsplugin.c \
    pdfium/third_party/lcms/src/cmsps2.c \
    pdfium/third_party/lcms/src/cmssamp.c \
    pdfium/third_party/lcms/src/cmssm.c \
    pdfium/third_party/lcms/src/cmstypes.c \
    pdfium/third_party/lcms/src/cmsvirt.c \
    pdfium/third_party/lcms/src/cmswtpnt.c \
    pdfium/third_party/lcms/src/cmsxform.c \
	
	
	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/lcms/ \
    -I$(PWDW)/pdfium/third_party/lcms/include \
	
	
include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumlcms := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumlcms := $(addprefix build/$(_ARCH_PX_)/pdfiumlcms/, $(OBJS_pdfiumlcms))
	
libpdfiumlcms.a: $(OBJS_pdfiumlcms)
	$(AR) -rv libpdfiumlcms.a $(OBJS_pdfiumlcms)

build/$(_ARCH_PX_)/pdfiumlcms/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""