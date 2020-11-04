LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumfpdfsdk

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter \
	-DCOMPONENT_BUILD -DFPDF_IMPLEMENTATION -DFPDFSDK_EXPORTS  -DANDROID

LOCAL_SRC_FILES := \
    pdfium/fpdfsdk/cpdfsdk_actionhandler.cpp \
    pdfium/fpdfsdk/cpdfsdk_annot.cpp \
    pdfium/fpdfsdk/cpdfsdk_annothandlermgr.cpp \
    pdfium/fpdfsdk/cpdfsdk_annotiteration.cpp \
    pdfium/fpdfsdk/cpdfsdk_annotiterator.cpp \
    pdfium/fpdfsdk/cpdfsdk_appstream.cpp \
    pdfium/fpdfsdk/cpdfsdk_baannot.cpp \
    pdfium/fpdfsdk/cpdfsdk_baannothandler.cpp \
    pdfium/fpdfsdk/cpdfsdk_customaccess.cpp \
    pdfium/fpdfsdk/cpdfsdk_fieldaction.cpp \
    pdfium/fpdfsdk/cpdfsdk_filewriteadapter.cpp \
    pdfium/fpdfsdk/cpdfsdk_formfillenvironment.cpp \
    pdfium/fpdfsdk/cpdfsdk_helpers.cpp \
    pdfium/fpdfsdk/cpdfsdk_interactiveform.cpp \
    pdfium/fpdfsdk/cpdfsdk_pageview.cpp \
    pdfium/fpdfsdk/cpdfsdk_pauseadapter.cpp \
    pdfium/fpdfsdk/cpdfsdk_renderpage.cpp \
    pdfium/fpdfsdk/cpdfsdk_widget.cpp \
    pdfium/fpdfsdk/cpdfsdk_widgethandler.cpp \
    pdfium/fpdfsdk/fpdf_annot.cpp \
    pdfium/fpdfsdk/fpdf_attachment.cpp \
    pdfium/fpdfsdk/fpdf_catalog.cpp \
    pdfium/fpdfsdk/fpdf_dataavail.cpp \
    pdfium/fpdfsdk/fpdf_doc.cpp \
    pdfium/fpdfsdk/fpdf_editimg.cpp \
    pdfium/fpdfsdk/fpdf_editpage.cpp \
    pdfium/fpdfsdk/fpdf_editpath.cpp \
    pdfium/fpdfsdk/fpdf_edittext.cpp \
    pdfium/fpdfsdk/fpdf_ext.cpp \
    pdfium/fpdfsdk/fpdf_flatten.cpp \
    pdfium/fpdfsdk/fpdf_formfill.cpp \
    pdfium/fpdfsdk/fpdf_javascript.cpp \
    pdfium/fpdfsdk/fpdf_ppo.cpp \
    pdfium/fpdfsdk/fpdf_progressive.cpp \
    pdfium/fpdfsdk/fpdf_save.cpp \
    pdfium/fpdfsdk/fpdf_searchex.cpp \
    pdfium/fpdfsdk/fpdf_structtree.cpp \
    pdfium/fpdfsdk/fpdf_sysfontinfo.cpp \
    pdfium/fpdfsdk/fpdf_text.cpp \
    pdfium/fpdfsdk/fpdf_thumbnail.cpp \
    pdfium/fpdfsdk/fpdf_transformpage.cpp \
    pdfium/fpdfsdk/fpdf_view.cpp \
	\
	pdfium/fpdfsdk/formfiller/cffl_button.cpp \
    pdfium/fpdfsdk/formfiller/cffl_checkbox.cpp \
    pdfium/fpdfsdk/formfiller/cffl_combobox.cpp \
    pdfium/fpdfsdk/formfiller/cffl_formfiller.cpp \
    pdfium/fpdfsdk/formfiller/cffl_interactiveformfiller.cpp \
    pdfium/fpdfsdk/formfiller/cffl_listbox.cpp \
    pdfium/fpdfsdk/formfiller/cffl_pushbutton.cpp \
    pdfium/fpdfsdk/formfiller/cffl_radiobutton.cpp \
    pdfium/fpdfsdk/formfiller/cffl_textfield.cpp \
    pdfium/fpdfsdk/formfiller/cffl_textobject.cpp \
	\
    pdfium/fpdfsdk/pwl/cpwl_button.cpp \
    pdfium/fpdfsdk/pwl/cpwl_caret.cpp \
    pdfium/fpdfsdk/pwl/cpwl_combo_box.cpp \
    pdfium/fpdfsdk/pwl/cpwl_edit.cpp \
    pdfium/fpdfsdk/pwl/cpwl_edit_ctrl.cpp \
    pdfium/fpdfsdk/pwl/cpwl_edit_impl.cpp \
    pdfium/fpdfsdk/pwl/cpwl_icon.cpp \
    pdfium/fpdfsdk/pwl/cpwl_list_box.cpp \
    pdfium/fpdfsdk/pwl/cpwl_list_impl.cpp \
    pdfium/fpdfsdk/pwl/cpwl_scroll_bar.cpp \
    pdfium/fpdfsdk/pwl/cpwl_special_button.cpp \
    pdfium/fpdfsdk/pwl/cpwl_wnd.cpp \
	\
	\
	\
	\
	

	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/icu/source/i18n/ \
    -I$(PWDW)/pdfium/third_party/icu/source/common/ \
    -I$(PWDW)/pdfium/third_party/freetype/src/include \

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfpdfsdk := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfpdfsdk := $(addprefix build/$(_ARCH_PX_)/pdfiumfpdfsdk/, $(OBJS_pdfiumfpdfsdk))
	
	
# libpdfium.a: $(OBJS_pdfiumfpdfsdk)
	# $(AR) -rv libpdfium.a $(OBJS_pdfiumfpdfsdk)

# libpdfium.so: $(OBJS_pdfiumfpdfsdk) $(pdfium_libs)
	# $(CC)++ -fPIC -shared -Wl,-soname,libpdfium.so -o libpdfium.so $(LOCAL_SRC_FILES) $(pdflibs_) -I"../" $(LOCAL_C_INCLUDES) $(pdfium_libs)

libpdfium.so: $(OBJS_pdfiumfpdfsdk) $(pdfium_libs)
	$(CC)++ -fPIC -shared -Wl,-soname,libpdfium.so -o libpdfium.so \
		-Wl,--whole-archive $(OBJS_pdfiumfpdfsdk)  $(pdfiumlibs) \
		-Wl,--no-whole-archive  $(pdfium_3rd_libs) \
		-I"../" $(LOCAL_C_INCLUDES) 


build/$(_ARCH_PX_)/pdfiumfpdfsdk/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	@echo ""
	@echo ""