cmake_minimum_required ( VERSION 3.0.2 )

project ( lab3 )

# Find *all* shaders.
file(GLOB_RECURSE SHADERS
    "${CMAKE_CURRENT_SOURCE_DIR}/*.vert"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.frag"
)
# Separate filter for shaders.
source_group("Shaders" FILES ${SHADERS})

# Build and link executable.
add_executable ( lab3 lab3_main.cpp ${SHADERS})
target_link_libraries ( lab3 labhelper )
config_build_output()
