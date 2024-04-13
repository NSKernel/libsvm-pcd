CXX ?= g++
AR ?= ar
ROOT_DIR ?= ../../../../
CFLAGS = -Wall -Wconversion -O3 -fPIC -nostdinc -fno-builtin-printf -I. -I$(ROOT_DIR)/include -I$(SGX_SDK)/include -I$(SGX_SDK)/include/tlibc -DPCD_CONFIG_RUNTIME_WAMR -I$(ROOT_DIR)/runtime/wamr/wasm-micro-runtime/core/iwasm/include -I$(ROOT_DIR)/runtime/wamr/wasm-micro-runtime/core/iwasm/interpreter -I$(ROOT_DIR)/runtime/wamr/wasm-micro-runtime/core/shared/utils -I$(ROOT_DIR)/runtime/wamr/wasm-micro-runtime/core/shared/platform/linux-sgx

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
