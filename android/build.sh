NDK="$1"
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
MAKE="$NDK/prebuilt/linux-x86_64/bin/make -j2"
TARGET_LIST=("aarch64-linux-android" "armv7a-linux-androideabi" "i686-linux-android" "x86_64-linux-android")
#TARGET_LIST=("aarch64-linux-android")
export API=28
export AR=$TOOLCHAIN/bin/llvm-ar

if [ ! "$NDK" ]; then
	echo "NDK não encontrado"
	exit 0
fi

for TARGET in "${TARGET_LIST[@]}"; do
mkdir "$TARGET"

if [ "$TARGET" = "armv7a-linux-androideabi" ] ; then
export AR=$TOOLCHAIN/bin/llvm-ar
export LD=$TOOLCHAIN/bin/ld
export CC="$TOOLCHAIN/bin/clang  --target=$TARGET$API"
export CFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-arm-android.a"
export AS=$CC
export CXX="$TOOLCHAIN/bin/clang++  --target=$TARGET$API"
export CXXFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-arm-android.a"
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
../configure --enable-minimal --enable-libgcc-unwinder-by-default --enable-libunwind --host $TARGET --prefix $PWD/$TARGET/
$MAKE
$MAKE install && $MAKE clean
fi

if [ "$TARGET" = "i686-linux-android" ] ; then
eexport AR=$TOOLCHAIN/bin/llvm-ar
export LD=$TOOLCHAIN/bin/ld
export CC="$TOOLCHAIN/bin/clang  --target=$TARGET$API"
export CFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-i686-android.a"
export AS=$CC
export CXX="$TOOLCHAIN/bin/clang++  --target=$TARGET$API"
export CXXFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-i686-android.a"
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
../configure --enable-minimal --enable-libgcc-unwinder-by-default --enable-libunwind --host $TARGET --prefix $PWD/$TARGET/
$MAKE
$MAKE install && $MAKE clean
fi

if [ "$TARGET" = "x86_64-linux-android" ] ; then
export AR=$TOOLCHAIN/bin/llvm-ar
export LD=$TOOLCHAIN/bin/ld
export CC="$TOOLCHAIN/bin/clang  --target=$TARGET$API"
export CFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-x86_64-android.a"
export AS=$CC
export CXX="$TOOLCHAIN/bin/clang++  --target=$TARGET$API"
export CXXFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-x86_64-android.a"
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
../configure --enable-minimal --enable-libgcc-unwinder-by-default --enable-libunwind --host $TARGET --prefix $PWD/$TARGET/
$MAKE
$MAKE install && $MAKE clean
cd ..
fi

if [ "$TARGET" = "aarch64-linux-android" ] ; then
export AR=$TOOLCHAIN/bin/llvm-ar
export LD=$TOOLCHAIN/bin/ld
export CC="$TOOLCHAIN/bin/clang  --target=$TARGET$API"
export CFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-aarch64-android.a"
export AS=$CC
export CXX="$TOOLCHAIN/bin/clang++  --target=$TARGET$API"
export CXXFLAGS="-funwind-tables $TOOLCHAIN/lib/clang/18/lib/linux/libclang_rt.builtins-aarch64-android.a"
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
../configure --enable-minimal --enable-libgcc-unwinder-by-default --enable-libunwind --host $TARGET --prefix $PWD/$TARGET/
$MAKE
$MAKE install && $MAKE clean
fi
done
