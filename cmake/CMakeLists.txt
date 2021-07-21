cmake_minimum_required(VERSION 3.20)
project(gdal)

# Variables
SET(TARGET_NAME "" CACHE STRING "Name of the target")
SET(TARGET_ARCH "" CACHE STRING "Arch of the target")

# Conan
include(${CMAKE_SOURCE_DIR}/../build/${TARGET_NAME}/${TARGET_ARCH}/conan/conanbuildinfo.cmake)
conan_basic_setup()

# Flags
if (TARGET_NAME STREQUAL "ios")
    # Framework links
    set(TARGET_FRAMEWORK_LINKS "-framework Foundation" CACHE INTERNAL "")

    # C flags
    set(TARGET_CMAKE_C_FLAGS "-fobjc-arc -fobjc-abi-version=2" CACHE INTERNAL "")

    # CXX flags
    set(TARGET_CMAKE_CXX_FLAGS "-fobjc-arc -fvisibility-inlines-hidden -fobjc-abi-version=2 -stdlib=libc++ -std=c++11" CACHE INTERNAL "")

    # Compiler
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${TARGET_CMAKE_C_FLAGS}" CACHE INTERNAL "")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TARGET_CMAKE_CXX_FLAGS}" CACHE INTERNAL "")

    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -O0 -g")
    set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_MINSIZEREL} -Os")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELWITHDEBINFO} -O2 -g")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -O3")
endif()

# Source
set(SOURCE_FILES ../src/main.cpp)

# Library
add_library(gdal SHARED ${SOURCE_FILES})
target_link_libraries(gdal "${CONAN_LIBS}")

if (TARGET_NAME STREQUAL "ios")
    set_target_properties(gdal PROPERTIES FRAMEWORK TRUE PUBLIC_HEADER "")
endif()
