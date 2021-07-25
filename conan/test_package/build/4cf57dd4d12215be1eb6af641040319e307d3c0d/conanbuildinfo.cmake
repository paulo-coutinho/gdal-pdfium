include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  GDAL
#################
set(CONAN_GDAL_ROOT "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19")
set(CONAN_INCLUDE_DIRS_GDAL "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/include")
set(CONAN_LIB_DIRS_GDAL "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/lib")
set(CONAN_BIN_DIRS_GDAL "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/bin")
set(CONAN_RES_DIRS_GDAL "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/res")
set(CONAN_SRC_DIRS_GDAL )
set(CONAN_BUILD_DIRS_GDAL "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/")
set(CONAN_FRAMEWORK_DIRS_GDAL )
set(CONAN_LIBS_GDAL gdal)
set(CONAN_PKG_LIBS_GDAL gdal)
set(CONAN_SYSTEM_LIBS_GDAL c++)
set(CONAN_FRAMEWORKS_GDAL )
set(CONAN_FRAMEWORKS_FOUND_GDAL "")  # Will be filled later
set(CONAN_DEFINES_GDAL )
set(CONAN_BUILD_MODULES_PATHS_GDAL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GDAL )

set(CONAN_C_FLAGS_GDAL "")
set(CONAN_CXX_FLAGS_GDAL "")
set(CONAN_SHARED_LINKER_FLAGS_GDAL "")
set(CONAN_EXE_LINKER_FLAGS_GDAL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GDAL_LIST "")
set(CONAN_CXX_FLAGS_GDAL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GDAL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GDAL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GDAL "${CONAN_FRAMEWORKS_GDAL}" "_GDAL" "")
# Append to aggregated values variable
set(CONAN_LIBS_GDAL ${CONAN_PKG_LIBS_GDAL} ${CONAN_SYSTEM_LIBS_GDAL} ${CONAN_FRAMEWORKS_FOUND_GDAL})


#################
###  JSON-C
#################
set(CONAN_JSON-C_ROOT "/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_JSON-C "/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_JSON-C "/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_JSON-C )
set(CONAN_RES_DIRS_JSON-C )
set(CONAN_SRC_DIRS_JSON-C )
set(CONAN_BUILD_DIRS_JSON-C "/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_JSON-C )
set(CONAN_LIBS_JSON-C json-c)
set(CONAN_PKG_LIBS_JSON-C json-c)
set(CONAN_SYSTEM_LIBS_JSON-C )
set(CONAN_FRAMEWORKS_JSON-C )
set(CONAN_FRAMEWORKS_FOUND_JSON-C "")  # Will be filled later
set(CONAN_DEFINES_JSON-C )
set(CONAN_BUILD_MODULES_PATHS_JSON-C )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_JSON-C )

set(CONAN_C_FLAGS_JSON-C "")
set(CONAN_CXX_FLAGS_JSON-C "")
set(CONAN_SHARED_LINKER_FLAGS_JSON-C "")
set(CONAN_EXE_LINKER_FLAGS_JSON-C "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_JSON-C_LIST "")
set(CONAN_CXX_FLAGS_JSON-C_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_JSON-C_LIST "")
set(CONAN_EXE_LINKER_FLAGS_JSON-C_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_JSON-C "${CONAN_FRAMEWORKS_JSON-C}" "_JSON-C" "")
# Append to aggregated values variable
set(CONAN_LIBS_JSON-C ${CONAN_PKG_LIBS_JSON-C} ${CONAN_SYSTEM_LIBS_JSON-C} ${CONAN_FRAMEWORKS_FOUND_JSON-C})


#################
###  LIBGEOTIFF
#################
set(CONAN_LIBGEOTIFF_ROOT "/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d")
set(CONAN_INCLUDE_DIRS_LIBGEOTIFF "/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/include")
set(CONAN_LIB_DIRS_LIBGEOTIFF "/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/lib")
set(CONAN_BIN_DIRS_LIBGEOTIFF )
set(CONAN_RES_DIRS_LIBGEOTIFF )
set(CONAN_SRC_DIRS_LIBGEOTIFF )
set(CONAN_BUILD_DIRS_LIBGEOTIFF "/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/"
			"/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_LIBGEOTIFF )
set(CONAN_LIBS_LIBGEOTIFF geotiff)
set(CONAN_PKG_LIBS_LIBGEOTIFF geotiff)
set(CONAN_SYSTEM_LIBS_LIBGEOTIFF )
set(CONAN_FRAMEWORKS_LIBGEOTIFF )
set(CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF "")  # Will be filled later
set(CONAN_DEFINES_LIBGEOTIFF )
set(CONAN_BUILD_MODULES_PATHS_LIBGEOTIFF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF )

set(CONAN_C_FLAGS_LIBGEOTIFF "")
set(CONAN_CXX_FLAGS_LIBGEOTIFF "")
set(CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF "")
set(CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBGEOTIFF_LIST "")
set(CONAN_CXX_FLAGS_LIBGEOTIFF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF "${CONAN_FRAMEWORKS_LIBGEOTIFF}" "_LIBGEOTIFF" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBGEOTIFF ${CONAN_PKG_LIBS_LIBGEOTIFF} ${CONAN_SYSTEM_LIBS_LIBGEOTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF})


#################
###  FLATBUFFERS
#################
set(CONAN_FLATBUFFERS_ROOT "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe")
set(CONAN_INCLUDE_DIRS_FLATBUFFERS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/include")
set(CONAN_LIB_DIRS_FLATBUFFERS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/lib")
set(CONAN_BIN_DIRS_FLATBUFFERS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin")
set(CONAN_RES_DIRS_FLATBUFFERS )
set(CONAN_SRC_DIRS_FLATBUFFERS )
set(CONAN_BUILD_DIRS_FLATBUFFERS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin/cmake")
set(CONAN_FRAMEWORK_DIRS_FLATBUFFERS )
set(CONAN_LIBS_FLATBUFFERS flatbuffers)
set(CONAN_PKG_LIBS_FLATBUFFERS flatbuffers)
set(CONAN_SYSTEM_LIBS_FLATBUFFERS )
set(CONAN_FRAMEWORKS_FLATBUFFERS )
set(CONAN_FRAMEWORKS_FOUND_FLATBUFFERS "")  # Will be filled later
set(CONAN_DEFINES_FLATBUFFERS )
set(CONAN_BUILD_MODULES_PATHS_FLATBUFFERS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin/cmake/BuildFlatBuffers.cmake")
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FLATBUFFERS )

set(CONAN_C_FLAGS_FLATBUFFERS "")
set(CONAN_CXX_FLAGS_FLATBUFFERS "")
set(CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS "")
set(CONAN_EXE_LINKER_FLAGS_FLATBUFFERS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FLATBUFFERS_LIST "")
set(CONAN_CXX_FLAGS_FLATBUFFERS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FLATBUFFERS "${CONAN_FRAMEWORKS_FLATBUFFERS}" "_FLATBUFFERS" "")
# Append to aggregated values variable
set(CONAN_LIBS_FLATBUFFERS ${CONAN_PKG_LIBS_FLATBUFFERS} ${CONAN_SYSTEM_LIBS_FLATBUFFERS} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS})


#################
###  LIBICONV
#################
set(CONAN_LIBICONV_ROOT "/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_LIBICONV "/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_LIBICONV "/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_LIBICONV "/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin")
set(CONAN_RES_DIRS_LIBICONV )
set(CONAN_SRC_DIRS_LIBICONV )
set(CONAN_BUILD_DIRS_LIBICONV "/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_LIBICONV )
set(CONAN_LIBS_LIBICONV iconv charset)
set(CONAN_PKG_LIBS_LIBICONV iconv charset)
set(CONAN_SYSTEM_LIBS_LIBICONV )
set(CONAN_FRAMEWORKS_LIBICONV )
set(CONAN_FRAMEWORKS_FOUND_LIBICONV "")  # Will be filled later
set(CONAN_DEFINES_LIBICONV )
set(CONAN_BUILD_MODULES_PATHS_LIBICONV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBICONV )

set(CONAN_C_FLAGS_LIBICONV "")
set(CONAN_CXX_FLAGS_LIBICONV "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBICONV_LIST "")
set(CONAN_CXX_FLAGS_LIBICONV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBICONV "${CONAN_FRAMEWORKS_LIBICONV}" "_LIBICONV" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBICONV ${CONAN_PKG_LIBS_LIBICONV} ${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV})


#################
###  GEOS
#################
set(CONAN_GEOS_ROOT "/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db")
set(CONAN_INCLUDE_DIRS_GEOS "/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/include")
set(CONAN_LIB_DIRS_GEOS "/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/lib")
set(CONAN_BIN_DIRS_GEOS )
set(CONAN_RES_DIRS_GEOS )
set(CONAN_SRC_DIRS_GEOS )
set(CONAN_BUILD_DIRS_GEOS "/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/")
set(CONAN_FRAMEWORK_DIRS_GEOS )
set(CONAN_LIBS_GEOS geos_c geos)
set(CONAN_PKG_LIBS_GEOS geos_c geos)
set(CONAN_SYSTEM_LIBS_GEOS c++)
set(CONAN_FRAMEWORKS_GEOS )
set(CONAN_FRAMEWORKS_FOUND_GEOS "")  # Will be filled later
set(CONAN_DEFINES_GEOS "-DUSE_UNSTABLE_GEOS_CPP_API"
			"-DGEOS_INLINE")
set(CONAN_BUILD_MODULES_PATHS_GEOS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GEOS "USE_UNSTABLE_GEOS_CPP_API"
			"GEOS_INLINE")

set(CONAN_C_FLAGS_GEOS "")
set(CONAN_CXX_FLAGS_GEOS "")
set(CONAN_SHARED_LINKER_FLAGS_GEOS "")
set(CONAN_EXE_LINKER_FLAGS_GEOS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GEOS_LIST "")
set(CONAN_CXX_FLAGS_GEOS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GEOS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GEOS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GEOS "${CONAN_FRAMEWORKS_GEOS}" "_GEOS" "")
# Append to aggregated values variable
set(CONAN_LIBS_GEOS ${CONAN_PKG_LIBS_GEOS} ${CONAN_SYSTEM_LIBS_GEOS} ${CONAN_FRAMEWORKS_FOUND_GEOS})


#################
###  PROJ
#################
set(CONAN_PROJ_ROOT "/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964")
set(CONAN_INCLUDE_DIRS_PROJ "/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/include")
set(CONAN_LIB_DIRS_PROJ "/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/lib")
set(CONAN_BIN_DIRS_PROJ )
set(CONAN_RES_DIRS_PROJ "/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/res")
set(CONAN_SRC_DIRS_PROJ )
set(CONAN_BUILD_DIRS_PROJ "/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/")
set(CONAN_FRAMEWORK_DIRS_PROJ )
set(CONAN_LIBS_PROJ proj)
set(CONAN_PKG_LIBS_PROJ proj)
set(CONAN_SYSTEM_LIBS_PROJ c++)
set(CONAN_FRAMEWORKS_PROJ )
set(CONAN_FRAMEWORKS_FOUND_PROJ "")  # Will be filled later
set(CONAN_DEFINES_PROJ )
set(CONAN_BUILD_MODULES_PATHS_PROJ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PROJ )

set(CONAN_C_FLAGS_PROJ "")
set(CONAN_CXX_FLAGS_PROJ "")
set(CONAN_SHARED_LINKER_FLAGS_PROJ "")
set(CONAN_EXE_LINKER_FLAGS_PROJ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PROJ_LIST "")
set(CONAN_CXX_FLAGS_PROJ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PROJ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PROJ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PROJ "${CONAN_FRAMEWORKS_PROJ}" "_PROJ" "")
# Append to aggregated values variable
set(CONAN_LIBS_PROJ ${CONAN_PKG_LIBS_PROJ} ${CONAN_SYSTEM_LIBS_PROJ} ${CONAN_FRAMEWORKS_FOUND_PROJ})


#################
###  LIBTIFF
#################
set(CONAN_LIBTIFF_ROOT "/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21")
set(CONAN_INCLUDE_DIRS_LIBTIFF "/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/include")
set(CONAN_LIB_DIRS_LIBTIFF "/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/lib")
set(CONAN_BIN_DIRS_LIBTIFF )
set(CONAN_RES_DIRS_LIBTIFF )
set(CONAN_SRC_DIRS_LIBTIFF )
set(CONAN_BUILD_DIRS_LIBTIFF "/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/")
set(CONAN_FRAMEWORK_DIRS_LIBTIFF )
set(CONAN_LIBS_LIBTIFF tiffxx tiff)
set(CONAN_PKG_LIBS_LIBTIFF tiffxx tiff)
set(CONAN_SYSTEM_LIBS_LIBTIFF )
set(CONAN_FRAMEWORKS_LIBTIFF )
set(CONAN_FRAMEWORKS_FOUND_LIBTIFF "")  # Will be filled later
set(CONAN_DEFINES_LIBTIFF )
set(CONAN_BUILD_MODULES_PATHS_LIBTIFF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBTIFF )

set(CONAN_C_FLAGS_LIBTIFF "")
set(CONAN_CXX_FLAGS_LIBTIFF "")
set(CONAN_SHARED_LINKER_FLAGS_LIBTIFF "")
set(CONAN_EXE_LINKER_FLAGS_LIBTIFF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBTIFF_LIST "")
set(CONAN_CXX_FLAGS_LIBTIFF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBTIFF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBTIFF "${CONAN_FRAMEWORKS_LIBTIFF}" "_LIBTIFF" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBTIFF ${CONAN_PKG_LIBS_LIBTIFF} ${CONAN_SYSTEM_LIBS_LIBTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF})


#################
###  NLOHMANN_JSON
#################
set(CONAN_NLOHMANN_JSON_ROOT "/Users/paulo/.conan/data/nlohmann_json/3.9.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_NLOHMANN_JSON "/Users/paulo/.conan/data/nlohmann_json/3.9.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_NLOHMANN_JSON )
set(CONAN_BIN_DIRS_NLOHMANN_JSON )
set(CONAN_RES_DIRS_NLOHMANN_JSON )
set(CONAN_SRC_DIRS_NLOHMANN_JSON )
set(CONAN_BUILD_DIRS_NLOHMANN_JSON "/Users/paulo/.conan/data/nlohmann_json/3.9.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_NLOHMANN_JSON )
set(CONAN_LIBS_NLOHMANN_JSON )
set(CONAN_PKG_LIBS_NLOHMANN_JSON )
set(CONAN_SYSTEM_LIBS_NLOHMANN_JSON )
set(CONAN_FRAMEWORKS_NLOHMANN_JSON )
set(CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON "")  # Will be filled later
set(CONAN_DEFINES_NLOHMANN_JSON )
set(CONAN_BUILD_MODULES_PATHS_NLOHMANN_JSON )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON )

set(CONAN_C_FLAGS_NLOHMANN_JSON "")
set(CONAN_CXX_FLAGS_NLOHMANN_JSON "")
set(CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON "")
set(CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_NLOHMANN_JSON_LIST "")
set(CONAN_CXX_FLAGS_NLOHMANN_JSON_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_LIST "")
set(CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON "${CONAN_FRAMEWORKS_NLOHMANN_JSON}" "_NLOHMANN_JSON" "")
# Append to aggregated values variable
set(CONAN_LIBS_NLOHMANN_JSON ${CONAN_PKG_LIBS_NLOHMANN_JSON} ${CONAN_SYSTEM_LIBS_NLOHMANN_JSON} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON})


#################
###  SQLITE3
#################
set(CONAN_SQLITE3_ROOT "/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526")
set(CONAN_INCLUDE_DIRS_SQLITE3 "/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/include")
set(CONAN_LIB_DIRS_SQLITE3 "/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/lib")
set(CONAN_BIN_DIRS_SQLITE3 "/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/bin")
set(CONAN_RES_DIRS_SQLITE3 )
set(CONAN_SRC_DIRS_SQLITE3 )
set(CONAN_BUILD_DIRS_SQLITE3 "/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_SQLITE3 )
set(CONAN_LIBS_SQLITE3 sqlite3)
set(CONAN_PKG_LIBS_SQLITE3 sqlite3)
set(CONAN_SYSTEM_LIBS_SQLITE3 )
set(CONAN_FRAMEWORKS_SQLITE3 )
set(CONAN_FRAMEWORKS_FOUND_SQLITE3 "")  # Will be filled later
set(CONAN_DEFINES_SQLITE3 )
set(CONAN_BUILD_MODULES_PATHS_SQLITE3 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE3 )

set(CONAN_C_FLAGS_SQLITE3 "")
set(CONAN_CXX_FLAGS_SQLITE3 "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3 "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE3_LIST "")
set(CONAN_CXX_FLAGS_SQLITE3_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE3 "${CONAN_FRAMEWORKS_SQLITE3}" "_SQLITE3" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE3 ${CONAN_PKG_LIBS_SQLITE3} ${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_ZLIB "/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_ZLIB "/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  LIBDEFLATE
#################
set(CONAN_LIBDEFLATE_ROOT "/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_LIBDEFLATE "/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_LIBDEFLATE "/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_LIBDEFLATE )
set(CONAN_RES_DIRS_LIBDEFLATE )
set(CONAN_SRC_DIRS_LIBDEFLATE )
set(CONAN_BUILD_DIRS_LIBDEFLATE "/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_LIBDEFLATE )
set(CONAN_LIBS_LIBDEFLATE deflate)
set(CONAN_PKG_LIBS_LIBDEFLATE deflate)
set(CONAN_SYSTEM_LIBS_LIBDEFLATE )
set(CONAN_FRAMEWORKS_LIBDEFLATE )
set(CONAN_FRAMEWORKS_FOUND_LIBDEFLATE "")  # Will be filled later
set(CONAN_DEFINES_LIBDEFLATE )
set(CONAN_BUILD_MODULES_PATHS_LIBDEFLATE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBDEFLATE )

set(CONAN_C_FLAGS_LIBDEFLATE "")
set(CONAN_CXX_FLAGS_LIBDEFLATE "")
set(CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE "")
set(CONAN_EXE_LINKER_FLAGS_LIBDEFLATE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_CXX_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBDEFLATE "${CONAN_FRAMEWORKS_LIBDEFLATE}" "_LIBDEFLATE" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBDEFLATE ${CONAN_PKG_LIBS_LIBDEFLATE} ${CONAN_SYSTEM_LIBS_LIBDEFLATE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE})


#################
###  XZ_UTILS
#################
set(CONAN_XZ_UTILS_ROOT "/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_XZ_UTILS "/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_XZ_UTILS "/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_XZ_UTILS "/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin")
set(CONAN_RES_DIRS_XZ_UTILS )
set(CONAN_SRC_DIRS_XZ_UTILS )
set(CONAN_BUILD_DIRS_XZ_UTILS "/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_XZ_UTILS )
set(CONAN_LIBS_XZ_UTILS lzma)
set(CONAN_PKG_LIBS_XZ_UTILS lzma)
set(CONAN_SYSTEM_LIBS_XZ_UTILS )
set(CONAN_FRAMEWORKS_XZ_UTILS )
set(CONAN_FRAMEWORKS_FOUND_XZ_UTILS "")  # Will be filled later
set(CONAN_DEFINES_XZ_UTILS "-DLZMA_API_STATIC")
set(CONAN_BUILD_MODULES_PATHS_XZ_UTILS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XZ_UTILS "LZMA_API_STATIC")

set(CONAN_C_FLAGS_XZ_UTILS "")
set(CONAN_CXX_FLAGS_XZ_UTILS "")
set(CONAN_SHARED_LINKER_FLAGS_XZ_UTILS "")
set(CONAN_EXE_LINKER_FLAGS_XZ_UTILS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XZ_UTILS_LIST "")
set(CONAN_CXX_FLAGS_XZ_UTILS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XZ_UTILS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XZ_UTILS "${CONAN_FRAMEWORKS_XZ_UTILS}" "_XZ_UTILS" "")
# Append to aggregated values variable
set(CONAN_LIBS_XZ_UTILS ${CONAN_PKG_LIBS_XZ_UTILS} ${CONAN_SYSTEM_LIBS_XZ_UTILS} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS})


#################
###  LIBJPEG
#################
set(CONAN_LIBJPEG_ROOT "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_LIBJPEG "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_LIBJPEG "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_LIBJPEG "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin")
set(CONAN_RES_DIRS_LIBJPEG "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/res")
set(CONAN_SRC_DIRS_LIBJPEG )
set(CONAN_BUILD_DIRS_LIBJPEG "/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_LIBJPEG )
set(CONAN_LIBS_LIBJPEG jpeg)
set(CONAN_PKG_LIBS_LIBJPEG jpeg)
set(CONAN_SYSTEM_LIBS_LIBJPEG )
set(CONAN_FRAMEWORKS_LIBJPEG )
set(CONAN_FRAMEWORKS_FOUND_LIBJPEG "")  # Will be filled later
set(CONAN_DEFINES_LIBJPEG "-DLIBJPEG_STATIC")
set(CONAN_BUILD_MODULES_PATHS_LIBJPEG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBJPEG "LIBJPEG_STATIC")

set(CONAN_C_FLAGS_LIBJPEG "")
set(CONAN_CXX_FLAGS_LIBJPEG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBJPEG_LIST "")
set(CONAN_CXX_FLAGS_LIBJPEG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBJPEG "${CONAN_FRAMEWORKS_LIBJPEG}" "_LIBJPEG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBJPEG ${CONAN_PKG_LIBS_LIBJPEG} ${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG})


#################
###  JBIG
#################
set(CONAN_JBIG_ROOT "/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194")
set(CONAN_INCLUDE_DIRS_JBIG "/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/include")
set(CONAN_LIB_DIRS_JBIG "/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/lib")
set(CONAN_BIN_DIRS_JBIG "/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/bin")
set(CONAN_RES_DIRS_JBIG )
set(CONAN_SRC_DIRS_JBIG )
set(CONAN_BUILD_DIRS_JBIG "/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/")
set(CONAN_FRAMEWORK_DIRS_JBIG )
set(CONAN_LIBS_JBIG jbig)
set(CONAN_PKG_LIBS_JBIG jbig)
set(CONAN_SYSTEM_LIBS_JBIG )
set(CONAN_FRAMEWORKS_JBIG )
set(CONAN_FRAMEWORKS_FOUND_JBIG "")  # Will be filled later
set(CONAN_DEFINES_JBIG )
set(CONAN_BUILD_MODULES_PATHS_JBIG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_JBIG )

set(CONAN_C_FLAGS_JBIG "")
set(CONAN_CXX_FLAGS_JBIG "")
set(CONAN_SHARED_LINKER_FLAGS_JBIG "")
set(CONAN_EXE_LINKER_FLAGS_JBIG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_JBIG_LIST "")
set(CONAN_CXX_FLAGS_JBIG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_JBIG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_JBIG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_JBIG "${CONAN_FRAMEWORKS_JBIG}" "_JBIG" "")
# Append to aggregated values variable
set(CONAN_LIBS_JBIG ${CONAN_PKG_LIBS_JBIG} ${CONAN_SYSTEM_LIBS_JBIG} ${CONAN_FRAMEWORKS_FOUND_JBIG})


#################
###  ZSTD
#################
set(CONAN_ZSTD_ROOT "/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47")
set(CONAN_INCLUDE_DIRS_ZSTD "/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include")
set(CONAN_LIB_DIRS_ZSTD "/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib")
set(CONAN_BIN_DIRS_ZSTD )
set(CONAN_RES_DIRS_ZSTD )
set(CONAN_SRC_DIRS_ZSTD )
set(CONAN_BUILD_DIRS_ZSTD "/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/")
set(CONAN_FRAMEWORK_DIRS_ZSTD )
set(CONAN_LIBS_ZSTD zstd)
set(CONAN_PKG_LIBS_ZSTD zstd)
set(CONAN_SYSTEM_LIBS_ZSTD )
set(CONAN_FRAMEWORKS_ZSTD )
set(CONAN_FRAMEWORKS_FOUND_ZSTD "")  # Will be filled later
set(CONAN_DEFINES_ZSTD )
set(CONAN_BUILD_MODULES_PATHS_ZSTD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZSTD )

set(CONAN_C_FLAGS_ZSTD "")
set(CONAN_CXX_FLAGS_ZSTD "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZSTD_LIST "")
set(CONAN_CXX_FLAGS_ZSTD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZSTD "${CONAN_FRAMEWORKS_ZSTD}" "_ZSTD" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})


#################
###  LIBWEBP
#################
set(CONAN_LIBWEBP_ROOT "/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c")
set(CONAN_INCLUDE_DIRS_LIBWEBP "/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/include")
set(CONAN_LIB_DIRS_LIBWEBP "/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/lib")
set(CONAN_BIN_DIRS_LIBWEBP )
set(CONAN_RES_DIRS_LIBWEBP )
set(CONAN_SRC_DIRS_LIBWEBP )
set(CONAN_BUILD_DIRS_LIBWEBP "/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/")
set(CONAN_FRAMEWORK_DIRS_LIBWEBP )
set(CONAN_LIBS_LIBWEBP webpdecoder webpdemux webpmux webp)
set(CONAN_PKG_LIBS_LIBWEBP webpdecoder webpdemux webpmux webp)
set(CONAN_SYSTEM_LIBS_LIBWEBP )
set(CONAN_FRAMEWORKS_LIBWEBP )
set(CONAN_FRAMEWORKS_FOUND_LIBWEBP "")  # Will be filled later
set(CONAN_DEFINES_LIBWEBP )
set(CONAN_BUILD_MODULES_PATHS_LIBWEBP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBWEBP )

set(CONAN_C_FLAGS_LIBWEBP "")
set(CONAN_CXX_FLAGS_LIBWEBP "")
set(CONAN_SHARED_LINKER_FLAGS_LIBWEBP "")
set(CONAN_EXE_LINKER_FLAGS_LIBWEBP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBWEBP_LIST "")
set(CONAN_CXX_FLAGS_LIBWEBP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBWEBP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBWEBP "${CONAN_FRAMEWORKS_LIBWEBP}" "_LIBWEBP" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBWEBP ${CONAN_PKG_LIBS_LIBWEBP} ${CONAN_SYSTEM_LIBS_LIBWEBP} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "armv8")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "apple-clang")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libc++")
set(CONAN_SETTINGS_COMPILER_VERSION "12.0")
set(CONAN_SETTINGS_OS "iOS")
set(CONAN_SETTINGS_OS_VERSION "9.0")

set(CONAN_DEPENDENCIES gdal json-c libgeotiff flatbuffers libiconv geos proj libtiff nlohmann_json sqlite3 zlib libdeflate xz_utils libjpeg jbig zstd libwebp)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/include"
			"/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/include"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/include"
			"/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/include"
			"/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/include"
			"/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/include"
			"/Users/paulo/.conan/data/nlohmann_json/3.9.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/include"
			"/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/include"
			"/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/include"
			"/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/lib"
			"/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/lib"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/lib"
			"/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/lib"
			"/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/lib"
			"/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/lib"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/lib"
			"/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/lib"
			"/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib"
			"/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/bin"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin"
			"/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/bin"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin"
			"/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/bin"
			"/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/res"
			"/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/res"
			"/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS gdal json-c geotiff flatbuffers iconv charset geos_c geos proj tiffxx tiff sqlite3 z deflate lzma jpeg jbig zstd webpdecoder webpdemux webpmux webp ${CONAN_LIBS})
set(CONAN_PKG_LIBS gdal json-c geotiff flatbuffers iconv charset geos_c geos proj tiffxx tiff sqlite3 z deflate lzma jpeg jbig zstd webpdecoder webpdemux webpmux webp ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS c++ ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DLIBJPEG_STATIC"
			"-DLZMA_API_STATIC"
			"-DUSE_UNSTABLE_GEOS_CPP_API"
			"-DGEOS_INLINE" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS "/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin/cmake/BuildFlatBuffers.cmake" ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/Users/paulo/.conan/data/gdal/3.3.1/_/_/package/9374e3178f785d3455837d286598cb42e25b8c19/"
			"/Users/paulo/.conan/data/json-c/0.15/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/"
			"/Users/paulo/.conan/data/libgeotiff/1.7.0/_/_/package/61771bb77abf77f9f75454ab67312541a3756a6d/lib/cmake"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/"
			"/Users/paulo/.conan/data/flatbuffers/2.0.0/_/_/package/ff08247e7c68f292f7e626b93f1a9520efa2b6fe/bin/cmake"
			"/Users/paulo/.conan/data/libiconv/1.16/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/geos/3.9.1/_/_/package/a62fdc60ed05c86943a574e61ffdf69c6687d2db/"
			"/Users/paulo/.conan/data/proj/8.1.0/_/_/package/4ceb20d3a5b28cdf6610faf2e2ff2eefbe387964/"
			"/Users/paulo/.conan/data/libtiff/4.2.0/_/_/package/c5e2fd479a2dd6c5d3199d18a8378687db1b9e21/"
			"/Users/paulo/.conan/data/nlohmann_json/3.9.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/"
			"/Users/paulo/.conan/data/sqlite3/3.36.0/_/_/package/d501bf7c5ef3c3ce159c98742be2e04ff7912526/lib/cmake"
			"/Users/paulo/.conan/data/zlib/1.2.11/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/libdeflate/1.8/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/xz_utils/5.2.5/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/lib/cmake"
			"/Users/paulo/.conan/data/libjpeg/9d/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/jbig/20160605/_/_/package/32ca7d508471bd00abf2a86ac30df005358e6194/"
			"/Users/paulo/.conan/data/zstd/1.5.0/_/_/package/3789018b2882bf53cb9ed8e9abd38b829172fe47/"
			"/Users/paulo/.conan/data/libwebp/1.2.0/_/_/package/694c79823c89c2187995acecdda15d8376328c2c/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_GDAL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GDAL} ${CONAN_FRAMEWORKS_FOUND_GDAL} CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::libtiff CONAN_PKG::proj CONAN_PKG::flatbuffers CONAN_PKG::zlib CONAN_PKG::libiconv CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::geos")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GDAL_DEPENDENCIES "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GDAL}" "${CONAN_LIB_DIRS_GDAL}"
                                  CONAN_PACKAGE_TARGETS_GDAL "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES}"
                                  "" gdal)
    set(_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GDAL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GDAL_DEBUG} CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::libtiff CONAN_PKG::proj CONAN_PKG::flatbuffers CONAN_PKG::zlib CONAN_PKG::libiconv CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::geos")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GDAL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GDAL_DEBUG}" "${CONAN_LIB_DIRS_GDAL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GDAL_DEBUG "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_DEBUG}"
                                  "debug" gdal)
    set(_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GDAL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GDAL_RELEASE} CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::libtiff CONAN_PKG::proj CONAN_PKG::flatbuffers CONAN_PKG::zlib CONAN_PKG::libiconv CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::geos")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GDAL_RELEASE}" "${CONAN_LIB_DIRS_GDAL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GDAL_RELEASE "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELEASE}"
                                  "release" gdal)
    set(_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GDAL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GDAL_RELWITHDEBINFO} CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::libtiff CONAN_PKG::proj CONAN_PKG::flatbuffers CONAN_PKG::zlib CONAN_PKG::libiconv CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::geos")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GDAL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GDAL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GDAL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" gdal)
    set(_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GDAL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GDAL_MINSIZEREL} CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::libtiff CONAN_PKG::proj CONAN_PKG::flatbuffers CONAN_PKG::zlib CONAN_PKG::libiconv CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::geos")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GDAL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GDAL_MINSIZEREL}" "${CONAN_LIB_DIRS_GDAL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GDAL_MINSIZEREL "${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" gdal)

    add_library(CONAN_PKG::gdal INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::gdal PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GDAL} ${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GDAL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GDAL_RELEASE} ${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GDAL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GDAL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GDAL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GDAL_MINSIZEREL} ${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GDAL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GDAL_DEBUG} ${_CONAN_PKG_LIBS_GDAL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GDAL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GDAL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::gdal PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GDAL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GDAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GDAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GDAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GDAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::gdal PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GDAL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GDAL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GDAL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GDAL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GDAL_DEBUG}>)
    set_property(TARGET CONAN_PKG::gdal PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GDAL_LIST} ${CONAN_CXX_FLAGS_GDAL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GDAL_RELEASE_LIST} ${CONAN_CXX_FLAGS_GDAL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GDAL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GDAL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GDAL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GDAL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GDAL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GDAL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES "${CONAN_SYSTEM_LIBS_JSON-C} ${CONAN_FRAMEWORKS_FOUND_JSON-C} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JSON-C_DEPENDENCIES "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JSON-C}" "${CONAN_LIB_DIRS_JSON-C}"
                                  CONAN_PACKAGE_TARGETS_JSON-C "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES}"
                                  "" json-c)
    set(_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_JSON-C_DEBUG} ${CONAN_FRAMEWORKS_FOUND_JSON-C_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JSON-C_DEBUG}" "${CONAN_LIB_DIRS_JSON-C_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_JSON-C_DEBUG "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_DEBUG}"
                                  "debug" json-c)
    set(_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_JSON-C_RELEASE} ${CONAN_FRAMEWORKS_FOUND_JSON-C_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JSON-C_RELEASE}" "${CONAN_LIB_DIRS_JSON-C_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_JSON-C_RELEASE "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELEASE}"
                                  "release" json-c)
    set(_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_JSON-C_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_JSON-C_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JSON-C_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_JSON-C_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_JSON-C_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" json-c)
    set(_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_JSON-C_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_JSON-C_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JSON-C_MINSIZEREL}" "${CONAN_LIB_DIRS_JSON-C_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_JSON-C_MINSIZEREL "${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" json-c)

    add_library(CONAN_PKG::json-c INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::json-c PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_JSON-C} ${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JSON-C_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_JSON-C_RELEASE} ${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JSON-C_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_JSON-C_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JSON-C_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_JSON-C_MINSIZEREL} ${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JSON-C_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_JSON-C_DEBUG} ${_CONAN_PKG_LIBS_JSON-C_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JSON-C_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JSON-C_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::json-c PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_JSON-C}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_JSON-C_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_JSON-C_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_JSON-C_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_JSON-C_DEBUG}>)
    set_property(TARGET CONAN_PKG::json-c PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_JSON-C}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_JSON-C_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_JSON-C_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_JSON-C_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_JSON-C_DEBUG}>)
    set_property(TARGET CONAN_PKG::json-c PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_JSON-C_LIST} ${CONAN_CXX_FLAGS_JSON-C_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_JSON-C_RELEASE_LIST} ${CONAN_CXX_FLAGS_JSON-C_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_JSON-C_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_JSON-C_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_JSON-C_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_JSON-C_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_JSON-C_DEBUG_LIST}  ${CONAN_CXX_FLAGS_JSON-C_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBGEOTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF} CONAN_PKG::libtiff CONAN_PKG::proj")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGEOTIFF}" "${CONAN_LIB_DIRS_LIBGEOTIFF}"
                                  CONAN_PACKAGE_TARGETS_LIBGEOTIFF "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES}"
                                  "" libgeotiff)
    set(_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBGEOTIFF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF_DEBUG} CONAN_PKG::libtiff CONAN_PKG::proj")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGEOTIFF_DEBUG}" "${CONAN_LIB_DIRS_LIBGEOTIFF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBGEOTIFF_DEBUG "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_DEBUG}"
                                  "debug" libgeotiff)
    set(_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBGEOTIFF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF_RELEASE} CONAN_PKG::libtiff CONAN_PKG::proj")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGEOTIFF_RELEASE}" "${CONAN_LIB_DIRS_LIBGEOTIFF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBGEOTIFF_RELEASE "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELEASE}"
                                  "release" libgeotiff)
    set(_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBGEOTIFF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF_RELWITHDEBINFO} CONAN_PKG::libtiff CONAN_PKG::proj")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGEOTIFF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBGEOTIFF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBGEOTIFF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libgeotiff)
    set(_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBGEOTIFF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBGEOTIFF_MINSIZEREL} CONAN_PKG::libtiff CONAN_PKG::proj")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBGEOTIFF_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBGEOTIFF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBGEOTIFF_MINSIZEREL "${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libgeotiff)

    add_library(CONAN_PKG::libgeotiff INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libgeotiff PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBGEOTIFF} ${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBGEOTIFF_RELEASE} ${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBGEOTIFF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBGEOTIFF_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBGEOTIFF_DEBUG} ${_CONAN_PKG_LIBS_LIBGEOTIFF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBGEOTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBGEOTIFF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libgeotiff PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBGEOTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBGEOTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBGEOTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBGEOTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBGEOTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libgeotiff PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBGEOTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libgeotiff PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBGEOTIFF_LIST} ${CONAN_CXX_FLAGS_LIBGEOTIFF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBGEOTIFF_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBGEOTIFF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBGEOTIFF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBGEOTIFF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBGEOTIFF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBGEOTIFF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBGEOTIFF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBGEOTIFF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FLATBUFFERS} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLATBUFFERS}" "${CONAN_LIB_DIRS_FLATBUFFERS}"
                                  CONAN_PACKAGE_TARGETS_FLATBUFFERS "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES}"
                                  "" flatbuffers)
    set(_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FLATBUFFERS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLATBUFFERS_DEBUG}" "${CONAN_LIB_DIRS_FLATBUFFERS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FLATBUFFERS_DEBUG "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_DEBUG}"
                                  "debug" flatbuffers)
    set(_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FLATBUFFERS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLATBUFFERS_RELEASE}" "${CONAN_LIB_DIRS_FLATBUFFERS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FLATBUFFERS_RELEASE "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELEASE}"
                                  "release" flatbuffers)
    set(_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FLATBUFFERS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLATBUFFERS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FLATBUFFERS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FLATBUFFERS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" flatbuffers)
    set(_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FLATBUFFERS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FLATBUFFERS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FLATBUFFERS_MINSIZEREL}" "${CONAN_LIB_DIRS_FLATBUFFERS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FLATBUFFERS_MINSIZEREL "${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" flatbuffers)

    add_library(CONAN_PKG::flatbuffers INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::flatbuffers PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FLATBUFFERS} ${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FLATBUFFERS_RELEASE} ${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FLATBUFFERS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FLATBUFFERS_MINSIZEREL} ${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FLATBUFFERS_DEBUG} ${_CONAN_PKG_LIBS_FLATBUFFERS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FLATBUFFERS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FLATBUFFERS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::flatbuffers PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FLATBUFFERS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FLATBUFFERS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FLATBUFFERS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FLATBUFFERS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FLATBUFFERS_DEBUG}>)
    set_property(TARGET CONAN_PKG::flatbuffers PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FLATBUFFERS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FLATBUFFERS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FLATBUFFERS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FLATBUFFERS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FLATBUFFERS_DEBUG}>)
    set_property(TARGET CONAN_PKG::flatbuffers PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FLATBUFFERS_LIST} ${CONAN_CXX_FLAGS_FLATBUFFERS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FLATBUFFERS_RELEASE_LIST} ${CONAN_CXX_FLAGS_FLATBUFFERS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FLATBUFFERS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FLATBUFFERS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FLATBUFFERS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FLATBUFFERS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FLATBUFFERS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FLATBUFFERS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV}" "${CONAN_LIB_DIRS_LIBICONV}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}"
                                  "" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBICONV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_DEBUG}" "${CONAN_LIB_DIRS_LIBICONV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}"
                                  "debug" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBICONV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELEASE}" "${CONAN_LIB_DIRS_LIBICONV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}"
                                  "release" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBICONV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBICONV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBICONV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBICONV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libiconv)

    add_library(CONAN_PKG::libiconv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBICONV} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBICONV_LIST} ${CONAN_CXX_FLAGS_LIBICONV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBICONV_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBICONV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBICONV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBICONV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBICONV_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GEOS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GEOS} ${CONAN_FRAMEWORKS_FOUND_GEOS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GEOS_DEPENDENCIES "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GEOS}" "${CONAN_LIB_DIRS_GEOS}"
                                  CONAN_PACKAGE_TARGETS_GEOS "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES}"
                                  "" geos)
    set(_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GEOS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GEOS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GEOS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GEOS_DEBUG}" "${CONAN_LIB_DIRS_GEOS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GEOS_DEBUG "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_DEBUG}"
                                  "debug" geos)
    set(_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GEOS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GEOS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GEOS_RELEASE}" "${CONAN_LIB_DIRS_GEOS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GEOS_RELEASE "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELEASE}"
                                  "release" geos)
    set(_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GEOS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GEOS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GEOS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GEOS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GEOS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" geos)
    set(_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GEOS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GEOS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GEOS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GEOS_MINSIZEREL}" "${CONAN_LIB_DIRS_GEOS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GEOS_MINSIZEREL "${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" geos)

    add_library(CONAN_PKG::geos INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::geos PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GEOS} ${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GEOS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GEOS_RELEASE} ${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GEOS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GEOS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GEOS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GEOS_MINSIZEREL} ${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GEOS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GEOS_DEBUG} ${_CONAN_PKG_LIBS_GEOS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GEOS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GEOS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::geos PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GEOS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GEOS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GEOS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GEOS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GEOS_DEBUG}>)
    set_property(TARGET CONAN_PKG::geos PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GEOS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GEOS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GEOS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GEOS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GEOS_DEBUG}>)
    set_property(TARGET CONAN_PKG::geos PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GEOS_LIST} ${CONAN_CXX_FLAGS_GEOS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GEOS_RELEASE_LIST} ${CONAN_CXX_FLAGS_GEOS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GEOS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GEOS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GEOS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GEOS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GEOS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GEOS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PROJ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PROJ} ${CONAN_FRAMEWORKS_FOUND_PROJ} CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::libtiff")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROJ_DEPENDENCIES "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROJ}" "${CONAN_LIB_DIRS_PROJ}"
                                  CONAN_PACKAGE_TARGETS_PROJ "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES}"
                                  "" proj)
    set(_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PROJ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PROJ_DEBUG} CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::libtiff")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROJ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROJ_DEBUG}" "${CONAN_LIB_DIRS_PROJ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PROJ_DEBUG "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_DEBUG}"
                                  "debug" proj)
    set(_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PROJ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PROJ_RELEASE} CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::libtiff")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROJ_RELEASE}" "${CONAN_LIB_DIRS_PROJ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PROJ_RELEASE "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELEASE}"
                                  "release" proj)
    set(_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PROJ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PROJ_RELWITHDEBINFO} CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::libtiff")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROJ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PROJ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PROJ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" proj)
    set(_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PROJ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PROJ_MINSIZEREL} CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::libtiff")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROJ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROJ_MINSIZEREL}" "${CONAN_LIB_DIRS_PROJ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PROJ_MINSIZEREL "${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" proj)

    add_library(CONAN_PKG::proj INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::proj PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PROJ} ${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROJ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PROJ_RELEASE} ${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROJ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PROJ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROJ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PROJ_MINSIZEREL} ${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROJ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PROJ_DEBUG} ${_CONAN_PKG_LIBS_PROJ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROJ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROJ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::proj PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PROJ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PROJ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PROJ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PROJ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PROJ_DEBUG}>)
    set_property(TARGET CONAN_PKG::proj PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PROJ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PROJ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PROJ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PROJ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PROJ_DEBUG}>)
    set_property(TARGET CONAN_PKG::proj PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PROJ_LIST} ${CONAN_CXX_FLAGS_PROJ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PROJ_RELEASE_LIST} ${CONAN_CXX_FLAGS_PROJ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PROJ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PROJ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PROJ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PROJ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PROJ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PROJ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF}" "${CONAN_LIB_DIRS_LIBTIFF}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}"
                                  "" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBTIFF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_DEBUG} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_DEBUG}" "${CONAN_LIB_DIRS_LIBTIFF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_DEBUG "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}"
                                  "debug" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBTIFF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_RELEASE} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_RELEASE}" "${CONAN_LIB_DIRS_LIBTIFF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_RELEASE "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}"
                                  "release" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBTIFF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBTIFF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBTIFF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBTIFF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_MINSIZEREL "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libtiff)

    add_library(CONAN_PKG::libtiff INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBTIFF} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBTIFF_RELEASE} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBTIFF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBTIFF_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBTIFF_DEBUG} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBTIFF_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBTIFF_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBTIFF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBTIFF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBTIFF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES "${CONAN_SYSTEM_LIBS_NLOHMANN_JSON} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NLOHMANN_JSON}" "${CONAN_LIB_DIRS_NLOHMANN_JSON}"
                                  CONAN_PACKAGE_TARGETS_NLOHMANN_JSON "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES}"
                                  "" nlohmann_json)
    set(_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_NLOHMANN_JSON_DEBUG} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NLOHMANN_JSON_DEBUG}" "${CONAN_LIB_DIRS_NLOHMANN_JSON_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_DEBUG "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_DEBUG}"
                                  "debug" nlohmann_json)
    set(_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_NLOHMANN_JSON_RELEASE} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NLOHMANN_JSON_RELEASE}" "${CONAN_LIB_DIRS_NLOHMANN_JSON_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_RELEASE "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELEASE}"
                                  "release" nlohmann_json)
    set(_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_NLOHMANN_JSON_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NLOHMANN_JSON_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_NLOHMANN_JSON_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" nlohmann_json)
    set(_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_NLOHMANN_JSON_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_NLOHMANN_JSON_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NLOHMANN_JSON_MINSIZEREL}" "${CONAN_LIB_DIRS_NLOHMANN_JSON_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_MINSIZEREL "${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" nlohmann_json)

    add_library(CONAN_PKG::nlohmann_json INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::nlohmann_json PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_NLOHMANN_JSON} ${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_RELEASE} ${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_MINSIZEREL} ${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_NLOHMANN_JSON_DEBUG} ${_CONAN_PKG_LIBS_NLOHMANN_JSON_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NLOHMANN_JSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NLOHMANN_JSON_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::nlohmann_json PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_NLOHMANN_JSON}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_NLOHMANN_JSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_NLOHMANN_JSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_NLOHMANN_JSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_NLOHMANN_JSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::nlohmann_json PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_NLOHMANN_JSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::nlohmann_json PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_NLOHMANN_JSON_LIST} ${CONAN_CXX_FLAGS_NLOHMANN_JSON_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_NLOHMANN_JSON_RELEASE_LIST} ${CONAN_CXX_FLAGS_NLOHMANN_JSON_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_NLOHMANN_JSON_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_NLOHMANN_JSON_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_NLOHMANN_JSON_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_NLOHMANN_JSON_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_NLOHMANN_JSON_DEBUG_LIST}  ${CONAN_CXX_FLAGS_NLOHMANN_JSON_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3}" "${CONAN_LIB_DIRS_SQLITE3}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3 "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}"
                                  "" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE3_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_DEBUG}" "${CONAN_LIB_DIRS_SQLITE3_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE3_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELEASE}" "${CONAN_LIB_DIRS_SQLITE3_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}"
                                  "release" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE3_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE3_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE3_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE3_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite3)

    add_library(CONAN_PKG::sqlite3 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE3} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE3_LIST} ${CONAN_CXX_FLAGS_SQLITE3_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE3_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE3_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE3_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE3_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE3_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBDEFLATE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE}" "${CONAN_LIB_DIRS_LIBDEFLATE}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}"
                                  "" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBDEFLATE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_DEBUG}" "${CONAN_LIB_DIRS_LIBDEFLATE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_DEBUG "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}"
                                  "debug" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBDEFLATE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_RELEASE}" "${CONAN_LIB_DIRS_LIBDEFLATE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELEASE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}"
                                  "release" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBDEFLATE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBDEFLATE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBDEFLATE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBDEFLATE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_MINSIZEREL "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libdeflate)

    add_library(CONAN_PKG::libdeflate INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBDEFLATE} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELEASE} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_DEBUG} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBDEFLATE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBDEFLATE_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBDEFLATE_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBDEFLATE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBDEFLATE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBDEFLATE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XZ_UTILS} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS}" "${CONAN_LIB_DIRS_XZ_UTILS}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}"
                                  "" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XZ_UTILS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_DEBUG}" "${CONAN_LIB_DIRS_XZ_UTILS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_DEBUG "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}"
                                  "debug" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XZ_UTILS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_RELEASE}" "${CONAN_LIB_DIRS_XZ_UTILS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_RELEASE "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}"
                                  "release" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XZ_UTILS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XZ_UTILS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XZ_UTILS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_MINSIZEREL}" "${CONAN_LIB_DIRS_XZ_UTILS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_MINSIZEREL "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xz_utils)

    add_library(CONAN_PKG::xz_utils INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XZ_UTILS} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_RELEASE} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_MINSIZEREL} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_DEBUG} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XZ_UTILS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XZ_UTILS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XZ_UTILS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XZ_UTILS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XZ_UTILS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XZ_UTILS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XZ_UTILS_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XZ_UTILS_RELEASE_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XZ_UTILS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XZ_UTILS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XZ_UTILS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG}" "${CONAN_LIB_DIRS_LIBJPEG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}"
                                  "" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBJPEG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_DEBUG}" "${CONAN_LIB_DIRS_LIBJPEG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}"
                                  "debug" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBJPEG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELEASE}" "${CONAN_LIB_DIRS_LIBJPEG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}"
                                  "release" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBJPEG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBJPEG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBJPEG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBJPEG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libjpeg)

    add_library(CONAN_PKG::libjpeg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBJPEG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBJPEG_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBJPEG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBJPEG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBJPEG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBJPEG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_JBIG} ${CONAN_FRAMEWORKS_FOUND_JBIG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG}" "${CONAN_LIB_DIRS_JBIG}"
                                  CONAN_PACKAGE_TARGETS_JBIG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}"
                                  "" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_JBIG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_JBIG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_DEBUG}" "${CONAN_LIB_DIRS_JBIG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_JBIG_DEBUG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}"
                                  "debug" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_JBIG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_JBIG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_RELEASE}" "${CONAN_LIB_DIRS_JBIG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_JBIG_RELEASE "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}"
                                  "release" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_JBIG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_JBIG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_JBIG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_JBIG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_JBIG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_JBIG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_MINSIZEREL}" "${CONAN_LIB_DIRS_JBIG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_JBIG_MINSIZEREL "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" jbig)

    add_library(CONAN_PKG::jbig INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_JBIG} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_JBIG_RELEASE} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_JBIG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_JBIG_MINSIZEREL} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_JBIG_DEBUG} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_JBIG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_JBIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_JBIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_JBIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_JBIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_JBIG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_JBIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_JBIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_JBIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_JBIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_JBIG_LIST} ${CONAN_CXX_FLAGS_JBIG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_JBIG_RELEASE_LIST} ${CONAN_CXX_FLAGS_JBIG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_JBIG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_JBIG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_JBIG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_JBIG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD}" "${CONAN_LIB_DIRS_ZSTD}"
                                  CONAN_PACKAGE_TARGETS_ZSTD "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}"
                                  "" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZSTD_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZSTD_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_DEBUG}" "${CONAN_LIB_DIRS_ZSTD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}"
                                  "debug" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZSTD_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELEASE}" "${CONAN_LIB_DIRS_ZSTD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}"
                                  "release" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZSTD_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZSTD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZSTD_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZSTD_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_MINSIZEREL}" "${CONAN_LIB_DIRS_ZSTD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zstd)

    add_library(CONAN_PKG::zstd INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZSTD} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZSTD_RELEASE} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZSTD_DEBUG} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZSTD_LIST} ${CONAN_CXX_FLAGS_ZSTD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZSTD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZSTD_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBWEBP} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP}" "${CONAN_LIB_DIRS_LIBWEBP}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}"
                                  "" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBWEBP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_DEBUG}" "${CONAN_LIB_DIRS_LIBWEBP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_DEBUG "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}"
                                  "debug" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBWEBP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_RELEASE}" "${CONAN_LIB_DIRS_LIBWEBP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_RELEASE "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}"
                                  "release" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBWEBP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBWEBP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBWEBP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBWEBP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_MINSIZEREL "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libwebp)

    add_library(CONAN_PKG::libwebp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBWEBP} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBWEBP_RELEASE} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBWEBP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBWEBP_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBWEBP_DEBUG} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBWEBP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBWEBP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBWEBP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBWEBP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBWEBP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBWEBP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBWEBP_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBWEBP_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBWEBP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBWEBP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBWEBP_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::gdal CONAN_PKG::json-c CONAN_PKG::libgeotiff CONAN_PKG::flatbuffers CONAN_PKG::libiconv CONAN_PKG::geos CONAN_PKG::proj CONAN_PKG::libtiff CONAN_PKG::nlohmann_json CONAN_PKG::sqlite3 CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

