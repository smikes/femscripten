all: lapack.js

clean:
	rm -f *.bc *.o *.ll *.s *.js *~

OBJ=main.o idamax.o

lapack.js: $(OBJ)
	emcc -o $@ $(OBJ)

%.o: %.c
	emcc -c $<

%.o: %.f
	emgf $<


.PHONY: clean
