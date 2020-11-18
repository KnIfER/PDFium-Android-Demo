LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumfreetype

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall -fPIC

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DFT2_BUILD_LIBRARY

LOCAL_SRC_FILES := \
    pdfium/third_party/freetype/src/src/base/ftbase.c \
    pdfium/third_party/freetype/src/src/base/ftbitmap.c \
    pdfium/third_party/freetype/src/src/base/ftdebug.c \
    pdfium/third_party/freetype/src/src/base/ftglyph.c \
    pdfium/third_party/freetype/src/src/base/ftinit.c \
    pdfium/third_party/freetype/src/src/base/ftmm.c \
    pdfium/third_party/freetype/src/src/base/ftsystem.c \
    pdfium/third_party/freetype/src/src/cff/cff.c \
    pdfium/third_party/freetype/src/src/cid/type1cid.c \
    pdfium/third_party/freetype/src/src/psaux/psaux.c \
    pdfium/third_party/freetype/src/src/pshinter/pshinter.c \
    pdfium/third_party/freetype/src/src/psnames/psmodule.c \
    pdfium/third_party/freetype/src/src/raster/raster.c \
    pdfium/third_party/freetype/src/src/sfnt/sfnt.c \
    pdfium/third_party/freetype/src/src/smooth/smooth.c \
    pdfium/third_party/freetype/src/src/truetype/truetype.c \
    pdfium/third_party/freetype/src/src/type1/type1.c \
	

	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/third_party/freetype/ \
    -I$(PWDW)/pdfium/third_party/freetype/include \
    -I$(PWDW)/pdfium/third_party/freetype/src/include \
    -I$(PWDW)/pdfium/third_party/freetype/src/include/freetype \
    -I$(PWDW)/pdfium/third_party/freetype/src/include/freetype/internal \
    -I$(PWDW)/pdfium/third_party/freetype/src/include/freetype/internal/services \
    -I$(PWDW)/pdfium/third_party/freetype/src/src/ \
    -I$(PWDW)/pdfium/third_party/freetype/src/src/base \
    -I$(PWDW)/pdfium/third_party/freetype/src/src/cff \
	

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfreetype := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfreetype := $(addprefix build/$(_ARCH_PX_)/pdfiumfreetype/, $(OBJS_pdfiumfreetype))
	
libpdfiumfreetype.a: $(OBJS_pdfiumfreetype)
	$(AR) -rv libpdfiumfreetype.a $(OBJS_pdfiumfreetype)

build/$(_ARCH_PX_)/pdfiumfreetype/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""