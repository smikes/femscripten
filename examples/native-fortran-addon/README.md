# FORTRAN in native addon

To use this example you must have gfortran installed.  Tested only on OSX so far.

## Prerequisites

To build native modules you need node-gyp installed globally.

```
$ npm i -g node-gyp
```

This module (femscripten) has a dependency on `nan`, which must be installed.  From this directory (examples/native-fortran-addon) do

```
$ (cd ../.. ; npm i )
```

## Building

```
$ node-gyp build
```

This will build the addon `build/Release/times.node`.  To test it, run

```
$ node test.js
Expected 6, got 6
```

## Future work with native addons

Installing gfortran is a pain, especially on Windows and OSX (took 45 minutes for `brew install gcc` to complete).

I'd like to build a docker image that can cross-compile into the native format needed by the main supported node addon targets (Linux, OSX, Windows, ARM).  That way instead of having to manage the installation of gcc, we could "just" install a docker image that produce appropriate native object code.

Probably worth trying that, as well as supporting the people who have their own FORTRAN compiler already, and also thinking about the day when we can distribute prebuilt native addons too.
