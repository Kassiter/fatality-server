#!/bin/bash

unzip 'tmp/'"$1" -d './tmp/'"$2"

cd './tmp/'"$2"
find . -not -name \*.bz2 -exec bzip2 -zk \{\} \;

