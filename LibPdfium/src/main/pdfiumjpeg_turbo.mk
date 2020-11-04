LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumjpeg_turbo

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DELF -DWITH_SIMD -DNO_GETENV

LOCAL_SRC_FILES := \
	pdfium/third_party/libjpeg_turbo/simd/arm/arm64/jsimd.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/arm64/jsimd_neon.S \
	\
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jdcolor-neon.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jdmerge-neon.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jdsample-neon.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jidctfst-neon.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jidctint-neon.c \
	pdfium/third_party/libjpeg_turbo/simd/arm/common/jidctred-neon.c \
	\
    pdfium/third_party/libjpeg_turbo/jcapimin.c \
    pdfium/third_party/libjpeg_turbo/jcapistd.c \
    pdfium/third_party/libjpeg_turbo/jccoefct.c \
    pdfium/third_party/libjpeg_turbo/jccolor.c \
    pdfium/third_party/libjpeg_turbo/jcdctmgr.c \
    pdfium/third_party/libjpeg_turbo/jchuff.c \
    pdfium/third_party/libjpeg_turbo/jcicc.c \
    pdfium/third_party/libjpeg_turbo/jcinit.c \
    pdfium/third_party/libjpeg_turbo/jcmainct.c \
    pdfium/third_party/libjpeg_turbo/jcmarker.c \
    pdfium/third_party/libjpeg_turbo/jcmaster.c \
    pdfium/third_party/libjpeg_turbo/jcomapi.c \
    pdfium/third_party/libjpeg_turbo/jcparam.c \
    pdfium/third_party/libjpeg_turbo/jcphuff.c \
    pdfium/third_party/libjpeg_turbo/jcprepct.c \
    pdfium/third_party/libjpeg_turbo/jcsample.c \
    pdfium/third_party/libjpeg_turbo/jctrans.c \
    pdfium/third_party/libjpeg_turbo/jdapimin.c \
    pdfium/third_party/libjpeg_turbo/jdapistd.c \
    pdfium/third_party/libjpeg_turbo/jdatadst.c \
    pdfium/third_party/libjpeg_turbo/jdatasrc.c \
    pdfium/third_party/libjpeg_turbo/jdcoefct.c \
    pdfium/third_party/libjpeg_turbo/jdcolor.c \
    pdfium/third_party/libjpeg_turbo/jddctmgr.c \
    pdfium/third_party/libjpeg_turbo/jdhuff.c \
    pdfium/third_party/libjpeg_turbo/jdicc.c \
    pdfium/third_party/libjpeg_turbo/jdinput.c \
    pdfium/third_party/libjpeg_turbo/jdmainct.c \
    pdfium/third_party/libjpeg_turbo/jdmarker.c \
    pdfium/third_party/libjpeg_turbo/jdmaster.c \
    pdfium/third_party/libjpeg_turbo/jdmerge.c \
    pdfium/third_party/libjpeg_turbo/jdphuff.c \
    pdfium/third_party/libjpeg_turbo/jdpostct.c \
    pdfium/third_party/libjpeg_turbo/jdsample.c \
    pdfium/third_party/libjpeg_turbo/jdtrans.c \
    pdfium/third_party/libjpeg_turbo/jerror.c \
    pdfium/third_party/libjpeg_turbo/jfdctflt.c \
    pdfium/third_party/libjpeg_turbo/jfdctfst.c \
    pdfium/third_party/libjpeg_turbo/jfdctint.c \
    pdfium/third_party/libjpeg_turbo/jidctflt.c \
    pdfium/third_party/libjpeg_turbo/jidctfst.c \
    pdfium/third_party/libjpeg_turbo/jidctint.c \
    pdfium/third_party/libjpeg_turbo/jidctred.c \
    pdfium/third_party/libjpeg_turbo/jmemmgr.c \
    pdfium/third_party/libjpeg_turbo/jmemnobs.c \
    pdfium/third_party/libjpeg_turbo/jpeg_nbits_table.c \
    pdfium/third_party/libjpeg_turbo/jquant1.c \
    pdfium/third_party/libjpeg_turbo/jquant2.c \
    pdfium/third_party/libjpeg_turbo/jutils.c \
	

	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/third_party/libjpeg_turbo/ \

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumjpeg_turbo := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumjpeg_turbo := $(addprefix build/$(_ARCH_PX_)/pdfiumjpeg_turbo/, $(OBJS_pdfiumjpeg_turbo))
	
libpdfiumjpeg_turbo.a: $(OBJS_pdfiumjpeg_turbo)
	$(AR) -rv libpdfiumjpeg_turbo.a $(OBJS_pdfiumjpeg_turbo)

# build/$(_ARCH_PX_)/pdfiumjpeg_turbo/pdfium/third_party/libjpeg_turbo/simd/arm/arm64/jsimd_neon.S.o: pdfium/third_party/libjpeg_turbo/simd/arm/arm64/jsimd_neon.S
	# $(NDK)/nasm.exe $<
	

build/$(_ARCH_PX_)/pdfiumjpeg_turbo/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""