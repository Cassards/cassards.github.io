cmake_minimum_required ( VERSION 3.0.2 )

project ( lab4 )

# Find *all* shaders.
file(GLOB_RECURSE SHADERS
    "${CMAKE_CURRENT_SOURCE_DIR}/*.vert"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.frag"
)
# Separate filter for shaders.
source_group("Shaders" FILES ${SHADERS})

# Build and link executable.
add_executable ( lab4 lab4_main.cpp ${SHADERS})
target_link_libraries ( lab4 labhelper )
config_build_output()
