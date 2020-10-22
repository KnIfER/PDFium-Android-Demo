BASE_PATH := $(call my-dir)

#_ARCH_CC_ := armv7a-linux-androideabi29-clang
_ARCH_PX_ := aarch64
_TARGETRI_ := aarch64-linux-android
_ARCH_CC_ := $(_TARGETRI_)21-clang

CC := $(TOOLCHAIN)/bin/$(_ARCH_CC_)

AR := $(TOOLCHAIN)/bin/aarch64-linux-android-ar.exe

include pdfiumzlib.mk
include pdfiumjpeg.mk
include pdfiumopenjpeg.mk
include pdfiumbigint.mk
include pdfiumagg23.mk
include pdfiumlcms.mk

all: \
	libpdfiumzlib.a\
	libpdfiumjpeg.a\
	libpdfiumopenjpeg.a\
	libpdfiumbigint.a\
	libpdfiumagg23.a\
	libpdfiumlcms.a\
	
	