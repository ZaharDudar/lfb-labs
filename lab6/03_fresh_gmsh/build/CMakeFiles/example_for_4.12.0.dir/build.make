# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zahar/labsLFB/lab6/03_fresh_gmsh

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zahar/labsLFB/lab6/03_fresh_gmsh/build

# Include any dependencies generated for this target.
include CMakeFiles/example_for_4.12.0.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/example_for_4.12.0.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/example_for_4.12.0.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example_for_4.12.0.dir/flags.make

CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o: CMakeFiles/example_for_4.12.0.dir/flags.make
CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o: ../example_for_4.12.0.cpp
CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o: CMakeFiles/example_for_4.12.0.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zahar/labsLFB/lab6/03_fresh_gmsh/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o -MF CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o.d -o CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o -c /home/zahar/labsLFB/lab6/03_fresh_gmsh/example_for_4.12.0.cpp

CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zahar/labsLFB/lab6/03_fresh_gmsh/example_for_4.12.0.cpp > CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.i

CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zahar/labsLFB/lab6/03_fresh_gmsh/example_for_4.12.0.cpp -o CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.s

# Object files for target example_for_4.12.0
example_for_4_12_0_OBJECTS = \
"CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o"

# External object files for target example_for_4.12.0
example_for_4_12_0_EXTERNAL_OBJECTS =

example_for_4.12.0: CMakeFiles/example_for_4.12.0.dir/example_for_4.12.0.cpp.o
example_for_4.12.0: CMakeFiles/example_for_4.12.0.dir/build.make
example_for_4.12.0: /home/zahar/gmsh-4.12.2/lib/libgmsh.so
example_for_4.12.0: CMakeFiles/example_for_4.12.0.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zahar/labsLFB/lab6/03_fresh_gmsh/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example_for_4.12.0"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_for_4.12.0.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example_for_4.12.0.dir/build: example_for_4.12.0
.PHONY : CMakeFiles/example_for_4.12.0.dir/build

CMakeFiles/example_for_4.12.0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/example_for_4.12.0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/example_for_4.12.0.dir/clean

CMakeFiles/example_for_4.12.0.dir/depend:
	cd /home/zahar/labsLFB/lab6/03_fresh_gmsh/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zahar/labsLFB/lab6/03_fresh_gmsh /home/zahar/labsLFB/lab6/03_fresh_gmsh /home/zahar/labsLFB/lab6/03_fresh_gmsh/build /home/zahar/labsLFB/lab6/03_fresh_gmsh/build /home/zahar/labsLFB/lab6/03_fresh_gmsh/build/CMakeFiles/example_for_4.12.0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example_for_4.12.0.dir/depend

