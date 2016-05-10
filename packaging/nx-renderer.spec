Name:    nx-renderer
Version: 0.0.1
Release: 0
License: Apache 2.0
Summary: Nexell drm renderer library
Group: Development/Libraries
Source:  %{name}-%{version}.tar.gz

BuildRequires:  pkgconfig(glib-2.0)
BuildRequires:  libdrm

Requires(post): /sbin/ldconfig
Requires(postun): /sbin/ldconfig

%description
Nexell renderer library

%package devel
Summary: Nexell drm renderer library
Group: Development/Libraries
License: Apache 2.0
Requires: %{name} = %{version}-%{release}

%description devel
Nexell drm renderer library (devel)

%prep
%setup -q

%build
make

%postun -p /sbin/ldconfig

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/usr/include
cp %{_builddir}/%{name}-%{version}/include/dp.h %{buildroot}/usr/include
cp %{_builddir}/%{name}-%{version}/include/dp_common.h %{buildroot}/usr/include

mkdir -p %{buildroot}/usr/lib
cp %{_builddir}/%{name}-%{version}/libnx-renderer.so  %{buildroot}/usr/lib

%files
%attr (0644, root, root) %{_libdir}/libnx-renderer.so

%files devel
%attr (0644, root, root) %{_includedir}/dp.h
%attr (0644, root, root) %{_includedir}/dp_common.h
