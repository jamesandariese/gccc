#!/bin/sh

cleanup() {
    rm -rf blorp
    rm -f go
    exit ${1:-1}
}

trap cleanup HUP INT TERM

cd test

if [ x"$1" = x-newgo ];then
    cat > go <<EOF
#!/bin/sh
1>&2 echo "forced by -newgo"
false
EOF
    chmod +x go
    export PATH="$PWD:$PATH"
fi

NEWENV="`../gccc windows/amd64 blorp`"
if [ $? -ne 0 ];then
    exit 1
fi

go build
grep 'This program cannot be run in DOS mode' test.exe || exit 1

cleanup 0
