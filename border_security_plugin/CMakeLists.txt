cmake_minimum_required(VERSION 3.15)

PROJECT(BORDER_SECURITY_PLUGIN
LANGUAGES CXX
VERSION 0.0.2
)

# for clang-tidy (this enables finding system header files).
if(CMAKE_EXPORT_COMPILE_COMMANDS)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES )
endif()

# Enable JUCE. Do not use find_package to prevent mixing up with one globally installed.
add_subdirectory($ENV{PWD}/JUCE JUCE)

add_subdirectory(src)
