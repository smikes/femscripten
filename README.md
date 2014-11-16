# Fortran -> JS Docker image

This project provides a [Docker](https://www.docker.com/) image that contains
a working FORTRAN -> Javascript compiler.

## TODO

1. Actually deliver on claim #1 above
- [x] make Docker image that can run emscripten
- [x] add gcc + dragonegg to image
- [x] produce C main + Fortran obj
- [ ] make F->js library files
- [ ] support Fortran standard library (small)
- [ ] support Fortran main

## Work in Progress

There is a [docker image](https://registry.hub.docker.com/u/smikes/femscripten/) that includes llvm, gfortran, dragonegg, and emscripten.

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
$ . setup-env.sh
```

Now you are inside the docker container and should have access to the compiler commands.

## Commands

### emgf

This is the main useful program.  It is a shell script which takes one argument, a fortran file, and generates an emscripten-compatible object file.

```
$ emgf foo.f   => produces foo.o
```

BUGS: This currently also produces foo.s, foo.ll ; and it uses an ugly workaround to get from the dragonegg default target (below):

```
target datalayout = "e-p:32:32:32-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f16:16:16-f32:32:32-f64:32:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386--linux-gnu"
```

to the correct emscripten target.

However it works!  Good enough for now.


## Examples

### Times

```
$ cd examples/times
$ make
```

There is one `main` function, in times-main.c.  It expects an external function named `times_` (note the C-to-FORTRAN naming convention) which takes two floats by reference, and returns their product.

There are two implementaions of `times_` provided: one in C (`times-c.c`) and one in FORTRAN 77 (`times-f.f`).

The `make` should succeed and you should be able to run both quasi-executables through node:

```
$ node times-c.js
6.000000

$ node times-f.js
6.000000
```

### Lapack

```
$ cd examples/lapack
$ make
```

This is an example that uses a very simple subroutine from LAPACK - IDAMAX, find the index of the maximum element in an array of doubles.

```
$ node lapack.js
let's ask BLAS/IDAMAX what's the index of the largest value
in the array: { 0.0, 300.0, 1.345e39, -452.0 }; 

It should be the third element; we got ==> 3

Note that FORTRAN has 1-based arrays by default
```

### Hello

Not yet working -- some gfortran library functions need to be implemented.

```
$ emgf hello_world.f
$ emcc -o hello_world.js hello_world.o
warning: unresolved symbol: _gfortran_st_write_done
warning: unresolved symbol: _gfortran_transfer_character_write
warning: unresolved symbol: _gfortran_set_args
warning: unresolved symbol: _gfortran_set_options
warning: unresolved symbol: _gfortran_st_write
```

