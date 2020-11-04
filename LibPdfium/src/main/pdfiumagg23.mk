LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumagg23

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DADLER32_SIMD_NEON -DARMV8_OS_ANDROID -DINFLATE_CHUNK_SIMD_NEON -DINFLATE_CHUNK_READ_64LE

LOCAL_SRC_FILES := \
	pdfium/third_party/agg23/agg_curves.cpp \
	pdfium/third_party/agg23/agg_path_storage.cpp \
	pdfium/third_party/agg23/agg_rasterizer_scanline_aa.cpp \
	pdfium/third_party/agg23/agg_vcgen_dash.cpp \
	pdfium/third_party/agg23/agg_vcgen_stroke.cpp \
	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/third_party/agg23/ \
    -I$(PWDW)/pdfium/third_party/agg23/contrib\optimizations \
    -I$(NDKW)/sources/android/cpufeatures \

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumagg23 := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumagg23 := $(addprefix build/$(_ARCH_PX_)/pdfiumagg23/, $(OBJS_pdfiumagg23))
	
libpdfiumagg23.a: $(OBJS_pdfiumagg23)
	$(AR) -rv libpdfiumagg23.a $(OBJS_pdfiumagg23)

build/$(_ARCH_PX_)/pdfiumagg23/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""