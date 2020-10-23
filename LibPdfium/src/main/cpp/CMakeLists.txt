# 打印语句
# message([SEND_ERROR | STATUS | FATAL_ERROR] message to display ...)
# 批量指定源文件
# file(GLOB_RECURSE pdfium_core_src ${SRC_HOME_PATH}/core/*.cpp)


cmake_minimum_required(VERSION 3.4.1)

set(SRC_HOME_PATH ${CMAKE_CURRENT_SOURCE_DIR})
message(STATUS src dir : ${SRC_HOME_PATH})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11 -fexceptions -frtti")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DHAVE_PTHREADS")


# 指定头文件目录
include_directories (
    ${SRC_HOME_PATH}/../PDFIUM/
    ${SRC_HOME_PATH}/../PDFIUM/public
    ${SRC_HOME_PATH}/../PDFIUM/third_party/freetype/include
    ${SRC_HOME_PATH}/../PDFIUM/third_party/freetype/include/freetype )

add_library (fdrm STATIC
    ../PDFIUM/core/src/fdrm/crypto/fx_crypt.cpp
    ../PDFIUM/core/src/fdrm/crypto/fx_crypt_aes.cpp
    ../PDFIUM/core/src/fdrm/crypto/fx_crypt_sha.cpp
)

add_library ( fpdfdoc STATIC
    ../PDFIUM/core/src/fpdfdoc/doc_action.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_annot.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_ap.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_basic.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_bookmark.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_form.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_formcontrol.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_formfield.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_link.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_metadata.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_ocg.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_tagged.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_utils.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_viewerPreferences.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_vt.cpp
    ../PDFIUM/core/src/fpdfdoc/doc_vtmodule.cpp
)


add_library ( fpdfapi STATIC
    ../PDFIUM/core/src/fpdfapi/fpdf_basic_module.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/cmaps_cns1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-H_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-V_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-H_3.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-V_3.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UTF16-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/fpdf_cmaps.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/Adobe-GB1-UCS2_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/cmaps_gb1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-H_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-V_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-H_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-V_5.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-H_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-V_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-H_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-V_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/83pv-RKSJ-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-H_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-V_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-H_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-V_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/90pv-RKSJ-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/cmaps_japan1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-H_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-V_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-H_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-V_4.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Japan1/V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/cmaps_korea1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-V_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/KSCpc-EUC-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-H_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-V_1.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UTF16-H_0.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_edit/fpdf_edit_content.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_edit/fpdf_edit_create.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_edit/fpdf_edit_doc.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_edit/fpdf_edit_image.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_font/fpdf_font.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_font/fpdf_font_charset.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_font/fpdf_font_cid.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_font/ttgsubtable.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_colors.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_doc.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_func.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_graph_state.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_image.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_parser.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_parser_old.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_path.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_page/fpdf_page_pattern.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_decode.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_document.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_encrypt.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_fdf.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_objects.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_parser.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_parser/fpdf_parser_utility.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render_cache.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render_image.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render_loadimage.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render_pattern.cpp
    ../PDFIUM/core/src/fpdfapi/fpdf_render/fpdf_render_text.cpp
)

add_library(fpdftext STATIC
    ../PDFIUM/core/src/fpdftext/fpdf_text.cpp
    ../PDFIUM/core/src/fpdftext/fpdf_text_int.cpp
    ../PDFIUM/core/src/fpdftext/fpdf_text_search.cpp
    ../PDFIUM/core/src/fpdftext/unicodenormalization.cpp
    ../PDFIUM/core/src/fpdftext/unicodenormalizationdata.cpp
)


add_library(libjpeg STATIC
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcapimin.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcapistd.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jccoefct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jccolor.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcdctmgr.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jchuff.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcinit.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcmainct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcmarker.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcmaster.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcomapi.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcparam.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcphuff.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcprepct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jcsample.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jctrans.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdapimin.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdapistd.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdcoefct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdcolor.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jddctmgr.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdhuff.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdinput.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdmainct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdmarker.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdmaster.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdmerge.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdphuff.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdpostct.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdsample.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jdtrans.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jerror.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jfdctfst.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jfdctint.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jidctfst.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jidctint.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jidctred.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jmemmgr.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jmemnobs.c
    ../PDFIUM/third_party/libjpeg/fpdfapi_jutils.c
)

add_library(fx_lcms2 STATIC
    ../PDFIUM/third_party/lcms2-2.6/src/cmscam02.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmscgats.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmscnvrt.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmserr.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsgamma.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsgmt.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmshalf.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsintrp.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsio0.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsio1.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmslut.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsmd5.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsmtrx.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsnamed.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsopt.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmspack.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmspcs.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsplugin.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsps2.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmssamp.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmssm.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmstypes.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsvirt.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmswtpnt.c
    ../PDFIUM/third_party/lcms2-2.6/src/cmsxform.c
)


add_library(fx_libopenjpeg STATIC
    ../PDFIUM/third_party/libopenjpeg20/bio.c
    ../PDFIUM/third_party/libopenjpeg20/cio.c
    ../PDFIUM/third_party/libopenjpeg20/dwt.c
    ../PDFIUM/third_party/libopenjpeg20/event.c
    ../PDFIUM/third_party/libopenjpeg20/function_list.c
    ../PDFIUM/third_party/libopenjpeg20/image.c
    ../PDFIUM/third_party/libopenjpeg20/invert.c
    ../PDFIUM/third_party/libopenjpeg20/j2k.c
    ../PDFIUM/third_party/libopenjpeg20/jp2.c
    ../PDFIUM/third_party/libopenjpeg20/mct.c
    ../PDFIUM/third_party/libopenjpeg20/mqc.c
    ../PDFIUM/third_party/libopenjpeg20/openjpeg.c
    ../PDFIUM/third_party/libopenjpeg20/opj_clock.c
    ../PDFIUM/third_party/libopenjpeg20/pi.c
    ../PDFIUM/third_party/libopenjpeg20/raw.c
    ../PDFIUM/third_party/libopenjpeg20/t1.c
    ../PDFIUM/third_party/libopenjpeg20/t2.c
    ../PDFIUM/third_party/libopenjpeg20/tcd.c
    ../PDFIUM/third_party/libopenjpeg20/tgt.c

)


add_library(fx_zlib STATIC
    ../PDFIUM/third_party/zlib_v128/adler32.c
    ../PDFIUM/third_party/zlib_v128/compress.c
    ../PDFIUM/third_party/zlib_v128/crc32.c
    ../PDFIUM/third_party/zlib_v128/deflate.c
    ../PDFIUM/third_party/zlib_v128/gzclose.c
    ../PDFIUM/third_party/zlib_v128/gzlib.c
    ../PDFIUM/third_party/zlib_v128/gzread.c
    ../PDFIUM/third_party/zlib_v128/gzwrite.c
    ../PDFIUM/third_party/zlib_v128/infback.c
    ../PDFIUM/third_party/zlib_v128/inffast.c
    ../PDFIUM/third_party/zlib_v128/inflate.c
    ../PDFIUM/third_party/zlib_v128/inftrees.c
    ../PDFIUM/third_party/zlib_v128/trees.c
    ../PDFIUM/third_party/zlib_v128/uncompr.c
    ../PDFIUM/third_party/zlib_v128/zutil.c
)

add_library(fx_agg32 STATIC
    ../PDFIUM/third_party/agg23/agg_curves.cpp
    ../PDFIUM/third_party/agg23/agg_path_storage.cpp
    ../PDFIUM/third_party/agg23/agg_rasterizer_scanline_aa.cpp
    ../PDFIUM/third_party/agg23/agg_vcgen_dash.cpp
    ../PDFIUM/third_party/agg23/agg_vcgen_stroke.cpp
)


add_library(fxcodec STATIC
    ../PDFIUM/core/src/fxcodec/codec/fx_codec.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_fax.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_flate.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_icc.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_jbig.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_jpeg.cpp
    ../PDFIUM/core/src/fxcodec/codec/fx_codec_jpx_opj.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_ArithDecoder.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_BitStream.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_Context.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_GrdProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_GrrdProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_GsidProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_HtrdProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_HuffmanTable.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_Image.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_PatternDict.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_PddProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_SddProc.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_Segment.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_SymbolDict.cpp
    ../PDFIUM/core/src/fxcodec/jbig2/JBig2_TrdProc.cpp
)


add_library(fxcrt STATIC
    ../PDFIUM/core/src/fxcrt/fxcrt_platforms.cpp
    ../PDFIUM/core/src/fxcrt/fxcrt_posix.cpp
    ../PDFIUM/core/src/fxcrt/fxcrt_windows.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_array.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_bstring.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_buffer.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_coords.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_gcc.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_list.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_maps.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_memmgr.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_plex.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_utf.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_util.cpp
    ../PDFIUM/core/src/fxcrt/fx_basic_wstring.cpp
    ../PDFIUM/core/src/fxcrt/fx_bidi.cpp
    ../PDFIUM/core/src/fxcrt/fx_extension.cpp
    ../PDFIUM/core/src/fxcrt/fx_ucddata.cpp
    ../PDFIUM/core/src/fxcrt/fx_unicode.cpp
    ../PDFIUM/core/src/fxcrt/fx_xml_composer.cpp
    ../PDFIUM/core/src/fxcrt/fx_xml_parser.cpp
)


add_library(fxge STATIC
    ../PDFIUM/core/src/fxge/agg/src/fx_agg_driver.cpp
    ../PDFIUM/core/src/fxge/android/fpf_skiafont.cpp
    ../PDFIUM/core/src/fxge/android/fpf_skiafontmgr.cpp
    ../PDFIUM/core/src/fxge/android/fpf_skiamodule.cpp
    ../PDFIUM/core/src/fxge/android/fx_android_font.cpp
    ../PDFIUM/core/src/fxge/android/fx_android_imp.cpp
    ../PDFIUM/core/src/fxge/apple/fx_apple_platform.cpp
    ../PDFIUM/core/src/fxge/apple/fx_mac_imp.cpp
    ../PDFIUM/core/src/fxge/apple/fx_quartz_device.cpp
    ../PDFIUM/core/src/fxge/dib/fx_dib_composite.cpp
    ../PDFIUM/core/src/fxge/dib/fx_dib_convert.cpp
    ../PDFIUM/core/src/fxge/dib/fx_dib_engine.cpp
    ../PDFIUM/core/src/fxge/dib/fx_dib_main.cpp
    ../PDFIUM/core/src/fxge/dib/fx_dib_transform.cpp
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitDingbats.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitFixed.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitFixedBold.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitFixedItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSans.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSansBold.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSansItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSansMM.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSerif.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSerifBold.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSerifItalic.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSerifMM.c
    ../PDFIUM/core/src/fxge/fontdata/chromefontdata/FoxitSymbol.c
    ../PDFIUM/core/src/fxge/freetype/fx_freetype.c
    ../PDFIUM/core/src/fxge/ge/fx_ge.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_device.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_font.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_fontmap.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_linux.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_path.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_ps.cpp
    ../PDFIUM/core/src/fxge/ge/fx_ge_text.cpp

)


add_library(fxedit STATIC
    ../PDFIUM/fpdfsdk/src/fxedit/fxet_ap.cpp
    ../PDFIUM/fpdfsdk/src/fxedit/fxet_edit.cpp
    ../PDFIUM/fpdfsdk/src/fxedit/fxet_list.cpp
    ../PDFIUM/fpdfsdk/src/fxedit/fxet_module.cpp
    ../PDFIUM/fpdfsdk/src/fxedit/fxet_pageobjs.cpp
)


# file(GLOB_RECURSE freetype_src ${SRC_HOME_PATH}/third_party/freetype/src/*.c)
add_library(fx_freetype STATIC
    ../PDFIUM/third_party/freetype/src/base/ftbase.c
    ../PDFIUM/third_party/freetype/src/base/ftbitmap.c
    ../PDFIUM/third_party/freetype/src/base/ftglyph.c
    ../PDFIUM/third_party/freetype/src/base/ftinit.c
    ../PDFIUM/third_party/freetype/src/base/ftlcdfil.c
    ../PDFIUM/third_party/freetype/src/base/ftmm.c
    ../PDFIUM/third_party/freetype/src/base/ftsystem.c
    ../PDFIUM/third_party/freetype/src/cff/cff.c
    ../PDFIUM/third_party/freetype/src/cid/type1cid.c
    ../PDFIUM/third_party/freetype/src/psaux/psaux.c
    ../PDFIUM/third_party/freetype/src/pshinter/pshinter.c
    ../PDFIUM/third_party/freetype/src/psnames/psmodule.c
    ../PDFIUM/third_party/freetype/src/raster/raster.c
    ../PDFIUM/third_party/freetype/src/sfnt/sfnt.c
    ../PDFIUM/third_party/freetype/src/smooth/smooth.c
    ../PDFIUM/third_party/freetype/src/truetype/truetype.c
    ../PDFIUM/third_party/freetype/src/type1/type1.c
)


add_library(pdfium STATIC
    ../PDFIUM/fpdfsdk/src/fpdf_dataavail.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_ext.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_flatten.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_progressive.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_searchex.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_sysfontinfo.cpp
    ../PDFIUM/fpdfsdk/src/fpdf_transformpage.cpp
    ../PDFIUM/fpdfsdk/src/fpdfdoc.cpp
    ../PDFIUM/fpdfsdk/src/fpdfeditimg.cpp
    ../PDFIUM/fpdfsdk/src/fpdfeditpage.cpp
    ../PDFIUM/fpdfsdk/src/fpdfformfill.cpp
    ../PDFIUM/fpdfsdk/src/fpdfppo.cpp
    ../PDFIUM/fpdfsdk/src/fpdfsave.cpp
    ../PDFIUM/fpdfsdk/src/fpdftext.cpp
    ../PDFIUM/fpdfsdk/src/fpdfview.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_actionhandler.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_annothandler.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_baseannot.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_baseform.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_mgr.cpp
    ../PDFIUM/fpdfsdk/src/fsdk_rendercontext.cpp
    ../PDFIUM/third_party/bigint/BigInteger.cc
    ../PDFIUM/third_party/bigint/BigIntegerUtils.cc
    ../PDFIUM/third_party/bigint/BigUnsigned.cc
    ../PDFIUM/third_party/bigint/BigUnsignedInABase.cc
)


add_library(pdfium-lib SHARED
    mainJNILib.cpp
)


#=============依赖================

target_link_libraries(
    fxcodec
    libjpeg fx_lcms2 fx_libopenjpeg fx_zlib
)

target_link_libraries(
    fpdfapi
    fdrm
)

target_link_libraries(
    pdfium
    fdrm
    fpdfdoc
    fpdfapi
    fpdftext
    fxcodec
    fxcrt
    fxedit
    fxge
    fx_agg32
    fx_freetype
)


target_link_libraries(
    pdfium-lib
    pdfium android log jnigraphics
)