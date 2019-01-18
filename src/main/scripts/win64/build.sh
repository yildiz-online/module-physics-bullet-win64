#!/usr/bin/env bash

source ../../../../target/classes/project.txt

VERSION=${VERSION%"-SNAPSHOT"}
echo $VERSION

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION,0" | tr . , >> version.rc
echo "PRODUCTVERSION $VERSION,0" | tr . , >> version.rc
echo "FILEFLAGSMASK 0x17L" >> version.rc
echo "FILEFLAGS 0x0L" >> version.rc
echo "FILEOS 0x4L" >> version.rc
echo "FILETYPE 0x1L" >> version.rc
echo "FILESUBTYPE 0x0L" >> version.rc
echo "BEGIN" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        BLOCK \"040904b0\"" >> version.rc
echo "        BEGIN" >> version.rc
echo "            VALUE \"FileDescription\", \"Yildiz-Engine Physics engine with Bullet implementation.\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizbullet.dll\\\0\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\\\0\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizbullet.dll\\\0\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\\\0\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine Physics Bullet module.\\\0\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc

cmake . \
-DCMAKE_BUILD_TYPE=Release \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

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
rm -r ../win64
rm libgcc_s_seh-1.dll
rm libstdc++-6.dll
rm mingw-toolchain.cmake

exit $r1




