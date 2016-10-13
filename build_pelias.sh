#!/bin/bash

cd ~/workspace/pelias_indus/
docker build -t pelias-build:v3.3.0 -f docker/Dockerfile ./docker/
mkdir {rpm,libpostal-data,tarball}
docker run -v $(pwd)/rpm:/root/rpmbuild/RPMS/ -v $(pwd)/libpostal-data:/home/libpostal/data/ -v $(pwd)/tarball:/root/tarball pelias-build:v3.3.0
