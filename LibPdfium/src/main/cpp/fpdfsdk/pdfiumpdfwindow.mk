LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libpdfiumpdfwindow

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
    src/pdfwindow/PWL_Button.cpp \
    src/pdfwindow/PWL_Caret.cpp \
    src/pdfwindow/PWL_ComboBox.cpp \
    src/pdfwindow/PWL_Edit.cpp \
    src/pdfwindow/PWL_EditCtrl.cpp \
    src/pdfwindow/PWL_FontMap.cpp \
    src/pdfwindow/PWL_Icon.cpp \
    src/pdfwindow/PWL_IconList.cpp \
    src/pdfwindow/PWL_Label.cpp \
    src/pdfwindow/PWL_ListBox.cpp \
    src/pdfwindow/PWL_ListCtrl.cpp \
    src/pdfwindow/PWL_Note.cpp \
    src/pdfwindow/PWL_ScrollBar.cpp \
    src/pdfwindow/PWL_Signature.cpp \
    src/pdfwindow/PWL_SpecialButton.cpp \
    src/pdfwindow/PWL_Utils.cpp \
    src/pdfwindow/PWL_Wnd.cpp

LOCAL_C_INCLUDES := \
    -I../ \
    -I../../freetype/include \
    -I../../freetype/include/freetype

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumpdfwindow := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumpdfwindow := $(addprefix build/$(_ARCH_PX_)/pdfiumpdfwindow/, $(OBJS_pdfiumpdfwindow))
ALLOBJS += $(OBJS_pdfiumpdfwindow)
	
libpdfiumpdfwindow.a: $(OBJS_pdfiumpdfwindow)
	$(AR) -rv libpdfiumpdfwindow.a $(OBJS_pdfiumpdfwindow)

build/$(_ARCH_PX_)/pdfiumpdfwindow/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES)
	echo