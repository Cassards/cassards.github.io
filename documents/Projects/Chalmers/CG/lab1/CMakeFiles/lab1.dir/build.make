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
include lab1/CMakeFiles/lab1.dir/depend.make

# Include the progress variables for this target.
include lab1/CMakeFiles/lab1.dir/progress.make

# Include the compile flags for this target's objects.
include lab1/CMakeFiles/lab1.dir/flags.make

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o: lab1/CMakeFiles/lab1.dir/flags.make
lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o: lab1/lab1_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab1.dir/lab1_main.cpp.o -c /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1/lab1_main.cpp

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab1.dir/lab1_main.cpp.i"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1/lab1_main.cpp > CMakeFiles/lab1.dir/lab1_main.cpp.i

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab1.dir/lab1_main.cpp.s"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1/lab1_main.cpp -o CMakeFiles/lab1.dir/lab1_main.cpp.s

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.requires:

.PHONY : lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.requires

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.provides: lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.requires
	$(MAKE) -f lab1/CMakeFiles/lab1.dir/build.make lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.provides.build
.PHONY : lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.provides

lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.provides.build: lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o


# Object files for target lab1
lab1_OBJECTS = \
"CMakeFiles/lab1.dir/lab1_main.cpp.o"

# External object files for target lab1
lab1_EXTERNAL_OBJECTS =

lab1/lab1: lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o
lab1/lab1: lab1/CMakeFiles/lab1.dir/build.make
lab1/lab1: labhelper/liblabhelper.a
lab1/lab1: labhelper/imgui/libimgui.a
lab1/lab1: /usr/lib/x86_64-linux-gnu/libGLEW.so
lab1/lab1: /usr/lib/x86_64-linux-gnu/libGL.so
lab1/lab1: /usr/lib/x86_64-linux-gnu/libGLU.so
lab1/lab1: lab1/CMakeFiles/lab1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lab1"
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lab1/CMakeFiles/lab1.dir/build: lab1/lab1

.PHONY : lab1/CMakeFiles/lab1.dir/build

lab1/CMakeFiles/lab1.dir/requires: lab1/CMakeFiles/lab1.dir/lab1_main.cpp.o.requires

.PHONY : lab1/CMakeFiles/lab1.dir/requires

lab1/CMakeFiles/lab1.dir/clean:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 && $(CMAKE_COMMAND) -P CMakeFiles/lab1.dir/cmake_clean.cmake
.PHONY : lab1/CMakeFiles/lab1.dir/clean

lab1/CMakeFiles/lab1.dir/depend:
	cd /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1 /home/sebastien/Documents/chalmers/ComputerGraphics/tutorials/TDA361/lab1/CMakeFiles/lab1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lab1/CMakeFiles/lab1.dir/depend
