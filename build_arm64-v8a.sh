rm -rf openssl-1.1.1.tar.gz
#rm -rf openssl-1.1.1
#wget https://www.openssl.org/source/openssl-1.1.1.tar.gz
#tar xzvf openssl-1.1.1.tar.gz
cd openssl-1.1.1
export NDK=$NDK_ROOT
export ANDROID_NDK_ROOT=$NDK
$NDK_ROOT/build/tools/make-standalone-toolchain.sh \
        --platform=android-21 \
        --toolchain=aarch64-linux-android-4.9 \
        --install-dir=`pwd`/android-toolchain-aarch64
export _ANDROID_API=android-21
export _ANDROID_ARCH=aarch64
export TOOLCHAIN_PATH=`pwd`/android-toolchain-aarch64/bin
export ANDROID_NDK=`pwd`/android-toolchain-aarch64
export TOOL=aarch64-linux-android
export NDK_TOOLCHAIN_BASENAME=${TOOLCHAIN_PATH}/${TOOL}
export CC=${NDK_TOOLCHAIN_BASENAME}-gcc
export CXX=${NDK_TOOLCHAIN_BASENAME}-g++
export LINK=${CXX}
export LD=$NDK_TOOLCHAIN_BASENAME-ld
export AR=$NDK_TOOLCHAIN_BASENAME-ar
export RANLIB=$NDK_TOOLCHAIN_BASENAME-ranlib
export STRIP=$NDK_TOOLCHAIN_BASENAME-strip
export ARCH_FLAGS=
export ARCH_LINK=
export CPPFLAGS=" ${ARCH_FLAGS} -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-strict-aliasing -finline-limit=64 "
export CXXFLAGS=" ${ARCH_FLAGS} -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-strict-aliasing -finline-limit=64 -frtti -fexceptions "
export CFLAGS=" ${ARCH_FLAGS} -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-strict-aliasing -finline-limit=64 "
export LDFLAGS=" ${ARCH_LINK} "
export PATH=${TOOLCHAIN_PATH}:$PATH 
#export SYSROOT=`pwd`/android-toolchain-aarch64/sysroot
#export ANDROID_SYSROOT=`pwd`/android-toolchain-aarch64/sysroot
export ANDROID_SYSROOT=$NDK_ROOT/platforms/android-21/arch-arm64
export SYSROOT=$NDK_ROOT/platforms/android-21/arch-arm64
export CROSS_SYSROOT=$SYSROOT
echo $CC
./Configure android64-aarch64  no-shared no-asm no-ssl3 no-hw --sysroot=${SYSROOT} -D__ANDROID_API__=21
#echo $PATH
#echo $TOOLCHAIN_PATH
#make
