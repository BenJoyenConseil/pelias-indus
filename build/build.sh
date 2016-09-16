#!/bin/bash
wget https://github.com/openvenues/libpostal/archive/master.zip
mv master.zip /root/rpmbuild/SOURCES/

rpmbuild -ba /root/rpmbuild/SPECS/postal-rpmbuild.spec
yum install -y --nogpgcheck \
        /root/rpmbuild/RPMS/x86_64/libpostal-master*.rpm \
        /root/rpmbuild/RPMS/x86_64/libpostal-devel-*.rpm

mkdir -p /home/node/
cd /home/node/
source /opt/rh/devtoolset-3/enable

## API
git clone https://github.com/pelias/api.git && cd api

### apply source PATCH
rm query/search_defaults.js
rm query/text_parser.js
mv /patch/search_defaults.js query/
mv /patch/text_parser.js query/

## end PATCH
/usr/bin/npm install	
mkdir /root/tarball
cd /home/node/api
tar -zcvf pelias-api.tar.gz *
mv pelias-api.tar.gz /root/tarball/
rm -rf /home/node/api/

## OpenStreetMap
cd /home/node/
git clone https://github.com/pelias/openstreetmap.git && cd openstreetmap
/usr/bin/npm install	

## OpenAddresses
cd /home/node/
git clone https://github.com/pelias/openaddresses.git && cd openaddresses
/usr/bin/npm install	

## Geonames
cd /home/node/
git clone https://github.com/pelias/geonames.git && cd geonames
/usr/bin/npm install	

cd /home/node/
tar -zcvf osm-importer.tar.gz *
mv osm-importer.tar.gz /root/tarball/