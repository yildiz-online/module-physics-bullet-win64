cmake . \
-DCMAKE_BUILD_TYPE=Release \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

build-wrapper-linux-x86-64 --out-dir ../../../../target/sonar-cpp make
sonar-scanner
r1=$?

rm -R CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake
rm Makefile

return $r1

