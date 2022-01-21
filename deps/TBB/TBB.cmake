set(_tbb_msan_cmake_args ${MSAN_CMAKE_ARGS})
if (DEP_MSAN)
    list(TRANSFORM _tbb_msan_cmake_args APPEND " -fsanitize-blacklist=${CMAKE_CURRENT_LIST_DIR}/msan_ignorelist.txt")
endif()

prusaslicer_add_cmake_project(
    TBB
    URL "https://github.com/wjakob/tbb/archive/a0dc9bf76d0120f917b641ed095360448cabc85b.tar.gz"
    URL_HASH SHA256=0545cb6033bd1873fcae3ea304def720a380a88292726943ae3b9b207f322efe
    DEPENDS ${LIBCXX_PKG}
    CMAKE_ARGS          
        -DTBB_BUILD_SHARED=OFF
        -DTBB_BUILD_TESTS=OFF
        -DTBB_BUILD_TESTS=OFF
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
        -DCMAKE_DEBUG_POSTFIX=_debug
        ${_tbb_msan_cmake_args}
)

if (MSVC)
    add_debug_dep(dep_TBB)
endif ()


