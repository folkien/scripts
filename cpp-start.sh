#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Too few parameters! Give project name ! [name]"
fi

project="${1}"

mkdir ${project}
cd ${project}

# Create main
cat > main.cpp << EOF
#include <stdio.h>
#include <stdint.h>
#include <iostream>
#include <list>
#include <vector>
#include <algorithm>

using namespace std;


int main(int argc, char* argv[])
{
    uint32_t value = 0;
    printf("Name %s Value %d 0x%02x.\n","value",value,value);
    std::cout << "Cout is working." << std::endl;
    return 0;
}
EOF

# Create makefile
cat > Makefile << EOF
CXXFLAGS =	-O0 -g3 -Wall -fmessage-length=0 -std=c++11

OBJS =		main.o

LIBS = 

TARGET =	program

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
run:
	gdbgui $(TARGET)
EOF
