CXX = g++-4.7

all: mul fma

.PHONY: all clean

objs = fmaTest.o

###### MUL ######

mul: flags = -Ofast -ffast-math

mult.o: fmaTest.cpp
	$(CXX) -c -o $@ $^ $(flags)

mul: mult.o
	$(CXX) -o $@ $^  $(flags)


###### FMA ######

fma: CXX = g++-4.7

fma: flags = -Ofast -ffast-math -mfma4 -march=bdver1

fmat.o: fmaTest.cpp
	$(CXX) -c -o $@ $^ $(flags)

fma: fmat.o
	$(CXX) -o $@ $^ $(flags)

%.o: %.cpp
	$(CXX) -c -o $@ $<

clean:
	-rm -f *.o fma mul
