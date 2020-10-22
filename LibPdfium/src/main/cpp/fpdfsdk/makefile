BASE_PATH := $(call my-dir)

#_ARCH_CC_ := armv7a-linux-androideabi29-clang
_ARCH_PX_ := aarch64
_TARGETRI_ := aarch64-linux-android
_ARCH_CC_ := $(_TARGETRI_)21-clang

CC := $(TOOLCHAIN)/bin/$(_ARCH_CC_)

AR := $(TOOLCHAIN)/bin/aarch64-linux-android-ar.exe

include pdfium.mk
include pdfiumformfiller.mk
include pdfiumfxedit.mk
include pdfiumjavascript.mk
include pdfiumpdfwindow.mk

all: \
	libpdfium.a\
	libpdfiumformfiller.a\
	libpdfiumfxedit.a\
	libpdfiumjavascript.a\
	libpdfiumpdfwindow.a\
	libpdfium.so
	

