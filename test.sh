#!/bin/sh

cleanup() {
    rm -rf blorp
    exit ${1:-1}
}

trap cleanup HUP INT TERM

cd test
eval `../gccc windows/amd64 blorp`
go build
grep 'This program cannot be run in DOS mode' test.exe || exit 1

cleanup 0
