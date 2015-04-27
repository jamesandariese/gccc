#!/bin/sh

cleanup() {
    rm -rf test/blorp
    exit ${1:-1}
}

trap cleanup HUP INT TERM

cd test
eval `../gccc windows/amd64 blorp`
go build
grep 'This program cannot be run in DOS mode' test.exe

cleanup 0
