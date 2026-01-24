cmake_minimum_required(VERSION 3.31.10)

project(root)

# build options

option(OF_BUILD_SINGLE_LIB "Build openFrameworks as a single library" ON)
option(OF_BUILD_ADDONS "Build openFrameworks addons" ON)
option(OF_BUILD_APPS "Build openFrameworks apps" OFF)
option(OF_BUILD_EXAMPLES "Build openFrameworks examples" ON)
option(OF_BUILD_TESTS "Build openFrameworks tests" OFF)

add_subdirectory(libs)

if(OF_BUILD_ADDONS)
    add_subdirectory(addons)
endif(OF_BUILD_ADDONS)

if(OF_BUILD_APPS)
    add_subdirectory(apps)
endif(OF_BUILD_APPS)

if(OF_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif(OF_BUILD_EXAMPLES)

if(OF_BUILD_TESTS)
    add_subdirectory(tests)
endif(OF_BUILD_TESTS)
