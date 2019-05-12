#!/usr/bin/env bash

TARGET_PATH="../../../../target/classes"
TARGET_WIN64="$TARGET_PATH/win64"

source $TARGET_PATH/project.txt

VERSION=${VERSION%"-SNAPSHOT"}

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION,$BUILD_NUMBER" | tr . , >> version.rc
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
echo "            VALUE \"FileDescription\", \"Yildiz-Engine Physics engine with Bullet\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,$BUILD_NUMBER\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizbullet.dll\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizbullet.dll\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\\\0\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine Physics Bullet module\"" >> version.rc
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
-DLIBRARY_OUTPUT_PATH=$TARGET_WIN64 \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp bullet/win64/bin/libBulletCollision.dll $TARGET_WIN64/libBulletCollision.dll
cp bullet/win64/bin/libBulletDynamics.dll $TARGET_WIN64/libBulletDynamics.dll
cp bullet/win64/bin/libBulletSoftBody.dll $TARGET_WIN64/libBulletSoftBody.dll
cp bullet/win64/bin/libLinearMath.dll $TARGET_WIN64/libLinearMath.dll
cp bullet/win64/bin/libBullet3Common.dll $TARGET_WIN64/libBullet3Common.dll
cp bullet/win64/bin/libBulletInverseDynamics.dll $TARGET_WIN64/libBulletInverseDynamics.dll
cp libstdc++-6.dll $TARGET_WIN64/libstdc++-6.dll
cp libgcc_s_seh-1.dll $TARGET_WIN64/libgcc_s_seh-1.dll

exit ${r1}
