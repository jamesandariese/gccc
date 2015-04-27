gccc
===

A Go Cross Compiler Compiler

##INSTALLATION

GCCC is a shell script which can be run in place.

It should be downloaded from https://github.com/jamesandariese/gccc/releases to the directory where you'll be running it.

##USAGE

Inside a project you wish to build:

    wget <RELEASE URL>
    chmod +x gccc
    eval `./gccc darwin/amd64 darwingocc`
    go build

Running gccc will cause a cross compiler to be built
and eval will cause the proper go env to be imported
in your current shell making any further uses of the
go toolchain build cross compiled applications.

##TESTING

`test.sh` will build a hello world application for windows/amd64
and ensure that it built a likely executable.
