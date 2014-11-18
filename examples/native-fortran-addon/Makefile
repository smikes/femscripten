# this emits a list of files/libraries to link to
# full path makes life easier for node-gyp
all: times.o
	echo `pwd`/$<

clean:
	rm -f *.o

%.o: %.f
	gfortran -O2 -c $<
