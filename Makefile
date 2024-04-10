CXX ?= g++
AR ?= ar
CFLAGS = -Wall -Wconversion -O3 -fPIC
SHVER = 3
OS = $(shell uname)
ifeq ($(OS),Darwin)
	SHARED_LIB_FLAG = -dynamiclib -Wl,-install_name,libsvm.so.$(SHVER)
else
	SHARED_LIB_FLAG = -shared -Wl,-soname,libsvm.so.$(SHVER)
endif

# Uncomment the following lines to enable parallelization with OpenMP
# CFLAGS += -fopenmp
# SHARED_LIB_FLAG += -fopenmp

all: lib

lib: svm.o
	@$(AR) -rcs $@ $(OBJS) svm.o -o libsvm.a
svm.o: svm.cpp svm.h
	$(CXX) $(CFLAGS) -c svm.cpp
clean:
	rm -f *~ svm.o libsvm.a
