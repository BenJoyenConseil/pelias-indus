FROM centos:6.7
MAINTAINER Benjamin Joyen-Conseil <bjc@octo.com>

RUN yum install -y centos-release-scl-rh epel-release && \
    yum install -y yum-utils rpmdevtools make git devtoolset-3-gcc-c++ devtoolset-3-binutils python27 && \
    yum install -y vim tar wget && yum clean all && \
	yum install -y snappy snappy-devel autoconf automake libtool pkgconfig rpm-build redhat-rpm-config

WORKDIR /root/
RUN mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} && echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
COPY ./postal-rpmbuild.spec /root/rpmbuild/SPECS/

WORKDIR /
COPY ./install_nodejs.sh /install_nodejs.sh
RUN chmod +x /install_nodejs.sh
RUN /install_nodejs.sh

VOLUME ["/root/rpmbuild/RPMS" "/home/libpostal/data", "/root/tarball"]
COPY ./install_pelias.sh /usr/bin/build

CMD ["build", "v3.15.0"]
