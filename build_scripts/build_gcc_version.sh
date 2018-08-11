#!/bin/bash

GMP_VERSION=6.1.2
MPFR_VERSION=3.1.6
MPC_VERSION=1.0.3

GCC_VERSION=7.2.0

./build_gcc.sh $GCC_VERSION $GMP_VERSION $MPFR_VERSION $MPC_VERSION
