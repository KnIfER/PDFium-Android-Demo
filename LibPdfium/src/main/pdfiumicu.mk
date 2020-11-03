LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumzlib

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

ICU_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
ICU_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
ICU_CFLAGS = -Wno-shift-negative-value -Wno-unused-parameter \
	-DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DUSE_CHROMIUM_ICU=1 -DU_STATIC_IMPLEMENTATION \
	-DU_I18N_IMPLEMENTATION -DU_COMMON_IMPLEMENTATION -DU_HIDE_DATA_SYMBOL\
	-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE\
	-DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=0 -DU_CHARSET_IS_UTF8=1\
	-DU_ICUDATAENTRY_IN_COMMON -DANDROID
	

LOCAL_SRC_FILES := \
    pdfium/third_party/icu/source/i18n/alphaindex.cpp \
    pdfium/third_party/icu/source/i18n/anytrans.cpp \
    pdfium/third_party/icu/source/i18n/astro.cpp \
    pdfium/third_party/icu/source/i18n/basictz.cpp \
    pdfium/third_party/icu/source/i18n/bocsu.cpp \
    pdfium/third_party/icu/source/i18n/brktrans.cpp \
    pdfium/third_party/icu/source/i18n/buddhcal.cpp \
    pdfium/third_party/icu/source/i18n/calendar.cpp \
    pdfium/third_party/icu/source/i18n/casetrn.cpp \
    pdfium/third_party/icu/source/i18n/cecal.cpp \
    pdfium/third_party/icu/source/i18n/chnsecal.cpp \
    pdfium/third_party/icu/source/i18n/choicfmt.cpp \
    pdfium/third_party/icu/source/i18n/coleitr.cpp \
    pdfium/third_party/icu/source/i18n/collationbuilder.cpp \
    pdfium/third_party/icu/source/i18n/collationcompare.cpp \
    pdfium/third_party/icu/source/i18n/collation.cpp \
    pdfium/third_party/icu/source/i18n/collationdatabuilder.cpp \
    pdfium/third_party/icu/source/i18n/collationdata.cpp \
    pdfium/third_party/icu/source/i18n/collationdatareader.cpp \
    pdfium/third_party/icu/source/i18n/collationdatawriter.cpp \
    pdfium/third_party/icu/source/i18n/collationfastlatinbuilder.cpp \
    pdfium/third_party/icu/source/i18n/collationfastlatin.cpp \
    pdfium/third_party/icu/source/i18n/collationfcd.cpp \
    pdfium/third_party/icu/source/i18n/collationiterator.cpp \
    pdfium/third_party/icu/source/i18n/collationkeys.cpp \
    pdfium/third_party/icu/source/i18n/collationroot.cpp \
    pdfium/third_party/icu/source/i18n/collationrootelements.cpp \
    pdfium/third_party/icu/source/i18n/collationruleparser.cpp \
    pdfium/third_party/icu/source/i18n/collationsets.cpp \
    pdfium/third_party/icu/source/i18n/collationsettings.cpp \
    pdfium/third_party/icu/source/i18n/collationtailoring.cpp \
    pdfium/third_party/icu/source/i18n/collationweights.cpp \
    pdfium/third_party/icu/source/i18n/coll.cpp \
    pdfium/third_party/icu/source/i18n/compactdecimalformat.cpp \
    pdfium/third_party/icu/source/i18n/coptccal.cpp \
    pdfium/third_party/icu/source/i18n/cpdtrans.cpp \
    pdfium/third_party/icu/source/i18n/csdetect.cpp \
    pdfium/third_party/icu/source/i18n/csmatch.cpp \
    pdfium/third_party/icu/source/i18n/csr2022.cpp \
    pdfium/third_party/icu/source/i18n/csrecog.cpp \
    pdfium/third_party/icu/source/i18n/csrmbcs.cpp \
    pdfium/third_party/icu/source/i18n/csrsbcs.cpp \
    pdfium/third_party/icu/source/i18n/csrucode.cpp \
    pdfium/third_party/icu/source/i18n/csrutf8.cpp \
    pdfium/third_party/icu/source/i18n/curramt.cpp \
    pdfium/third_party/icu/source/i18n/currfmt.cpp \
    pdfium/third_party/icu/source/i18n/currpinf.cpp \
    pdfium/third_party/icu/source/i18n/currunit.cpp \
    pdfium/third_party/icu/source/i18n/dangical.cpp \
    pdfium/third_party/icu/source/i18n/datefmt.cpp \
    pdfium/third_party/icu/source/i18n/dayperiodrules.cpp \
    pdfium/third_party/icu/source/i18n/dcfmtsym.cpp \
    pdfium/third_party/icu/source/i18n/decContext.cpp \
    pdfium/third_party/icu/source/i18n/decimfmt.cpp \
    pdfium/third_party/icu/source/i18n/decNumber.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-bignum.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-bignum-dtoa.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-cached-powers.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-double-to-string.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-fast-dtoa.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-string-to-double.cpp \
    pdfium/third_party/icu/source/i18n/double-conversion-strtod.cpp \
    pdfium/third_party/icu/source/i18n/dtfmtsym.cpp \
    pdfium/third_party/icu/source/i18n/dtitvfmt.cpp \
    pdfium/third_party/icu/source/i18n/dtitvinf.cpp \
    pdfium/third_party/icu/source/i18n/dtptngen.cpp \
    pdfium/third_party/icu/source/i18n/dtrule.cpp \
    pdfium/third_party/icu/source/i18n/erarules.cpp \
    pdfium/third_party/icu/source/i18n/esctrn.cpp \
    pdfium/third_party/icu/source/i18n/ethpccal.cpp \
    pdfium/third_party/icu/source/i18n/fmtable_cnv.cpp \
    pdfium/third_party/icu/source/i18n/fmtable.cpp \
    pdfium/third_party/icu/source/i18n/format.cpp \
    pdfium/third_party/icu/source/i18n/formatted_string_builder.cpp \
    pdfium/third_party/icu/source/i18n/formattedval_iterimpl.cpp \
    pdfium/third_party/icu/source/i18n/formattedval_sbimpl.cpp \
    pdfium/third_party/icu/source/i18n/formattedvalue.cpp \
    pdfium/third_party/icu/source/i18n/fphdlimp.cpp \
    pdfium/third_party/icu/source/i18n/fpositer.cpp \
    pdfium/third_party/icu/source/i18n/funcrepl.cpp \
    pdfium/third_party/icu/source/i18n/gender.cpp \
    pdfium/third_party/icu/source/i18n/gregocal.cpp \
    pdfium/third_party/icu/source/i18n/gregoimp.cpp \
    pdfium/third_party/icu/source/i18n/hebrwcal.cpp \
    pdfium/third_party/icu/source/i18n/indiancal.cpp \
    pdfium/third_party/icu/source/i18n/inputext.cpp \
    pdfium/third_party/icu/source/i18n/islamcal.cpp \
    pdfium/third_party/icu/source/i18n/japancal.cpp \
    pdfium/third_party/icu/source/i18n/listformatter.cpp \
    pdfium/third_party/icu/source/i18n/measfmt.cpp \
    pdfium/third_party/icu/source/i18n/measunit.cpp \
    pdfium/third_party/icu/source/i18n/measure.cpp \
    pdfium/third_party/icu/source/i18n/msgfmt.cpp \
    pdfium/third_party/icu/source/i18n/name2uni.cpp \
    pdfium/third_party/icu/source/i18n/nfrs.cpp \
    pdfium/third_party/icu/source/i18n/nfrule.cpp \
    pdfium/third_party/icu/source/i18n/nfsubs.cpp \
    pdfium/third_party/icu/source/i18n/nortrans.cpp \
    pdfium/third_party/icu/source/i18n/nounit.cpp \
    pdfium/third_party/icu/source/i18n/nultrans.cpp \
    pdfium/third_party/icu/source/i18n/number_affixutils.cpp \
    pdfium/third_party/icu/source/i18n/number_asformat.cpp \
    pdfium/third_party/icu/source/i18n/number_capi.cpp \
    pdfium/third_party/icu/source/i18n/number_compact.cpp \
    pdfium/third_party/icu/source/i18n/number_currencysymbols.cpp \
    pdfium/third_party/icu/source/i18n/number_decimalquantity.cpp \
    pdfium/third_party/icu/source/i18n/number_decimfmtprops.cpp \
    pdfium/third_party/icu/source/i18n/number_fluent.cpp \
    pdfium/third_party/icu/source/i18n/number_formatimpl.cpp \
    pdfium/third_party/icu/source/i18n/number_grouping.cpp \
    pdfium/third_party/icu/source/i18n/number_integerwidth.cpp \
    pdfium/third_party/icu/source/i18n/number_longnames.cpp \
    pdfium/third_party/icu/source/i18n/number_mapper.cpp \
    pdfium/third_party/icu/source/i18n/number_modifiers.cpp \
    pdfium/third_party/icu/source/i18n/number_multiplier.cpp \
    pdfium/third_party/icu/source/i18n/number_notation.cpp \
    pdfium/third_party/icu/source/i18n/number_output.cpp \
    pdfium/third_party/icu/source/i18n/number_padding.cpp \
    pdfium/third_party/icu/source/i18n/number_patternmodifier.cpp \
    pdfium/third_party/icu/source/i18n/number_patternstring.cpp \
    pdfium/third_party/icu/source/i18n/number_rounding.cpp \
    pdfium/third_party/icu/source/i18n/number_scientific.cpp \
    pdfium/third_party/icu/source/i18n/number_skeletons.cpp \
    pdfium/third_party/icu/source/i18n/number_utils.cpp \
    pdfium/third_party/icu/source/i18n/numfmt.cpp \
    pdfium/third_party/icu/source/i18n/numparse_affixes.cpp \
    pdfium/third_party/icu/source/i18n/numparse_compositions.cpp \
    pdfium/third_party/icu/source/i18n/numparse_currency.cpp \
    pdfium/third_party/icu/source/i18n/numparse_decimal.cpp \
    pdfium/third_party/icu/source/i18n/numparse_impl.cpp \
    pdfium/third_party/icu/source/i18n/numparse_parsednumber.cpp \
    pdfium/third_party/icu/source/i18n/numparse_scientific.cpp \
    pdfium/third_party/icu/source/i18n/numparse_symbols.cpp \
    pdfium/third_party/icu/source/i18n/numparse_validators.cpp \
    pdfium/third_party/icu/source/i18n/numrange_fluent.cpp \
    pdfium/third_party/icu/source/i18n/numrange_impl.cpp \
    pdfium/third_party/icu/source/i18n/numsys.cpp \
    pdfium/third_party/icu/source/i18n/olsontz.cpp \
    pdfium/third_party/icu/source/i18n/persncal.cpp \
    pdfium/third_party/icu/source/i18n/plurfmt.cpp \
    pdfium/third_party/icu/source/i18n/plurrule.cpp \
    pdfium/third_party/icu/source/i18n/quant.cpp \
    pdfium/third_party/icu/source/i18n/quantityformatter.cpp \
    pdfium/third_party/icu/source/i18n/rbnf.cpp \
    pdfium/third_party/icu/source/i18n/rbt.cpp \
    pdfium/third_party/icu/source/i18n/rbt_data.cpp \
    pdfium/third_party/icu/source/i18n/rbt_pars.cpp \
    pdfium/third_party/icu/source/i18n/rbt_rule.cpp \
    pdfium/third_party/icu/source/i18n/rbt_set.cpp \
    pdfium/third_party/icu/source/i18n/rbtz.cpp \
    pdfium/third_party/icu/source/i18n/regexcmp.cpp \
    pdfium/third_party/icu/source/i18n/regeximp.cpp \
    pdfium/third_party/icu/source/i18n/regexst.cpp \
    pdfium/third_party/icu/source/i18n/regextxt.cpp \
    pdfium/third_party/icu/source/i18n/region.cpp \
    pdfium/third_party/icu/source/i18n/reldatefmt.cpp \
    pdfium/third_party/icu/source/i18n/reldtfmt.cpp \
    pdfium/third_party/icu/source/i18n/rematch.cpp \
    pdfium/third_party/icu/source/i18n/remtrans.cpp \
    pdfium/third_party/icu/source/i18n/repattrn.cpp \
    pdfium/third_party/icu/source/i18n/rulebasedcollator.cpp \
    pdfium/third_party/icu/source/i18n/scientificnumberformatter.cpp \
    pdfium/third_party/icu/source/i18n/scriptset.cpp \
    pdfium/third_party/icu/source/i18n/search.cpp \
    pdfium/third_party/icu/source/i18n/selfmt.cpp \
    pdfium/third_party/icu/source/i18n/sharedbreakiterator.cpp \
    pdfium/third_party/icu/source/i18n/simpletz.cpp \
    pdfium/third_party/icu/source/i18n/smpdtfmt.cpp \
    pdfium/third_party/icu/source/i18n/smpdtfst.cpp \
    pdfium/third_party/icu/source/i18n/sortkey.cpp \
    pdfium/third_party/icu/source/i18n/standardplural.cpp \
    pdfium/third_party/icu/source/i18n/string_segment.cpp \
    pdfium/third_party/icu/source/i18n/strmatch.cpp \
    pdfium/third_party/icu/source/i18n/strrepl.cpp \
    pdfium/third_party/icu/source/i18n/stsearch.cpp \
    pdfium/third_party/icu/source/i18n/taiwncal.cpp \
    pdfium/third_party/icu/source/i18n/timezone.cpp \
    pdfium/third_party/icu/source/i18n/titletrn.cpp \
    pdfium/third_party/icu/source/i18n/tmunit.cpp \
    pdfium/third_party/icu/source/i18n/tmutamt.cpp \
    pdfium/third_party/icu/source/i18n/tmutfmt.cpp \
    pdfium/third_party/icu/source/i18n/tolowtrn.cpp \
    pdfium/third_party/icu/source/i18n/toupptrn.cpp \
    pdfium/third_party/icu/source/i18n/translit.cpp \
    pdfium/third_party/icu/source/i18n/transreg.cpp \
    pdfium/third_party/icu/source/i18n/tridpars.cpp \
    pdfium/third_party/icu/source/i18n/tzfmt.cpp \
    pdfium/third_party/icu/source/i18n/tzgnames.cpp \
    pdfium/third_party/icu/source/i18n/tznames.cpp \
    pdfium/third_party/icu/source/i18n/tznames_impl.cpp \
    pdfium/third_party/icu/source/i18n/tzrule.cpp \
    pdfium/third_party/icu/source/i18n/tztrans.cpp \
    pdfium/third_party/icu/source/i18n/ucal.cpp \
    pdfium/third_party/icu/source/i18n/ucln_in.cpp \
    pdfium/third_party/icu/source/i18n/ucol.cpp \
    pdfium/third_party/icu/source/i18n/ucoleitr.cpp \
    pdfium/third_party/icu/source/i18n/ucol_res.cpp \
    pdfium/third_party/icu/source/i18n/ucol_sit.cpp \
    pdfium/third_party/icu/source/i18n/ucsdet.cpp \
    pdfium/third_party/icu/source/i18n/udat.cpp \
    pdfium/third_party/icu/source/i18n/udateintervalformat.cpp \
    pdfium/third_party/icu/source/i18n/udatpg.cpp \
    pdfium/third_party/icu/source/i18n/ufieldpositer.cpp \
    pdfium/third_party/icu/source/i18n/uitercollationiterator.cpp \
    pdfium/third_party/icu/source/i18n/ulistformatter.cpp \
    pdfium/third_party/icu/source/i18n/ulocdata.cpp \
    pdfium/third_party/icu/source/i18n/umsg.cpp \
    pdfium/third_party/icu/source/i18n/unesctrn.cpp \
    pdfium/third_party/icu/source/i18n/uni2name.cpp \
    pdfium/third_party/icu/source/i18n/unum.cpp \
    pdfium/third_party/icu/source/i18n/unumsys.cpp \
    pdfium/third_party/icu/source/i18n/upluralrules.cpp \
    pdfium/third_party/icu/source/i18n/uregexc.cpp \
    pdfium/third_party/icu/source/i18n/uregex.cpp \
    pdfium/third_party/icu/source/i18n/uregion.cpp \
    pdfium/third_party/icu/source/i18n/usearch.cpp \
    pdfium/third_party/icu/source/i18n/uspoof_build.cpp \
    pdfium/third_party/icu/source/i18n/uspoof_conf.cpp \
    pdfium/third_party/icu/source/i18n/uspoof.cpp \
    pdfium/third_party/icu/source/i18n/uspoof_impl.cpp \
    pdfium/third_party/icu/source/i18n/utf16collationiterator.cpp \
    pdfium/third_party/icu/source/i18n/utf8collationiterator.cpp \
    pdfium/third_party/icu/source/i18n/utmscale.cpp \
    pdfium/third_party/icu/source/i18n/utrans.cpp \
    pdfium/third_party/icu/source/i18n/vtzone.cpp \
    pdfium/third_party/icu/source/i18n/vzone.cpp \
    pdfium/third_party/icu/source/i18n/windtfmt.cpp \
    pdfium/third_party/icu/source/i18n/winnmfmt.cpp \
    pdfium/third_party/icu/source/i18n/wintzimpl.cpp \
    pdfium/third_party/icu/source/i18n/zonemeta.cpp \
    pdfium/third_party/icu/source/i18n/zrule.cpp \
    pdfium/third_party/icu/source/i18n/ztrans.cpp \
	\
	\
	pdfium/third_party/icu/source/common/appendable.cpp \
    pdfium/third_party/icu/source/common/bmpset.cpp \
    pdfium/third_party/icu/source/common/brkeng.cpp \
    pdfium/third_party/icu/source/common/brkiter.cpp \
    pdfium/third_party/icu/source/common/bytesinkutil.cpp \
    pdfium/third_party/icu/source/common/bytestream.cpp \
    pdfium/third_party/icu/source/common/bytestriebuilder.cpp \
    pdfium/third_party/icu/source/common/bytestrie.cpp \
    pdfium/third_party/icu/source/common/bytestrieiterator.cpp \
    pdfium/third_party/icu/source/common/caniter.cpp \
    pdfium/third_party/icu/source/common/characterproperties.cpp \
    pdfium/third_party/icu/source/common/chariter.cpp \
    pdfium/third_party/icu/source/common/charstr.cpp \
    pdfium/third_party/icu/source/common/cmemory.cpp \
    pdfium/third_party/icu/source/common/cstr.cpp \
    pdfium/third_party/icu/source/common/cstring.cpp \
    pdfium/third_party/icu/source/common/cwchar.cpp \
    pdfium/third_party/icu/source/common/dictbe.cpp \
    pdfium/third_party/icu/source/common/dictionarydata.cpp \
    pdfium/third_party/icu/source/common/dtintrv.cpp \
    pdfium/third_party/icu/source/common/edits.cpp \
    pdfium/third_party/icu/source/common/errorcode.cpp \
    pdfium/third_party/icu/source/common/filteredbrk.cpp \
    pdfium/third_party/icu/source/common/filterednormalizer2.cpp \
    pdfium/third_party/icu/source/common/icudataver.cpp \
    pdfium/third_party/icu/source/common/icuplug.cpp \
    pdfium/third_party/icu/source/common/loadednormalizer2impl.cpp \
    pdfium/third_party/icu/source/common/localebuilder.cpp \
    pdfium/third_party/icu/source/common/localematcher.cpp \
    pdfium/third_party/icu/source/common/localeprioritylist.cpp \
    pdfium/third_party/icu/source/common/locavailable.cpp \
    pdfium/third_party/icu/source/common/locbased.cpp \
    pdfium/third_party/icu/source/common/locdispnames.cpp \
    pdfium/third_party/icu/source/common/locdistance.cpp \
    pdfium/third_party/icu/source/common/locdspnm.cpp \
    pdfium/third_party/icu/source/common/locid.cpp \
    pdfium/third_party/icu/source/common/loclikely.cpp \
    pdfium/third_party/icu/source/common/loclikelysubtags.cpp \
    pdfium/third_party/icu/source/common/locmap.cpp \
    pdfium/third_party/icu/source/common/locresdata.cpp \
    pdfium/third_party/icu/source/common/locutil.cpp \
    pdfium/third_party/icu/source/common/lsr.cpp \
    pdfium/third_party/icu/source/common/messagepattern.cpp \
    pdfium/third_party/icu/source/common/normalizer2.cpp \
    pdfium/third_party/icu/source/common/normalizer2impl.cpp \
    pdfium/third_party/icu/source/common/normlzr.cpp \
    pdfium/third_party/icu/source/common/parsepos.cpp \
    pdfium/third_party/icu/source/common/patternprops.cpp \
    pdfium/third_party/icu/source/common/pluralmap.cpp \
    pdfium/third_party/icu/source/common/propname.cpp \
    pdfium/third_party/icu/source/common/propsvec.cpp \
    pdfium/third_party/icu/source/common/punycode.cpp \
    pdfium/third_party/icu/source/common/putil.cpp \
    pdfium/third_party/icu/source/common/rbbi_cache.cpp \
    pdfium/third_party/icu/source/common/rbbi.cpp \
    pdfium/third_party/icu/source/common/rbbidata.cpp \
    pdfium/third_party/icu/source/common/rbbinode.cpp \
    pdfium/third_party/icu/source/common/rbbirb.cpp \
    pdfium/third_party/icu/source/common/rbbiscan.cpp \
    pdfium/third_party/icu/source/common/rbbisetb.cpp \
    pdfium/third_party/icu/source/common/rbbistbl.cpp \
    pdfium/third_party/icu/source/common/rbbitblb.cpp \
    pdfium/third_party/icu/source/common/resbund_cnv.cpp \
    pdfium/third_party/icu/source/common/resbund.cpp \
    pdfium/third_party/icu/source/common/resource.cpp \
    pdfium/third_party/icu/source/common/restrace.cpp \
    pdfium/third_party/icu/source/common/ruleiter.cpp \
    pdfium/third_party/icu/source/common/schriter.cpp \
    pdfium/third_party/icu/source/common/serv.cpp \
    pdfium/third_party/icu/source/common/servlk.cpp \
    pdfium/third_party/icu/source/common/servlkf.cpp \
    pdfium/third_party/icu/source/common/servls.cpp \
    pdfium/third_party/icu/source/common/servnotf.cpp \
    pdfium/third_party/icu/source/common/servrbf.cpp \
    pdfium/third_party/icu/source/common/servslkf.cpp \
    pdfium/third_party/icu/source/common/sharedobject.cpp \
    pdfium/third_party/icu/source/common/simpleformatter.cpp \
    pdfium/third_party/icu/source/common/static_unicode_sets.cpp \
    pdfium/third_party/icu/source/common/stringpiece.cpp \
    pdfium/third_party/icu/source/common/stringtriebuilder.cpp \
    pdfium/third_party/icu/source/common/uarrsort.cpp \
    pdfium/third_party/icu/source/common/ubidi.cpp \
    pdfium/third_party/icu/source/common/ubidiln.cpp \
    pdfium/third_party/icu/source/common/ubidi_props.cpp \
    pdfium/third_party/icu/source/common/ubiditransform.cpp \
    pdfium/third_party/icu/source/common/ubidiwrt.cpp \
    pdfium/third_party/icu/source/common/ubrk.cpp \
    pdfium/third_party/icu/source/common/ucase.cpp \
    pdfium/third_party/icu/source/common/ucasemap.cpp \
    pdfium/third_party/icu/source/common/ucasemap_titlecase_brkiter.cpp \
    pdfium/third_party/icu/source/common/ucat.cpp \
    pdfium/third_party/icu/source/common/uchar.cpp \
    pdfium/third_party/icu/source/common/ucharstriebuilder.cpp \
    pdfium/third_party/icu/source/common/ucharstrie.cpp \
    pdfium/third_party/icu/source/common/ucharstrieiterator.cpp \
    pdfium/third_party/icu/source/common/uchriter.cpp \
    pdfium/third_party/icu/source/common/ucln_cmn.cpp \
    pdfium/third_party/icu/source/common/ucmndata.cpp \
    pdfium/third_party/icu/source/common/ucnv2022.cpp \
    pdfium/third_party/icu/source/common/ucnv_bld.cpp \
    pdfium/third_party/icu/source/common/ucnvbocu.cpp \
    pdfium/third_party/icu/source/common/ucnv_cb.cpp \
    pdfium/third_party/icu/source/common/ucnv_cnv.cpp \
    pdfium/third_party/icu/source/common/ucnv.cpp \
    pdfium/third_party/icu/source/common/ucnv_ct.cpp \
    pdfium/third_party/icu/source/common/ucnvdisp.cpp \
    pdfium/third_party/icu/source/common/ucnv_err.cpp \
    pdfium/third_party/icu/source/common/ucnv_ext.cpp \
    pdfium/third_party/icu/source/common/ucnvhz.cpp \
    pdfium/third_party/icu/source/common/ucnv_io.cpp \
    pdfium/third_party/icu/source/common/ucnvisci.cpp \
    pdfium/third_party/icu/source/common/ucnvlat1.cpp \
    pdfium/third_party/icu/source/common/ucnv_lmb.cpp \
    pdfium/third_party/icu/source/common/ucnvmbcs.cpp \
    pdfium/third_party/icu/source/common/ucnvscsu.cpp \
    pdfium/third_party/icu/source/common/ucnvsel.cpp \
    pdfium/third_party/icu/source/common/ucnv_set.cpp \
    pdfium/third_party/icu/source/common/ucnv_u16.cpp \
    pdfium/third_party/icu/source/common/ucnv_u32.cpp \
    pdfium/third_party/icu/source/common/ucnv_u7.cpp \
    pdfium/third_party/icu/source/common/ucnv_u8.cpp \
    pdfium/third_party/icu/source/common/ucol_swp.cpp \
    pdfium/third_party/icu/source/common/ucptrie.cpp \
    pdfium/third_party/icu/source/common/ucurr.cpp \
    pdfium/third_party/icu/source/common/udata.cpp \
    pdfium/third_party/icu/source/common/udatamem.cpp \
    pdfium/third_party/icu/source/common/udataswp.cpp \
    pdfium/third_party/icu/source/common/uenum.cpp \
    pdfium/third_party/icu/source/common/uhash.cpp \
    pdfium/third_party/icu/source/common/uhash_us.cpp \
    pdfium/third_party/icu/source/common/uidna.cpp \
    pdfium/third_party/icu/source/common/uinit.cpp \
    pdfium/third_party/icu/source/common/uinvchar.cpp \
    pdfium/third_party/icu/source/common/uiter.cpp \
    pdfium/third_party/icu/source/common/ulist.cpp \
    pdfium/third_party/icu/source/common/uloc.cpp \
    pdfium/third_party/icu/source/common/uloc_keytype.cpp \
    pdfium/third_party/icu/source/common/uloc_tag.cpp \
    pdfium/third_party/icu/source/common/umapfile.cpp \
    pdfium/third_party/icu/source/common/umath.cpp \
    pdfium/third_party/icu/source/common/umutablecptrie.cpp \
    pdfium/third_party/icu/source/common/umutex.cpp \
    pdfium/third_party/icu/source/common/unames.cpp \
    pdfium/third_party/icu/source/common/unifiedcache.cpp \
    pdfium/third_party/icu/source/common/unifilt.cpp \
    pdfium/third_party/icu/source/common/unifunct.cpp \
    pdfium/third_party/icu/source/common/uniset_closure.cpp \
    pdfium/third_party/icu/source/common/uniset.cpp \
    pdfium/third_party/icu/source/common/uniset_props.cpp \
    pdfium/third_party/icu/source/common/unisetspan.cpp \
    pdfium/third_party/icu/source/common/unistr_case.cpp \
    pdfium/third_party/icu/source/common/unistr_case_locale.cpp \
    pdfium/third_party/icu/source/common/unistr_cnv.cpp \
    pdfium/third_party/icu/source/common/unistr.cpp \
    pdfium/third_party/icu/source/common/unistr_props.cpp \
    pdfium/third_party/icu/source/common/unistr_titlecase_brkiter.cpp \
    pdfium/third_party/icu/source/common/unormcmp.cpp \
    pdfium/third_party/icu/source/common/unorm.cpp \
    pdfium/third_party/icu/source/common/uobject.cpp \
    pdfium/third_party/icu/source/common/uprops.cpp \
    pdfium/third_party/icu/source/common/uresbund.cpp \
    pdfium/third_party/icu/source/common/ures_cnv.cpp \
    pdfium/third_party/icu/source/common/uresdata.cpp \
    pdfium/third_party/icu/source/common/usc_impl.cpp \
    pdfium/third_party/icu/source/common/uscript.cpp \
    pdfium/third_party/icu/source/common/uscript_props.cpp \
    pdfium/third_party/icu/source/common/uset.cpp \
    pdfium/third_party/icu/source/common/usetiter.cpp \
    pdfium/third_party/icu/source/common/uset_props.cpp \
    pdfium/third_party/icu/source/common/ushape.cpp \
    pdfium/third_party/icu/source/common/usprep.cpp \
    pdfium/third_party/icu/source/common/ustack.cpp \
    pdfium/third_party/icu/source/common/ustrcase.cpp \
    pdfium/third_party/icu/source/common/ustrcase_locale.cpp \
    pdfium/third_party/icu/source/common/ustr_cnv.cpp \
    pdfium/third_party/icu/source/common/ustrenum.cpp \
    pdfium/third_party/icu/source/common/ustrfmt.cpp \
    pdfium/third_party/icu/source/common/ustring.cpp \
    pdfium/third_party/icu/source/common/ustr_titlecase_brkiter.cpp \
    pdfium/third_party/icu/source/common/ustrtrns.cpp \
    pdfium/third_party/icu/source/common/ustr_wcs.cpp \
    pdfium/third_party/icu/source/common/utext.cpp \
    pdfium/third_party/icu/source/common/utf_impl.cpp \
    pdfium/third_party/icu/source/common/util.cpp \
    pdfium/third_party/icu/source/common/util_props.cpp \
    pdfium/third_party/icu/source/common/utrace.cpp \
    pdfium/third_party/icu/source/common/utrie2_builder.cpp \
    pdfium/third_party/icu/source/common/utrie2.cpp \
    pdfium/third_party/icu/source/common/utrie.cpp \
    pdfium/third_party/icu/source/common/utrie_swap.cpp \
    pdfium/third_party/icu/source/common/uts46.cpp \
    pdfium/third_party/icu/source/common/utypes.cpp \
    pdfium/third_party/icu/source/common/uvector.cpp \
    pdfium/third_party/icu/source/common/uvectr32.cpp \
    pdfium/third_party/icu/source/common/uvectr64.cpp \
    pdfium/third_party/icu/source/common/wintz.cpp \
	\
	pdfium/third_party/icu/source/stubdata/stubdata.cpp
	
	
PWD = $(shell pwd)
PWDW = $(shell pwd | sed -E 's/^\/mnt\/([a-z])/\1:/g')
	
	
ICU_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWDW)/pdfium/third_party/icu/source/i18n/ \
    -I$(PWDW)/pdfium/third_party/icu/source/common/ \
    -I$(PWD)/pdfium/ \
    -I$(PWD)/pdfium/third_party/icu/source/i18n/ \
    -I$(PWD)/pdfium/third_party/icu/source/common/ \
	
	
include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumicu := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumicu := $(addprefix build/$(_ARCH_PX_)/pdfiumicu/, $(OBJS_pdfiumicu))
	
libpdfiumicu.a: $(OBJS_pdfiumicu)
	cd build/$(_ARCH_PX_)/pdfiumicu/pdfium/third_party/icu/source && $(AR) -rv libpdfiumicu.a common/*.o i18n/*.o stubdata/*.o
	cd build/$(_ARCH_PX_)/pdfiumicu/pdfium/third_party/icu/source && cp libpdfiumicu.a $(PWD)
	
# libpdfiumicu.a: $(OBJS_pdfiumicu)
	# $(AR) -rv libpdfiumicu.a $(OBJS_pdfiumicu)

build/$(_ARCH_PX_)/pdfiumicu/%.o:%
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(ICU_C_INCLUDES) $(ICU_CFLAGS)
	echo