LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libpdfiumfdrm

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
    src/fdrm/crypto/fx_crypt.cpp \
    src/fdrm/crypto/fx_crypt_aes.cpp \
    src/fdrm/crypto/fx_crypt_sha.cpp

LOCAL_C_INCLUDES := \
    -I../ \
    -I../../freetype/include \
    -I../../freetype/include/freetype

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfdrm := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfdrm := $(addprefix build/$(_ARCH_PX_)/pdfiumfdrm/, $(OBJS_pdfiumfdrm))
ALLOBJS += $(OBJS_pdfiumfdrm)
	
libpdfiumfdrm.a: $(OBJS_pdfiumfdrm)
	$(AR) -rv libpdfiumfdrm.a $(OBJS_pdfiumfdrm)

build/$(_ARCH_PX_)/pdfiumfdrm/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo