CXX = g++

all: fma

.PHONY: all clean

fma: flags = -mfma4 -march=bdver1

objs = fmaTest.o

fma: $(objs)
	$(CXX) -o $@ $^ $(flags)

%.o: %.cpp
	$(CXX) -c -o $@ $<

clean:
	-rm -f *.o fma
