export ANDROID_SDK=/mnt/d/Code/NVPACK/android_sdk
export PATH=$ANDROID_SDK/platform-tools:$PATH
export PATH=$ANDROID_SDK/tools:$PATH

export NDK=/mnt/d/Code/NVPACK/android-ndk-r21b
export NDK=/mnt/d/Code/NVPACK/android_sdk/ndk/21.0.6113669

export PATH=$NDK:$PATH

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/windows-x86_64
export SYSROOT=$TOOLCHAIN/sysroot





export ASM=$SYSROOT/usr/include/$PLATFORM
export CROSS_PREFIX=$TOOLCHAIN/bin/$PLATFORM-
export ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/armv7a-linux-androideabi29-
export ANDROID_CROSS_PREFIX_1=$TOOLCHAIN/bin/arm-linux-android-



