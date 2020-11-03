BASE_PATH := $(call my-dir)

#_ARCH_CC_ := armv7a-linux-androideabi29-clang
_ARCH_PX_ := aarch64
_TARGETRI_ := aarch64-linux-android
_ARCH_CC_ := $(_TARGETRI_)21-clang

CC := $(TOOLCHAIN)/bin/$(_ARCH_CC_)

AR := $(TOOLCHAIN)/bin/aarch64-linux-android-ar.exe

# libpdfiumjpeg.a  libpdfiumjpeg_turbo.a

#  libpdfiumfxcodec.a\

PWD = $(shell pwd)
PWDW = $(shell pwd | sed -E 's/^\/mnt\/([a-z])/\1:/g')

pdfium_3rd_libs = \
	\
	\
	libpdfium_lib.a\
	libpdfiumfxcodec.a\
	\
	libpdfiumfreetype.a\
	libpdfiumzlib.a\
	libpdfiumopenjpeg20.a\
	libpdfiumlcms.a\
	libpdfiumicu.a\
	libpdfiumagg23.a\
	libpdfiumjpeg_turbo.a\

	
pdfiumlibs = \
	libpdfiumbase.a\

pdfium_libs = \
	$(pdfium_3rd_libs)\
	$(pdfiumlibs)\

include pdfiumzlib.mk
include pdfiumopenjpeg20.mk
include pdfiumicu.mk
# include pdfiumbigint.mk
include pdfiumagg23.mk
include pdfiumlcms.mk
include pdfiumfreetype.mk
include pdfiumjpeg_turbo.mk
include pdfiumjpeg.mk

include pdfiumfxcodec.mk
include pdfiumbase.mk
include pdfium_lib.mk

include pdfiumfpdfsdk.mk

all: \
	$(pdfium_libs)\
	libpdfium.so\
	
	# libpdfium.a
	
	
	
	