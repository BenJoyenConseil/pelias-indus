#!/bin/bash

wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz
tar xf node-v4.5.0-linux-x64.tar.xz


mv node-v4.5.0-linux-x64/bin/* /usr/bin/
mv node-v4.5.0-linux-x64/lib/* /usr/lib/
mv node-v4.5.0-linux-x64/include/* /usr/include/

# clean
#rm -rf ./node-v4.5.0-linux-x64*

