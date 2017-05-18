Name: rh-devsuite
Version: 1.4.0
Release: 1%{?dist}
Summary: Red Hat Development Suite
Group: Applications/File

License: ASL 2.0
Url: https://developers.redhat.com/products/devsuite/overview/

Requires: rh-eclipse46-devstudio
Requires: cdk-minishift
Requires: docker-machine-kvm

%description
The best of Red Hat development tools, integrated together, in one easy to install bundle.
Red Hat Development Suite combines Red Hat development tools such as Red Hat JBoss Developer Studio, Red Hat Container Development Kit, and OpenJDK into a single, integrated developer experience. Combining these powerful tools into a single integrated development environment results in Red Hat Development Suite — one of the most effective, powerful, and efficient development environments for all kinds of developers. 

%files

%changelog
* Wed May 17 2017 Denis Golovin<dgolovin@redhat.com>
- Initial commit
