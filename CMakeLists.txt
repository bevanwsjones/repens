cmake_minimum_required(VERSION 3.24)

project(repens LANGUAGES CXX VERSION 0.1)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(REPENS_ENABLE_TESTS "Build the repens tests" ON)
option(REPENS_ENABLE_IWYU "Run include-what-you-use on repens targets" OFF)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
include(dependencies)

add_executable(repens src/main.cpp)
target_link_libraries(repens PRIVATE disa)

if(REPENS_ENABLE_IWYU)
  find_program(IWYU_EXECUTABLE NAMES include-what-you-use iwyu REQUIRED)
  set_target_properties(repens PROPERTIES CXX_INCLUDE_WHAT_YOU_USE ${IWYU_EXECUTABLE})
endif()

if(REPENS_ENABLE_TESTS)
  enable_testing()
  add_executable(repens_tests test/test_main.cpp)
  target_link_libraries(repens_tests PRIVATE Catch2::Catch2WithMain disa)
  include(Catch)
  catch_discover_tests(repens_tests)
endif()
