#!/bin/bash

set -e
cd "${BASH_SOURCE%/*}"

if [[ ! -e "protobuf-release" ]]
then
  curl -OL https://github.com/blinksh/build-protobuf/releases/download/2.6.1/protobuf-2.6.1.tar.gz
  tar -zxf protobuf-2.6.1.tar.gz || { echo "Protobuf download error"; exit 1; }
  mv -f protobuf-2.6.1/ protobuf-release
fi


echo "Building Mosh"
./build-mosh.sh && ./create-libmoshios-framework.sh
