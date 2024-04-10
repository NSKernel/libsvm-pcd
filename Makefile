CXX ?= g++
AR ?= ar
CFLAGS = -Wall -Wconversion -O3 -fPIC -nostdinc -fno-builtin-printf -I . -I$(SGX_SDK)/include -I$(SGX_SDK)/include/tlibc

# Uncomment the following lines to enable parallelization with OpenMP
# CFLAGS += -fopenmp
# SHARED_LIB_FLAG += -fopenmp

all: libsvm.a

libsvm.a: svm.o
	@$(AR) -rcs $@ svm.o
svm.o: svm.cpp svm.h
	$(CXX) $(CFLAGS) -c svm.cpp
clean:
	rm -f *~ svm.o libsvm.a
