LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumbigint

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

LOCAL_SRC_FILES := \
    bigint/BigInteger.cc \
    bigint/BigIntegerUtils.cc \
    bigint/BigUnsigned.cc \
    bigint/BigUnsignedInABase.cc

LOCAL_C_INCLUDES := \
    external/pdfium

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumbigint := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumbigint := $(addprefix build/$(_ARCH_PX_)/pdfiumbigint/, $(OBJS_pdfiumbigint))
	
libpdfiumbigint.a: $(OBJS_pdfiumbigint)
	$(AR) -rv libpdfiumbigint.a $(OBJS_pdfiumbigint)

build/$(_ARCH_PX_)/pdfiumbigint/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" -I$(LOCAL_C_INCLUDES)
	echo