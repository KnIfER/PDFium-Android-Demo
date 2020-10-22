LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumagg23

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-function

LOCAL_SRC_FILES := \
    agg23/agg_curves.cpp \
    agg23/agg_path_storage.cpp \
    agg23/agg_rasterizer_scanline_aa.cpp \
    agg23/agg_vcgen_dash.cpp \
    agg23/agg_vcgen_stroke.cpp \

LOCAL_C_INCLUDES := \
    external/pdfium

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumagg23 := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumagg23 := $(addprefix build/$(_ARCH_PX_)/pdfiumagg23/, $(OBJS_pdfiumagg23))
	
libpdfiumagg23.a: $(OBJS_pdfiumagg23)
	$(AR) -rv libpdfiumagg23.a $(OBJS_pdfiumagg23)

build/$(_ARCH_PX_)/pdfiumagg23/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" -I$(LOCAL_C_INCLUDES)
	echo