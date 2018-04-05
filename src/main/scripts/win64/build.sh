cmake . -DCMAKE_BUILD_TYPE=Release -DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" -DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp bullet/win64/bin/libBulletCollision.dll ../../../../target/classes/win64/libBulletCollision.dll
cp bullet/win64/bin/libBulletDynamics.dll ../../../../target/classes/win64/libBulletDynamics.dll
cp bullet/win64/bin/libBulletSoftBody.dll ../../../../target/classes/win64/libBulletSoftBody.dll
cp bullet/win64/bin/libLinearMath.dll ../../../../target/classes/win64/libLinearMath.dll
cp bullet/win64/bin/libBullet3Common.dll ../../../target/classes/win64/libBullet3Common.dll
cp bullet/win64/bin/libBulletInverseDynamics.dll ../../../target/classes/win64/libBulletInverseDynamics.dll
cp libstdc++-6.dll ../../../../target/classes/win64/libstdc++-6.dll
cp libgcc_s_seh-1.dll ../../../../target/classes/win64/libgcc_s_seh-1.dll

rm -R CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake
rm Makefile
rm -r bullet
rm -r java
rm -r ../../includes
rm -r ../../c++
rm libgcc_s_seh-1.dll
rm libstdc++-6.dll
rm mingw-toolchain.cmake

return $r1




