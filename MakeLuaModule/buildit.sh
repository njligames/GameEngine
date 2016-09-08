pushd ../Source/lua/lua-5.3.3/
make clean
./build_for_iphoneos_noconfigure.sh device generic
make clean
make macosx
popd

