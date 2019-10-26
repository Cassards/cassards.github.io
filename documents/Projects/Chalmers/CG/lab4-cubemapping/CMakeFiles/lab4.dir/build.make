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
include lab4-cubemapping/CMakeFiles/lab4.dir/depend.make

# Include the progress variables for this target.
include lab4-cubemapping/CMakeFiles/lab4.dir/progress.make

# Include the compile flags for this target's objects.
include lab4-cubemapping/CMakeFiles/lab4.dir/flags.make

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o: lab4-cubemapping/CMakeFiles/lab4.dir/flags.make
lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o: lab4-cubemapping/lab4_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab4.dir/lab4_main.cpp.o -c /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping/lab4_main.cpp

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab4.dir/lab4_main.cpp.i"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping/lab4_main.cpp > CMakeFiles/lab4.dir/lab4_main.cpp.i

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab4.dir/lab4_main.cpp.s"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping/lab4_main.cpp -o CMakeFiles/lab4.dir/lab4_main.cpp.s

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.requires:

.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.requires

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.provides: lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.requires
	$(MAKE) -f lab4-cubemapping/CMakeFiles/lab4.dir/build.make lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.provides.build
.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.provides

lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.provides.build: lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o


# Object files for target lab4
lab4_OBJECTS = \
"CMakeFiles/lab4.dir/lab4_main.cpp.o"

# External object files for target lab4
lab4_EXTERNAL_OBJECTS =

lab4-cubemapping/lab4: lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o
lab4-cubemapping/lab4: lab4-cubemapping/CMakeFiles/lab4.dir/build.make
lab4-cubemapping/lab4: labhelper/liblabhelper.a
lab4-cubemapping/lab4: labhelper/imgui/libimgui.a
lab4-cubemapping/lab4: /usr/lib/x86_64-linux-gnu/libGLEW.so
lab4-cubemapping/lab4: /usr/lib/x86_64-linux-gnu/libGL.so
lab4-cubemapping/lab4: /usr/lib/x86_64-linux-gnu/libGLU.so
lab4-cubemapping/lab4: lab4-cubemapping/CMakeFiles/lab4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lab4"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lab4-cubemapping/CMakeFiles/lab4.dir/build: lab4-cubemapping/lab4

.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/build

lab4-cubemapping/CMakeFiles/lab4.dir/requires: lab4-cubemapping/CMakeFiles/lab4.dir/lab4_main.cpp.o.requires

.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/requires

lab4-cubemapping/CMakeFiles/lab4.dir/clean:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping && $(CMAKE_COMMAND) -P CMakeFiles/lab4.dir/cmake_clean.cmake
.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/clean

lab4-cubemapping/CMakeFiles/lab4.dir/depend:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab4-cubemapping/CMakeFiles/lab4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lab4-cubemapping/CMakeFiles/lab4.dir/depend
