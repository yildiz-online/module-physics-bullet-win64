cmake_minimum_required (VERSION 2.8.6)
project (yildiz_native_bullet)

set(CMAKE_CXX_FLAGS "-O2 -std=gnu++11")

include_directories("bullet/win64/include/bullet")
include_directories("java/include")
include_directories("java/include/win32")
    
set(CMAKE_SHARED_LINKER_FLAGS "-Xlinker --add-stdcall-alias")

#Set all source file in variable source_files.
file(
        GLOB_RECURSE
        source_files
        ${CMAKE_SOURCE_DIR}/../../includes/*.h
        ${CMAKE_SOURCE_DIR}/../../includes/*.hpp
        ${CMAKE_SOURCE_DIR}/../../c++/*.cpp
)

add_library(yildizbullet SHARED ${source_files} ${CMAKE_SOURCE_DIR}/version.rc)

target_link_libraries(yildizbullet ${CMAKE_SOURCE_DIR}/bullet/win64/lib/libBulletDynamics.dll.a)
target_link_libraries(yildizbullet ${CMAKE_SOURCE_DIR}/bullet/win64/lib/libBulletCollision.dll.a)
target_link_libraries(yildizbullet ${CMAKE_SOURCE_DIR}/bullet/win64/lib/libLinearMath.dll.a)