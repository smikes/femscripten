# Fortran -> JS Docker image

This project provides a [https://www.docker.com/](Docker) image that contains
a working FORTRAN -> Javascript compiler.

## TODO

1. Actually deliver on claim #1 above

## Work in Progress

There is a [https://registry.hub.docker.com/u/smikes/femscripten/](docker image) that includes llvm, gfortran, dragonegg, and emscripten.

I am trying to figure out how to do automate testing and how to automate
compilation of simple hello-world examples.

## Using the current image

To start messing around, first checkout this repository

```
$ git checkout ssh:github.com:smikes/femscripten.git
$ cd femscripten
```

get the docker image --

```
$ docker run -t -i -v `pwd`:/mnt/test smikes/femscripten:devel /bin/bash
$ cd /mnt/test
```

Now you are inside the docker container and should have access to the compiler commands.

Separate emscripten compilation of C sources to JS (works)
```
emcc times_main.c times.c -o times-c.js
```

Compile a fortran source into LLVM bitcodes (seems to work)

```
gfortran hello_world.f -S -flto -m32 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.6/plugin/dragonegg.so -o hello_world.ll
```

Assemble an LLVM bitcode (counterproductive?)

```
llvm-as times.ll -o times.o
```

Using the FORTRAN version of `times` instead of C (doesn't work)
```
emcc times_main.c times.o -o times.js
```



