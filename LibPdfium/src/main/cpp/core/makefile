BASE_PATH := $(call my-dir)

#_ARCH_CC_ := armv7a-linux-androideabi29-clang
_ARCH_PX_ := aarch64
_TARGETRI_ := aarch64-linux-android
_ARCH_CC_ := $(_TARGETRI_)21-clang

CC := $(TOOLCHAIN)/bin/$(_ARCH_CC_)

AR := $(TOOLCHAIN)/bin/aarch64-linux-android-ar.exe

include pdfiumfxcrt.mk
include pdfiumfdrm.mk
include pdfiumfpdfapi.mk
include pdfiumfpdfdoc.mk
include pdfiumfpdftext.mk
include pdfiumfxcodec.mk
include pdfiumfxge.mk


all: \
	libpdfiumfxcrt.a\
	libpdfiumfxge.a\
	libpdfiumfdrm.a\
	libpdfiumfpdfapi.a\
	libpdfiumfpdfdoc.a\
	libpdfiumfpdftext.a\
	libpdfiumfxcodec.a\
	
	