cmake_minimum_required ( VERSION 3.0.2 )

project ( lab1 )

# Find *all* shaders.
file(GLOB_RECURSE SHADERS
    "${CMAKE_CURRENT_SOURCE_DIR}/*.vert"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.frag"
)
# Separate filter for shaders.
source_group("Shaders" FILES ${SHADERS})

# Build and link executable.
add_executable ( lab1 lab1_main.cpp ${SHADERS} )
target_link_libraries ( lab1 labhelper )
config_build_output()
