#!/bin/bash

if [[ -z "$1" ]]; then
    VERSION=0.14
else
    VERSION=$1
fi

docker build --rm --build-arg BRANCH=v$VERSION -t foxi352/knxd:$VERSION --file Dockerfile.knxd .
