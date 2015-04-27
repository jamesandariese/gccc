#!/bin/sh

cleanup() {
    rm -rf test/blorp
    rm test/go
    exit ${1:-1}
}

trap cleanup HUP INT TERM

cd test

if [ x"$1" = x-newgo ];then
    echo false > go
    chmod +x go
    export PATH="$PWD:$PATH"
fi

eval `../gccc windows/amd64 blorp`
go build
grep 'This program cannot be run in DOS mode' test.exe

cleanup 0
