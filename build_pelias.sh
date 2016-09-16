#!/bin/bash

cd ~/workspace/api/ops
mkdir {rpm,libpostal-data,tarball}
docker run -v $(pwd)/rpm:/root/rpmbuild/RPMS/ -v $(pwd)/libpostal-data:/home/libpostal/data/ -v $(pwd)/tarball:/root/tarball pelias-build