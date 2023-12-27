# Define the required cmake version
cmake_minimum_required(VERSION 3.20)

# Project Name and Version
project(HttpServer    VERSION 1.0.0
                      DESCRIPTION "Basic BSD based HTTP Server Created With C++"
                      LANGUAGES CXX)

# Define the Library Name
set(lib_name vector2d)

# find all the .cpp file within the src/lib directory
file(GLOB SOURCES src/lib/*.cpp)

# Declare the -std=c++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Make the cmake create the json file
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Check for build type, if not set make it (Release)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Create a static library from the source files
add_library(${lib_name} STATIC ${SOURCES})

# Specify the .h source director for the library
target_include_directories(${lib_name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src/include)

# Set the Compiler Flags options for release and debug
if(CMAKE_BUILD_TYPE MATCHES Release)
  target_compile_options(${lib_name} INTERFACE -O3 -DNDEBUG)
elseif(CMAKE_BUILD_TYPE MATCHES Debug)
  target_compile_options(${lib_name} INTERFACE -g)
endif()

# Install the library to a directory depend on build type (Release/Debug)
install(TARGETS ${lib_name}
  EXPORT ${lib_name}-targets
  ARCHIVE DESTINATION ${CMAKE_BINARY_DIR}/$<CONFIG>/lib
)

# Install the Header Files
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/include
  DESTINATION ${CMAKE_BINARY_DIR}/$<CONFIG>
  FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp" PATTERN "*.tpp"
)

# Check for Test command To enable the sub-directory
#if(BUILD_TESTING)
#  add_subdirectory(tests)
#endif()
