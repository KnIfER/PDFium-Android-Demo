LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfium_lib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LIBS_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LIBS_CFLAGS += -Wno-non-virtual-dtor -Wall -fPIC

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LIBS_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter -DANDROID

LOCAL_SRC_FILES := \
    pdfium/core/fdrm/fx_crypt.cpp \
    pdfium/core/fdrm/fx_crypt_aes.cpp \
    pdfium/core/fdrm/fx_crypt_sha.cpp \
	\
    pdfium/core/fpdfapi/cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/B5pc-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/B5pc-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/CNS-EUC-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/CNS-EUC-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/ETen-B5-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/ETen-B5-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/ETenms-B5-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/ETenms-B5-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/HKscs-B5-H_5.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/HKscs-B5-V_5.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-H_3.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-V_3.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/UniCNS-UTF16-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/CNS1/cmaps_cns1.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/Adobe-GB1-UCS2_5.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GB-EUC-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GB-EUC-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBK-EUC-H_2.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBK-EUC-V_2.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBK2K-H_5.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBK2K-V_5.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBKp-EUC-H_2.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBKp-EUC-V_2.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBpc-EUC-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/GBpc-EUC-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/UniGB-UCS2-H_4.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/UniGB-UCS2-V_4.cpp \
    pdfium/core/fpdfapi/cmaps/GB1/cmaps_gb1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/83pv-RKSJ-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/90ms-RKSJ-H_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/90ms-RKSJ-V_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/90msp-RKSJ-H_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/90msp-RKSJ-V_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/90pv-RKSJ-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/Add-RKSJ-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/Add-RKSJ-V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/EUC-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/EUC-V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/Ext-RKSJ-H_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/Ext-RKSJ-V_2.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-H_4.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-V_4.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Japan1/cmaps_japan1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSC-EUC-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSC-EUC-V_0.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSCms-UHC-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSCms-UHC-V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/KSCpc-EUC-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/UniKS-UCS2-H_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/UniKS-UCS2-V_1.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/UniKS-UTF16-H_0.cpp \
    pdfium/core/fpdfapi/cmaps/Korea1/cmaps_korea1.cpp \
    pdfium/core/fpdfapi/cmaps/fpdf_cmaps.cpp \
	\
    pdfium/core/fpdfapi/edit/cpdf_contentstream_write_utils.cpp \
    pdfium/core/fpdfapi/edit/cpdf_creator.cpp \
    pdfium/core/fpdfapi/edit/cpdf_pagecontentgenerator.cpp \
    pdfium/core/fpdfapi/edit/cpdf_pagecontentmanager.cpp \
    pdfium/core/fpdfapi/edit/cpdf_stringarchivestream.cpp \
	\
	pdfium/core/fpdfapi/font/cfx_cttgsubtable.cpp \
    pdfium/core/fpdfapi/font/cfx_stockfontarray.cpp \
    pdfium/core/fpdfapi/font/cpdf_cid2unicodemap.cpp \
    pdfium/core/fpdfapi/font/cpdf_cidfont.cpp \
    pdfium/core/fpdfapi/font/cpdf_cmap.cpp \
    pdfium/core/fpdfapi/font/cpdf_cmapmanager.cpp \
    pdfium/core/fpdfapi/font/cpdf_cmapparser.cpp \
    pdfium/core/fpdfapi/font/cpdf_font.cpp \
    pdfium/core/fpdfapi/font/cpdf_fontencoding.cpp \
    pdfium/core/fpdfapi/font/cpdf_fontglobals.cpp \
    pdfium/core/fpdfapi/font/cpdf_simplefont.cpp \
    pdfium/core/fpdfapi/font/cpdf_tounicodemap.cpp \
    pdfium/core/fpdfapi/font/cpdf_truetypefont.cpp \
    pdfium/core/fpdfapi/font/cpdf_type1font.cpp \
    pdfium/core/fpdfapi/font/cpdf_type3char.cpp \
    pdfium/core/fpdfapi/font/cpdf_type3font.cpp \
	\
    pdfium/core/fpdfapi/page/cpdf_allstates.cpp \
    pdfium/core/fpdfapi/page/cpdf_annotcontext.cpp \
    pdfium/core/fpdfapi/page/cpdf_clippath.cpp \
    pdfium/core/fpdfapi/page/cpdf_color.cpp \
    pdfium/core/fpdfapi/page/cpdf_colorspace.cpp \
    pdfium/core/fpdfapi/page/cpdf_colorstate.cpp \
    pdfium/core/fpdfapi/page/cpdf_contentmarkitem.cpp \
    pdfium/core/fpdfapi/page/cpdf_contentmarks.cpp \
    pdfium/core/fpdfapi/page/cpdf_contentparser.cpp \
    pdfium/core/fpdfapi/page/cpdf_devicecs.cpp \
    pdfium/core/fpdfapi/page/cpdf_dib.cpp \
    pdfium/core/fpdfapi/page/cpdf_docpagedata.cpp \
    pdfium/core/fpdfapi/page/cpdf_expintfunc.cpp \
    pdfium/core/fpdfapi/page/cpdf_form.cpp \
    pdfium/core/fpdfapi/page/cpdf_formobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_function.cpp \
    pdfium/core/fpdfapi/page/cpdf_generalstate.cpp \
    pdfium/core/fpdfapi/page/cpdf_graphicstates.cpp \
    pdfium/core/fpdfapi/page/cpdf_iccprofile.cpp \
    pdfium/core/fpdfapi/page/cpdf_image.cpp \
    pdfium/core/fpdfapi/page/cpdf_imageobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_meshstream.cpp \
    pdfium/core/fpdfapi/page/cpdf_occontext.cpp \
    pdfium/core/fpdfapi/page/cpdf_page.cpp \
    pdfium/core/fpdfapi/page/cpdf_pagemodule.cpp \
    pdfium/core/fpdfapi/page/cpdf_pageobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_pageobjectholder.cpp \
    pdfium/core/fpdfapi/page/cpdf_path.cpp \
    pdfium/core/fpdfapi/page/cpdf_pathobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_pattern.cpp \
    pdfium/core/fpdfapi/page/cpdf_patterncs.cpp \
    pdfium/core/fpdfapi/page/cpdf_psengine.cpp \
    pdfium/core/fpdfapi/page/cpdf_psfunc.cpp \
    pdfium/core/fpdfapi/page/cpdf_sampledfunc.cpp \
    pdfium/core/fpdfapi/page/cpdf_shadingobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_shadingpattern.cpp \
    pdfium/core/fpdfapi/page/cpdf_stitchfunc.cpp \
    pdfium/core/fpdfapi/page/cpdf_streamcontentparser.cpp \
    pdfium/core/fpdfapi/page/cpdf_streamparser.cpp \
    pdfium/core/fpdfapi/page/cpdf_textobject.cpp \
    pdfium/core/fpdfapi/page/cpdf_textstate.cpp \
    pdfium/core/fpdfapi/page/cpdf_tilingpattern.cpp \
    pdfium/core/fpdfapi/page/cpdf_transferfunc.cpp \
    pdfium/core/fpdfapi/page/cpdf_transferfuncdib.cpp \
    pdfium/core/fpdfapi/page/cpdf_transparency.cpp \
	\
    pdfium/core/fpdfapi/parser/cfdf_document.cpp \
    pdfium/core/fpdfapi/parser/cpdf_array.cpp \
    pdfium/core/fpdfapi/parser/cpdf_boolean.cpp \
    pdfium/core/fpdfapi/parser/cpdf_cross_ref_avail.cpp \
    pdfium/core/fpdfapi/parser/cpdf_cross_ref_table.cpp \
    pdfium/core/fpdfapi/parser/cpdf_crypto_handler.cpp \
    pdfium/core/fpdfapi/parser/cpdf_data_avail.cpp \
    pdfium/core/fpdfapi/parser/cpdf_dictionary.cpp \
    pdfium/core/fpdfapi/parser/cpdf_document.cpp \
    pdfium/core/fpdfapi/parser/cpdf_encryptor.cpp \
    pdfium/core/fpdfapi/parser/cpdf_flateencoder.cpp \
    pdfium/core/fpdfapi/parser/cpdf_hint_tables.cpp \
    pdfium/core/fpdfapi/parser/cpdf_indirect_object_holder.cpp \
    pdfium/core/fpdfapi/parser/cpdf_linearized_header.cpp \
    pdfium/core/fpdfapi/parser/cpdf_name.cpp \
    pdfium/core/fpdfapi/parser/cpdf_null.cpp \
    pdfium/core/fpdfapi/parser/cpdf_number.cpp \
    pdfium/core/fpdfapi/parser/cpdf_object.cpp \
    pdfium/core/fpdfapi/parser/cpdf_object_avail.cpp \
    pdfium/core/fpdfapi/parser/cpdf_object_stream.cpp \
    pdfium/core/fpdfapi/parser/cpdf_object_walker.cpp \
    pdfium/core/fpdfapi/parser/cpdf_page_object_avail.cpp \
    pdfium/core/fpdfapi/parser/cpdf_parser.cpp \
    pdfium/core/fpdfapi/parser/cpdf_read_validator.cpp \
    pdfium/core/fpdfapi/parser/cpdf_reference.cpp \
    pdfium/core/fpdfapi/parser/cpdf_security_handler.cpp \
    pdfium/core/fpdfapi/parser/cpdf_simple_parser.cpp \
    pdfium/core/fpdfapi/parser/cpdf_stream.cpp \
    pdfium/core/fpdfapi/parser/cpdf_stream_acc.cpp \
    pdfium/core/fpdfapi/parser/cpdf_string.cpp \
    pdfium/core/fpdfapi/parser/cpdf_syntax_parser.cpp \
    pdfium/core/fpdfapi/parser/fpdf_parser_decode.cpp \
    pdfium/core/fpdfapi/parser/fpdf_parser_utility.cpp \
	\
    pdfium/core/fpdfapi/render/cpdf_charposlist.cpp \
    pdfium/core/fpdfapi/render/cpdf_devicebuffer.cpp \
    pdfium/core/fpdfapi/render/cpdf_docrenderdata.cpp \
    pdfium/core/fpdfapi/render/cpdf_imagecacheentry.cpp \
    pdfium/core/fpdfapi/render/cpdf_imageloader.cpp \
    pdfium/core/fpdfapi/render/cpdf_imagerenderer.cpp \
    pdfium/core/fpdfapi/render/cpdf_pagerendercache.cpp \
    pdfium/core/fpdfapi/render/cpdf_pagerendercontext.cpp \
    pdfium/core/fpdfapi/render/cpdf_progressiverenderer.cpp \
    pdfium/core/fpdfapi/render/cpdf_rendercontext.cpp \
    pdfium/core/fpdfapi/render/cpdf_renderoptions.cpp \
    pdfium/core/fpdfapi/render/cpdf_rendershading.cpp \
    pdfium/core/fpdfapi/render/cpdf_renderstatus.cpp \
    pdfium/core/fpdfapi/render/cpdf_scaledrenderbuffer.cpp \
    pdfium/core/fpdfapi/render/cpdf_textrenderer.cpp \
    pdfium/core/fpdfapi/render/cpdf_type3cache.cpp \
    pdfium/core/fpdfapi/render/cpdf_type3glyphmap.cpp \
	\
	\
	pdfium/core/fpdfdoc/cba_fontmap.cpp \
    pdfium/core/fpdfdoc/cline.cpp \
    pdfium/core/fpdfdoc/cpdf_aaction.cpp \
    pdfium/core/fpdfdoc/cpdf_action.cpp \
    pdfium/core/fpdfdoc/cpdf_annot.cpp \
    pdfium/core/fpdfdoc/cpdf_annotlist.cpp \
    pdfium/core/fpdfdoc/cpdf_apsettings.cpp \
    pdfium/core/fpdfdoc/cpdf_bookmark.cpp \
    pdfium/core/fpdfdoc/cpdf_bookmarktree.cpp \
    pdfium/core/fpdfdoc/cpdf_color_utils.cpp \
    pdfium/core/fpdfdoc/cpdf_defaultappearance.cpp \
    pdfium/core/fpdfdoc/cpdf_dest.cpp \
    pdfium/core/fpdfdoc/cpdf_filespec.cpp \
    pdfium/core/fpdfdoc/cpdf_formcontrol.cpp \
    pdfium/core/fpdfdoc/cpdf_formfield.cpp \
    pdfium/core/fpdfdoc/cpdf_icon.cpp \
    pdfium/core/fpdfdoc/cpdf_iconfit.cpp \
    pdfium/core/fpdfdoc/cpdf_interactiveform.cpp \
    pdfium/core/fpdfdoc/cpdf_link.cpp \
    pdfium/core/fpdfdoc/cpdf_linklist.cpp \
    pdfium/core/fpdfdoc/cpdf_metadata.cpp \
    pdfium/core/fpdfdoc/cpdf_nametree.cpp \
    pdfium/core/fpdfdoc/cpdf_numbertree.cpp \
    pdfium/core/fpdfdoc/cpdf_pagelabel.cpp \
    pdfium/core/fpdfdoc/cpdf_structelement.cpp \
    pdfium/core/fpdfdoc/cpdf_structtree.cpp \
    pdfium/core/fpdfdoc/cpdf_variabletext.cpp \
    pdfium/core/fpdfdoc/cpdf_viewerpreferences.cpp \
    pdfium/core/fpdfdoc/cpvt_fontmap.cpp \
    pdfium/core/fpdfdoc/cpvt_generateap.cpp \
    pdfium/core/fpdfdoc/cpvt_wordinfo.cpp \
    pdfium/core/fpdfdoc/csection.cpp \
    pdfium/core/fpdfdoc/ctypeset.cpp \
	\
    pdfium/core/fpdftext/cpdf_linkextract.cpp \
    pdfium/core/fpdftext/cpdf_textpage.cpp \
    pdfium/core/fpdftext/cpdf_textpagefind.cpp \
    pdfium/core/fpdftext/unicodenormalizationdata.cpp \
	\
    pdfium/core/fxcrt/bytestring.cpp \
    pdfium/core/fxcrt/cfx_binarybuf.cpp \
    pdfium/core/fxcrt/cfx_bitstream.cpp \
    pdfium/core/fxcrt/cfx_datetime.cpp \
    pdfium/core/fxcrt/cfx_readonlymemorystream.cpp \
    pdfium/core/fxcrt/cfx_seekablestreamproxy.cpp \
    pdfium/core/fxcrt/cfx_timer.cpp \
    pdfium/core/fxcrt/cfx_utf8decoder.cpp \
    pdfium/core/fxcrt/cfx_utf8encoder.cpp \
    pdfium/core/fxcrt/cfx_widetextbuf.cpp \
    pdfium/core/fxcrt/fx_bidi.cpp \
    pdfium/core/fxcrt/fx_codepage.cpp \
    pdfium/core/fxcrt/fx_coordinates.cpp \
    pdfium/core/fxcrt/fx_extension.cpp \
    pdfium/core/fxcrt/fx_memory.cpp \
    pdfium/core/fxcrt/fx_number.cpp \
    pdfium/core/fxcrt/fx_random.cpp \
    pdfium/core/fxcrt/fx_stream.cpp \
    pdfium/core/fxcrt/fx_string.cpp \
    pdfium/core/fxcrt/fx_system.cpp \
    pdfium/core/fxcrt/fx_unicode.cpp \
    pdfium/core/fxcrt/observed_ptr.cpp \
    pdfium/core/fxcrt/widestring.cpp \
    pdfium/core/fxcrt/xml/cfx_xmlchardata.cpp \
    pdfium/core/fxcrt/xml/cfx_xmldocument.cpp \
    pdfium/core/fxcrt/xml/cfx_xmlelement.cpp \
    pdfium/core/fxcrt/xml/cfx_xmlinstruction.cpp \
    pdfium/core/fxcrt/xml/cfx_xmlnode.cpp \
    pdfium/core/fxcrt/xml/cfx_xmlparser.cpp \
    pdfium/core/fxcrt/xml/cfx_xmltext.cpp \
	\
    pdfium/core/fxcrt/css/cfx_csscolorvalue.cpp \
    pdfium/core/fxcrt/css/cfx_csscomputedstyle.cpp \
    pdfium/core/fxcrt/css/cfx_csscustomproperty.cpp \
    pdfium/core/fxcrt/css/cfx_cssdata.cpp \
    pdfium/core/fxcrt/css/cfx_cssdeclaration.cpp \
    pdfium/core/fxcrt/css/cfx_cssenumvalue.cpp \
    pdfium/core/fxcrt/css/cfx_cssexttextbuf.cpp \
    pdfium/core/fxcrt/css/cfx_cssnumbervalue.cpp \
    pdfium/core/fxcrt/css/cfx_csspropertyholder.cpp \
    pdfium/core/fxcrt/css/cfx_cssrulecollection.cpp \
    pdfium/core/fxcrt/css/cfx_cssselector.cpp \
    pdfium/core/fxcrt/css/cfx_cssstringvalue.cpp \
    pdfium/core/fxcrt/css/cfx_cssstylerule.cpp \
    pdfium/core/fxcrt/css/cfx_cssstyleselector.cpp \
    pdfium/core/fxcrt/css/cfx_cssstylesheet.cpp \
    pdfium/core/fxcrt/css/cfx_csssyntaxparser.cpp \
    pdfium/core/fxcrt/css/cfx_csstextbuf.cpp \
    pdfium/core/fxcrt/css/cfx_cssvalue.cpp \
    pdfium/core/fxcrt/css/cfx_cssvaluelist.cpp \
    pdfium/core/fxcrt/css/cfx_cssvaluelistparser.cpp \
	\
    pdfium/core/fxcrt/cfx_fileaccess_posix.cpp \
	\
	\
	pdfium/core/fxge/cfx_cliprgn.cpp \
    pdfium/core/fxge/cfx_color.cpp \
    pdfium/core/fxge/cfx_face.cpp \
    pdfium/core/fxge/cfx_folderfontinfo.cpp \
    pdfium/core/fxge/cfx_font.cpp \
    pdfium/core/fxge/cfx_fontcache.cpp \
    pdfium/core/fxge/cfx_fontmapper.cpp \
    pdfium/core/fxge/cfx_fontmgr.cpp \
    pdfium/core/fxge/cfx_gemodule.cpp \
    pdfium/core/fxge/cfx_glyphbitmap.cpp \
    pdfium/core/fxge/cfx_glyphcache.cpp \
    pdfium/core/fxge/cfx_graphstate.cpp \
    pdfium/core/fxge/cfx_graphstatedata.cpp \
    pdfium/core/fxge/cfx_pathdata.cpp \
    pdfium/core/fxge/cfx_renderdevice.cpp \
    pdfium/core/fxge/cfx_substfont.cpp \
    pdfium/core/fxge/cfx_unicodeencoding.cpp \
    pdfium/core/fxge/dib/cfx_bitmapcomposer.cpp \
    pdfium/core/fxge/dib/cfx_bitmapstorer.cpp \
    pdfium/core/fxge/dib/cfx_cmyk_to_srgb.cpp \
    pdfium/core/fxge/dib/cfx_dibbase.cpp \
    pdfium/core/fxge/dib/cfx_dibitmap.cpp \
    pdfium/core/fxge/dib/cfx_imagerenderer.cpp \
    pdfium/core/fxge/dib/cfx_imagestretcher.cpp \
    pdfium/core/fxge/dib/cfx_imagetransformer.cpp \
    pdfium/core/fxge/dib/cfx_scanlinecompositor.cpp \
    pdfium/core/fxge/dib/cstretchengine.cpp \
    pdfium/core/fxge/dib/fx_dib_main.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitDingbats.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitFixed.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitFixedBold.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitFixedItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSans.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSansBold.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSansItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSansMM.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSerif.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSerifBold.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSerifItalic.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSerifMM.cpp \
    pdfium/core/fxge/fontdata/chromefontdata/FoxitSymbol.cpp \
    pdfium/core/fxge/freetype/fx_freetype.cpp \
    pdfium/core/fxge/fx_font.cpp \
    pdfium/core/fxge/fx_ge_fontmap.cpp \
    pdfium/core/fxge/renderdevicedriver_iface.cpp \
    pdfium/core/fxge/scoped_font_transform.cpp \
    pdfium/core/fxge/text_char_pos.cpp \
    pdfium/core/fxge/text_glyph_pos.cpp \
	\
    pdfium/core/fxge/android/cfpf_skiadevicemodule.cpp \
    pdfium/core/fxge/android/cfpf_skiafont.cpp \
    pdfium/core/fxge/android/cfpf_skiafontmgr.cpp \
    pdfium/core/fxge/android/cfpf_skiapathfont.cpp \
    pdfium/core/fxge/android/cfx_androidfontinfo.cpp \
    pdfium/core/fxge/android/fx_android_imp.cpp \
	\
    pdfium/core/fxge/agg/fx_agg_driver.cpp \
	\
	pdfium/third_party/skia_shared/SkFloatToDecimal.cpp\
	\
    pdfium/fxjs/cjs_event_context_stub.cpp \
    pdfium/fxjs/cjs_runtimestub.cpp \
    pdfium/fxjs/ijs_runtime.cpp \
	\
	
CPU_FEAT := \
    $(NDKW)/sources/android/cpufeatures/cpu-features.c
	
	
LIBS_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/icu/source/i18n/ \
    -I$(PWDW)/pdfium/third_party/icu/source/common/ \
    -I$(PWDW)/pdfium/third_party/freetype/src/include \
    -I$(PWDW)/pdfium/third_party/skia_shared/ \
    -I$(SYSROOTW)/usr/include \


include $(BUILD_STATIC_LIBRARY)

OBJS_pdfium_lib := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfium_lib := $(addprefix build/$(_ARCH_PX_)/pdfium_lib/, $(OBJS_pdfium_lib))
	
libpdfium_lib.a: libpdfiumbase.a libpdfiumfreetype.a $(OBJS_pdfium_lib) build/$(_ARCH_PX_)/pdfium_lib/CPU_FEAT.o
	$(AR) -rv libpdfium_lib.a $(OBJS_pdfium_lib) libpdfiumbase.a libpdfiumfreetype.a build/$(_ARCH_PX_)/pdfium_lib/CPU_FEAT.o
	
build/$(_ARCH_PX_)/pdfium_lib/CPU_FEAT.o : 
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $(CPU_FEAT) -o $(@) -I"../" -I$(dir $CPU_FEAT) $(LIBS_C_INCLUDES) $(LIBS_CFLAGS)
	echo
	
build/$(_ARCH_PX_)/pdfium_lib/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC)++ -c -O3 $< -o $(@) -I"../" $(LIBS_C_INCLUDES) $(LIBS_CFLAGS)
	@echo ""
	@echo ""