CXX = g++

all: mul fma

.PHONY: all clean

fma: flags = -mfma4 -march=bdver1

objs = fmaTest.o

mul: $(objs)
	$(CXX) -o $@ $^

fmat.o: fmaTest.cpp
	$(CXX) -c -o $@ $^ $(flags)

fma: fmat.o
	$(CXX) -o $@ $^ $(flags)

%.o: %.cpp
	$(CXX) -c -o $@ $<

clean:
	-rm -f *.o fma mul
