cmake_minimum_required(VERSION 3.20)

# Variables
set(PROJECT_NAME "gdalpdf")
SET(PROJECT_CONFIG_TARGET "" CACHE STRING "Name of the target")
SET(PROJECT_CONFIG_ARCH "" CACHE STRING "Arch of the target")
SET(PROJECT_CONFIG_PDFIUM "" CACHE STRING "PDFium path")

# Project
project(${PROJECT_NAME})

# Conan
message(STATUS "Conan File: ${CMAKE_CURRENT_BINARY_DIR}/../conan/conanbuildinfo.cmake")
include(${CMAKE_SOURCE_DIR}/../build/${PROJECT_CONFIG_TARGET}/${PROJECT_CONFIG_ARCH}/conan/conanbuildinfo.cmake)
conan_basic_setup()

# Flags
if (PROJECT_CONFIG_TARGET STREQUAL "ios")
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
message(STATUS "Conan Libraries: ${CONAN_LIBS}")
add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})

if(APPLE)
    target_link_libraries(${PROJECT_NAME} PUBLIC "${CONAN_LIBS_GDAL}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_JSON-C}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBGEOTIFF}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_FLATBUFFERS}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBPNG}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_GIFLIB}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_GEOS}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_QHULL}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_PROJ}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBTIFF}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_NLOHMANN_JSON}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_SQLITE3}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_ZLIB}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBDEFLATE}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_JBIG}")
    target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_ZSTD}")
    #target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBWEBP}")
    #target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBICONV}")
    #target_link_libraries(${PROJECT_NAME} PRIVATE "${CONAN_LIBS_LIBJPEG}")    

    target_link_libraries(${PROJECT_NAME} PRIVATE "iconv")
    target_link_libraries(${PROJECT_NAME} PRIVATE "-framework CoreGraphics")
endif()

# PDFium
message(STATUS "PDFium path: ${PROJECT_CONFIG_PDFIUM}")
target_link_directories(${PROJECT_NAME} PRIVATE ${PROJECT_CONFIG_PDFIUM}/lib)
target_link_libraries(${PROJECT_NAME} PRIVATE "pdfium")

# Library merge flags
if(WIN32)
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "/WHOLEARCHIVE")
elseif(APPLE)
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-Wl,-all_load")
else()
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-Wl,--whole-archive")
endif()
