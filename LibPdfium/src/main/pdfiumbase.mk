LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumbase

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter

LOCAL_SRC_FILES := \
    pdfium/third_party/base/allocator/partition_allocator/address_space_randomization.cc \
    pdfium/third_party/base/allocator/partition_allocator/oom_callback.cc \
    pdfium/third_party/base/allocator/partition_allocator/page_allocator.cc \
    pdfium/third_party/base/allocator/partition_allocator/partition_alloc.cc \
    pdfium/third_party/base/allocator/partition_allocator/partition_bucket.cc \
    pdfium/third_party/base/allocator/partition_allocator/partition_oom.cc \
    pdfium/third_party/base/allocator/partition_allocator/partition_page.cc \
    pdfium/third_party/base/allocator/partition_allocator/partition_root_base.cc \
    pdfium/third_party/base/allocator/partition_allocator/random.cc \
    pdfium/third_party/base/allocator/partition_allocator/spin_lock.cc \
    pdfium/third_party/base/debug/alias.cc \
	
PWD = $(shell pwd)
PWDW = $(shell pwd | sed -E 's/^\/mnt\/([a-z])/\1:/g')
	
	
LOCAL_C_INCLUDES := \
    -I$(PWDW)/pdfium/ \
    -I$(PWD)/pdfium/ \


include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumbase := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumbase := $(addprefix build/$(_ARCH_PX_)/pdfiumbase/, $(OBJS_pdfiumbase))
	
libpdfiumbase.a: $(OBJS_pdfiumbase)
	$(AR) -rv libpdfiumbase.a $(OBJS_pdfiumbase)

build/$(_ARCH_PX_)/pdfiumbase/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" $(LOCAL_C_INCLUDES) $(LOCAL_CFLAGS)
	echo