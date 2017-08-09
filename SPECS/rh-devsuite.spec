Name: rh-devsuite
Version: 2.0.0
Release: 1%{?dist}
Summary: Red Hat Development Suite
Group: Applications/File
Source0: rh-devsuite-src-2.0.0-1.tar.gz
License: ASL 2.0
Url: https://developers.redhat.com/products/devsuite/overview/

Requires: rh-eclipse46-devstudio
Requires: cdk-minishift
Requires: docker-machine-kvm

BuildRoot: %{_tmppath}/%{name}-buildroot

%description
The best of Red Hat development tools, integrated together, in one easy to install bundle.
Red Hat Development Suite combines Red Hat development tools such as Red Hat JBoss Developer Studio, Red Hat Container Development Kit, and OpenJDK into a single, integrated developer experience. Combining these powerful tools into a single integrated development environment results in Red Hat Development Suite — one of the most effective, powerful, and efficient development environments for all kinds of developers.

%prep
%setup -q
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/etc/rh-devsuite
install -m 0755 setup-cdk.sh $RPM_BUILD_ROOT/etc/rh-devsuite/setup-cdk.sh

%files
%dir /etc/rh-devsuite
/etc/rh-devsuite/setup-cdk.sh

%changelog
* Tue Aug 8 2017 Denis Golovin<dgolovin@redhat.com>
- Update version to 2.0.0
* Wed Jun 21 2017 Denis Golovin<dgolovin@redhat.com>
- Update version to 1.4.1
* Wed May 17 2017 Denis Golovin<dgolovin@redhat.com>
- Initial commit
