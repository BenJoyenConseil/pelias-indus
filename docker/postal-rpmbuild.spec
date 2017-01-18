Name:           libpostal
Version:        0.3.3
Release:        ulaanbaatar%{?dist}
Summary:        Nothing to say

Group:          System Environment/Libraries
License:        MIT
URL:            https://github.com/openvenues/libpostal
Source0:        https://github.com/openvenues/libpostal/archive/v0.3.3.zip

BuildRequires:  snappy,snappy-devel,autoconf,automake,libtool,pkgconfig,tar

%description


%package        devel
Summary:        Development files for %{name}
Group:          Development/Libraries
Requires:       %{name} = %{version}-%{release}

%description    devel
The %{name}-devel package contains libraries and header files for
developing applications that use %{name}.


%prep
%setup -q


%build
./bootstrap.sh
%configure --disable-static --datadir=/home/libpostal/data
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig


%files
%defattr(-,root,root,-)
%{_libdir}/libpostal*.so.*
%{_bindir}/libpostal_data
%{_libdir}/libpostal.la
%{_libdir}/pkgconfig/libpostal.pc

%files devel
%defattr(-,root,root,-)
%{_libdir}/libpostal*.so
%{_bindir}/libpostal_data
%{_libdir}/libpostal.la
%{_libdir}/pkgconfig/libpostal.pc
%{_includedir}/libpostal/libpostal.h


%changelog