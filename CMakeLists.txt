# Copyright © 2023 Zen Shawn. All rights reserved.
# Created at 10:54:22, February 13, 2023

cmake_minimum_required(VERSION 3.21)

option(BUILD_SHARED_LIBS "build shared libs" OFF)

set(CMAKE_BUILD_TYPE "Release" CACHE STRING "build type, Release/Debug/MinSizeRel/RelWithDebInfo")
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_INCLUDE_CURRENT_DIR TRUE)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_INSTALL_DEFAULT_COMPONENT_NAME Default)

project(ApplicationName VERSION 0.0.1 DESCRIPTION "Instroduction about ApplicationName")

find_package(Qt6 CONFIG REQUIRED COMPONENTS Widgets UiTools LinguistTools)
find_package(spdlog CONFIG REQUIRED)

add_compile_options(/W3)
add_subdirectory(Src)

configure_file(${CMAKE_SOURCE_DIR}/CMake/CMakeUninstall.cmake.in
    ${CMAKE_BINARY_DIR}/CMakeUninstall.cmake IMMEDIATE @ONLY)

install(FILES ${CMAKE_SOURCE_DIR}/Packaging/Window.ico
    DESTINATION resources
    COMPONENT MainExe)

add_custom_target(uninstall "${CMAKE_COMMAND}" -P
    "${CMAKE_BINARY_DIR}/CMakeUninstall.cmake")

# packaging ###
include(CMake/Packaging.cmake)
