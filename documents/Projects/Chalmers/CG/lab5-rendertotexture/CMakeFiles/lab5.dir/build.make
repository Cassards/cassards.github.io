# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361

# Include any dependencies generated for this target.
include lab5-rendertotexture/CMakeFiles/lab5.dir/depend.make

# Include the progress variables for this target.
include lab5-rendertotexture/CMakeFiles/lab5.dir/progress.make

# Include the compile flags for this target's objects.
include lab5-rendertotexture/CMakeFiles/lab5.dir/flags.make

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o: lab5-rendertotexture/CMakeFiles/lab5.dir/flags.make
lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o: lab5-rendertotexture/lab5_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/lab5_main.cpp.o -c /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/lab5_main.cpp

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/lab5_main.cpp.i"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/lab5_main.cpp > CMakeFiles/lab5.dir/lab5_main.cpp.i

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/lab5_main.cpp.s"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/lab5_main.cpp -o CMakeFiles/lab5.dir/lab5_main.cpp.s

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.requires:

.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.requires

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.provides: lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.requires
	$(MAKE) -f lab5-rendertotexture/CMakeFiles/lab5.dir/build.make lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.provides.build
.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.provides

lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.provides.build: lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o


lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o: lab5-rendertotexture/CMakeFiles/lab5.dir/flags.make
lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o: lab5-rendertotexture/hdr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab5.dir/hdr.cpp.o -c /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/hdr.cpp

lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab5.dir/hdr.cpp.i"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/hdr.cpp > CMakeFiles/lab5.dir/hdr.cpp.i

lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab5.dir/hdr.cpp.s"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/hdr.cpp -o CMakeFiles/lab5.dir/hdr.cpp.s

lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.requires:

.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.requires

lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.provides: lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.requires
	$(MAKE) -f lab5-rendertotexture/CMakeFiles/lab5.dir/build.make lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.provides.build
.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.provides

lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.provides.build: lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o


# Object files for target lab5
lab5_OBJECTS = \
"CMakeFiles/lab5.dir/lab5_main.cpp.o" \
"CMakeFiles/lab5.dir/hdr.cpp.o"

# External object files for target lab5
lab5_EXTERNAL_OBJECTS =

lab5-rendertotexture/lab5: lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o
lab5-rendertotexture/lab5: lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o
lab5-rendertotexture/lab5: lab5-rendertotexture/CMakeFiles/lab5.dir/build.make
lab5-rendertotexture/lab5: labhelper/liblabhelper.a
lab5-rendertotexture/lab5: labhelper/imgui/libimgui.a
lab5-rendertotexture/lab5: /usr/lib/x86_64-linux-gnu/libGLEW.so
lab5-rendertotexture/lab5: /usr/lib/x86_64-linux-gnu/libGL.so
lab5-rendertotexture/lab5: /usr/lib/x86_64-linux-gnu/libGLU.so
lab5-rendertotexture/lab5: lab5-rendertotexture/CMakeFiles/lab5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable lab5"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lab5-rendertotexture/CMakeFiles/lab5.dir/build: lab5-rendertotexture/lab5

.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/build

lab5-rendertotexture/CMakeFiles/lab5.dir/requires: lab5-rendertotexture/CMakeFiles/lab5.dir/lab5_main.cpp.o.requires
lab5-rendertotexture/CMakeFiles/lab5.dir/requires: lab5-rendertotexture/CMakeFiles/lab5.dir/hdr.cpp.o.requires

.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/requires

lab5-rendertotexture/CMakeFiles/lab5.dir/clean:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture && $(CMAKE_COMMAND) -P CMakeFiles/lab5.dir/cmake_clean.cmake
.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/clean

lab5-rendertotexture/CMakeFiles/lab5.dir/depend:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab5-rendertotexture/CMakeFiles/lab5.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lab5-rendertotexture/CMakeFiles/lab5.dir/depend

