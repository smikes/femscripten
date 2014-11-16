# dockerhub - A repository for various dockerfiles
# For more information; http://github.com/cmfatih/dockerhub
#
# Emscripten
#
# Test
#   docker run smikes/femscripten /srv/var/emscripten/emcc -v
#   docker run -v `pwd`:/mnt/test smikes/femscripten /srv/var/emscripten/emcc /mnt/test/test.cpp -o /mnt/test/test.cpp.js

# VERSION 2.0.1
# derived from cmfatih/emscripten 1.0.1
# and from nacyot/fortran-gfortran

FROM ubuntu:12.04

MAINTAINER smikes

# Env
ENV EMSCRIPTEN_VERSION 1.26.0

# Commands
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
        bzip2 \
        cmake \
        curl \
        dragonegg \
        g++ \
        gcc-4.6-plugin-dev \
        gfortran \
        git \
        htop \
        libgmp3-dev \
        make \
        nodejs \
        python \
        python-software-properties \
        software-properties-common \
        vim  \
        wget \
        zip && \
  mkdir -p /srv/var && \
  wget -qO /tmp/emscripten.tar.gz https://github.com/kripken/emscripten/archive/$EMSCRIPTEN_VERSION.tar.gz && \
  tar -zxf /tmp/emscripten.tar.gz -C /tmp && \
  mv /tmp/emscripten-$EMSCRIPTEN_VERSION/ /srv/var/emscripten && \
  rm -f /tmp/emscripten.tar.gz && \
  wget -qO /tmp/emscripten-fastcomp.tar.gz https://github.com/kripken/emscripten-fastcomp/archive/$EMSCRIPTEN_VERSION.tar.gz && \
  tar -zxf /tmp/emscripten-fastcomp.tar.gz -C /tmp && \
  mv /tmp/emscripten-fastcomp-$EMSCRIPTEN_VERSION/ /srv/var/emscripten-fastcomp && \
  rm -f /tmp/emscripten-fastcomp.tar.gz && \
  wget -qO /tmp/emscripten-fastcomp-clang.tar.gz https://github.com/kripken/emscripten-fastcomp-clang/archive/$EMSCRIPTEN_VERSION.tar.gz && \
  tar -zxf /tmp/emscripten-fastcomp-clang.tar.gz -C /tmp && \
  mv /tmp/emscripten-fastcomp-clang-$EMSCRIPTEN_VERSION/ /srv/var/emscripten-fastcomp/tools/clang && \
  rm -rf /tmp/emscripten-fastcomp-clang.tar.gz && \
  mkdir -p /srv/var/emscripten-fastcomp/build && \
  cd /srv/var/emscripten-fastcomp/build && /srv/var/emscripten-fastcomp/configure --enable-optimized --disable-assertions --enable-targets=host,js && \
  cd /srv/var/emscripten-fastcomp/build && make -j 2 && \
  add-apt-repository -y ppa:chris-lea/node.js && \
  apt-get update && \
  apt-get install -y nodejs && \
  echo "export PATH=$PATH:/srv/var/emscripten:/srv/var/emscripten-fastcomp/build/Release/bin/" >> /root/.bashrc && \
  echo "export LLVM=/srv/var/emscripten-fastcomp/build/Release/bin/" >> /root/.bashrc && \
  cp -f /root/.bashrc /.bashrc && \
  /srv/var/emscripten/emcc -v && \
  apt-get autoremove -y && \
  apt-get clean all

# Env
ENV PATH $PATH:/srv/var/emscripten:/srv/var/emscripten-fastcomp/build/Release/bin/:/mnt/test/bin
ENV LLVM /srv/var/emscripten-fastcomp/build/Release/bin/

# Default command
CMD ["/srv/var/emscripten/emcc"]
