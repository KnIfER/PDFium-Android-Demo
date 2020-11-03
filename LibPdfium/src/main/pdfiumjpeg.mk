LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter -D_FX_OS_=1

LOCAL_SRC_FILES := \
	pdfium/third_party/libjpeg/fpdfapi_jcapimin.c \
	pdfium/third_party/libjpeg/fpdfapi_jcapistd.c \
	pdfium/third_party/libjpeg/fpdfapi_jccoefct.c \
	pdfium/third_party/libjpeg/fpdfapi_jccolor.c  \
	pdfium/third_party/libjpeg/fpdfapi_jcdctmgr.c \
	pdfium/third_party/libjpeg/fpdfapi_jchuff.c   \
	pdfium/third_party/libjpeg/fpdfapi_jcinit.c   \
	pdfium/third_party/libjpeg/fpdfapi_jcmainct.c \
	pdfium/third_party/libjpeg/fpdfapi_jcmarker.c \
	pdfium/third_party/libjpeg/fpdfapi_jcmaster.c \
	pdfium/third_party/libjpeg/fpdfapi_jcomapi.c  \
	pdfium/third_party/libjpeg/fpdfapi_jcparam.c  \
	pdfium/third_party/libjpeg/fpdfapi_jcphuff.c  \
	pdfium/third_party/libjpeg/fpdfapi_jcprepct.c \
	pdfium/third_party/libjpeg/fpdfapi_jcsample.c \
	pdfium/third_party/libjpeg/fpdfapi_jctrans.c  \
	pdfium/third_party/libjpeg/fpdfapi_jdapimin.c \
	pdfium/third_party/libjpeg/fpdfapi_jdapistd.c \
	pdfium/third_party/libjpeg/fpdfapi_jdcoefct.c \
	pdfium/third_party/libjpeg/fpdfapi_jdcolor.c  \
	pdfium/third_party/libjpeg/fpdfapi_jddctmgr.c \
	pdfium/third_party/libjpeg/fpdfapi_jdhuff.c   \
	pdfium/third_party/libjpeg/fpdfapi_jdinput.c  \
	pdfium/third_party/libjpeg/fpdfapi_jdmainct.c \
	pdfium/third_party/libjpeg/fpdfapi_jdmarker.c \
	pdfium/third_party/libjpeg/fpdfapi_jdmaster.c \
	pdfium/third_party/libjpeg/fpdfapi_jdmerge.c  \
	pdfium/third_party/libjpeg/fpdfapi_jdphuff.c  \
	pdfium/third_party/libjpeg/fpdfapi_jdpostct.c \
	pdfium/third_party/libjpeg/fpdfapi_jdsample.c \
	pdfium/third_party/libjpeg/fpdfapi_jdtrans.c  \
	pdfium/third_party/libjpeg/fpdfapi_jerror.c   \
	pdfium/third_party/libjpeg/fpdfapi_jfdctfst.c \
	pdfium/third_party/libjpeg/fpdfapi_jfdctint.c \
	pdfium/third_party/libjpeg/fpdfapi_jidctfst.c \
	pdfium/third_party/libjpeg/fpdfapi_jidctint.c \
	pdfium/third_party/libjpeg/fpdfapi_jidctred.c \
	pdfium/third_party/libjpeg/fpdfapi_jmemmgr.c  \
	pdfium/third_party/libjpeg/fpdfapi_jmemnobs.c \
	pdfium/third_party/libjpeg/fpdfapi_jutils.c   \
		
PWD = $(shell pwd)
PWDW = $(shell pwd | sed -E 's/^\/mnt\/([a-z])/\1:/g')
	
	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/libjpeg/ \
	
	
include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumjpeg := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumjpeg := $(addprefix build/$(_ARCH_PX_)/pdfiumjpeg/, $(OBJS_pdfiumjpeg))
	
libpdfiumjpeg.a: $(OBJS_pdfiumjpeg)
	$(AR) -rv libpdfiumjpeg.a $(OBJS_pdfiumjpeg)

build/$(_ARCH_PX_)/pdfiumjpeg/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	echo