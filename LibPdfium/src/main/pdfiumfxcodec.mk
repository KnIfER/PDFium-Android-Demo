LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumfxcodec

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter  -DANDROID

LOCAL_SRC_FILES := \
    pdfium/core/fxcodec/basic/basicmodule.cpp \
    pdfium/core/fxcodec/cfx_codec_memory.cpp \
    pdfium/core/fxcodec/fax/faxmodule.cpp \
    pdfium/core/fxcodec/flate/flatemodule.cpp \
    pdfium/core/fxcodec/fx_codec.cpp \
    pdfium/core/fxcodec/icc/iccmodule.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_ArithDecoder.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_BitStream.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_Context.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_DocumentContext.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_GrdProc.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_GrrdProc.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_HtrdProc.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_HuffmanTable.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_Image.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_PatternDict.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_PddProc.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_SddProc.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_Segment.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_SymbolDict.cpp \
    pdfium/core/fxcodec/jbig2/JBig2_TrdProc.cpp \
    pdfium/core/fxcodec/jbig2/jbig2module.cpp \
    pdfium/core/fxcodec/jpeg/jpegmodule.cpp \
    pdfium/core/fxcodec/jpx/cjpx_decoder.cpp \
    pdfium/core/fxcodec/jpx/jpx_decode_utils.cpp \
    pdfium/core/fxcodec/jpx/jpxmodule.cpp \
    pdfium/core/fxcodec/scanlinedecoder.cpp \
	
	
	
PWD = $(shell pwd)
PWDW = $(shell pwd | sed -E 's/^\/mnt\/([a-z])/\1:/g')
	
	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/icu/source/i18n/ \
    -I$(PWDW)/pdfium/third_party/icu/source/common/ \

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfxcodec := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfxcodec := $(addprefix build/$(_ARCH_PX_)/pdfiumfxcodec/, $(OBJS_pdfiumfxcodec))
	
libpdfiumfxcodec.a: $(OBJS_pdfiumfxcodec)
	$(AR) -rv libpdfiumfxcodec.a $(OBJS_pdfiumfxcodec)

build/$(_ARCH_PX_)/pdfiumfxcodec/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	echo