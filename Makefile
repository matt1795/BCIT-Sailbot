# This makefile builds all the object files from the source directory, you can
# add in specific recipes for your own executables

# Compiler
CC=g++

# Options Passed to compiler
CFLAGS=-c -Wall -std=c++0x -I./include -lpthread -lm -lgps

# Directories
sourceDir = source/
buildDir = build/

sources = $(wildcard $(sourceDir)*.cpp)
objects = $(patsubst $(sourceDir)%.cpp, $(buildDir)%.o, $(sources))

all: print $(objects)
	$(CC)  $(objects) -o bin/main -std=c++0x -lpthread -lm -lgps -I./include

print: 
	echo $(objects)

# Makefile syntax
$(objects): $(buildDir)%.o : $(sourceDir)%.cpp
	-$(CC) $(CFLAGS) $< -o $@
