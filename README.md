gccc
===

A Go Cross Compiler Compiler

##USAGE

Inside a project you wish to build:

    eval `./gccc darwin/amd64 darwingocc`
    go build

Running gccc will cause a cross compiler to be built
and eval will cause the proper go env to be imported
in your current shell making any further uses of the
go toolchain build cross compiled applications.

##TESTING

`test.sh` will build a hello world application for windows/amd64
and ensure that it built a likely executable.
