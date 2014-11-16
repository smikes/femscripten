all: times-c.js times-f.js

TIMES_C=times-main.o times-c.o
TIMES_F=times-main.o times-f.o

clean:
	rm -f *.bc *.o *.ll *.s *.js

times-c.js: $(TIMES_C)
	emcc -o $@ $(TIMES_C)

times-f.js: $(TIMES_F)
	emcc -o $@ $(TIMES_F)

%.o: %.c
	emcc -c $<

%.o: %.f
	emgf $<


.PHONY: clean
