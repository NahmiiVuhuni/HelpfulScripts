# Runs on normal Linux distros with Bash, and WSL 2 distros from within their terminal. Do not run on Docker for Windows.
# This does work on WSL 2, but due to permission issues, it will fail when in /mnt/c, so go to your Linux user home first.
#!/bin/bash
set +x

if [ -d "vyos-build" ]
then
    sudo rm -rf vyos-build
fi

git clone -b crux --single-branch https://github.com/vyos/vyos-build
cd vyos-build
docker run -it --rm -d --name vyos-build-1.2.0 --privileged -v $(pwd):/vyos -w /vyos vyos/vyos-build:crux bash

docker exec -it vyos-build-1.2.0 ./configure --architecture amd64 --build-by "insert@email.here" --build-type release --version 1.2.0
docker exec -it vyos-build-1.2.0 sudo make iso
docker stop vyos-build-1.2.0

cp build/vyos-1.2.0-amd64.iso ..
cd ..

if [ -d "vyos-build" ]
then
    sudo rm -rf vyos-build
fi
