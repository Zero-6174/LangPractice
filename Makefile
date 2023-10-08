#Makefile
CXX = g++
DEPS =

DEBUG = 0
ENABLE_WARNINGS = 1
WARNING_AS_ERROR = 0

TARGET = hello_world print_date
INCLUDE = .

CXX_STANDARD = c++17

ifeq ($(DEBUG), 1)
CXX_OPT = -g -O0
else
CXX_OPT = -O3
endif

ifeq ($(WARNING_AS_ERROR), 1)
CXX_WARNINGS = -Werror
endif

ifeq ($(ENABLE_WARNINGS), 1)
CXX_WARNINGS += -Wall -Wextra -Wpedantic
else
CXX_WARNINGS +=
endif

CXX_FLAGS = $(CXX_OPT) -std=$(CXX_STANDARD) $(CXX_WARNINGS) -I $(INCLUDE)

#TARGETS
all: $(TARGET)

hello_world: hello_world.o
	$(CXX) -o $@ $^ $(CXX_FLAGS)

print_date: print_date.o
	$(CXX) -o $@ $^ $(CXX_FLAGS)

clean:
	rm -f $(TARGET) *.o *.out

#PATTERN
%.o: %.cpp $(INCLUDE)
	$(CXX) -c -o $@ $< $(CXX_FLAGS)

#PHONY
.PHONY: all clean
