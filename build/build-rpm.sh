#!/bin/sh
rm -rf $(pwd)/rpmbuild/
mkdir -p $(pwd)/rpmbuild/SOURCES/
version="$(grep -o 'Version: [1-9]\{1\}.[0-9]\{1\}.[0-9]\{1\}' ./SPECS/rh-devsuite.spec | grep -o '[1-9]\{1\}.[0-9]\{1\}.[0-9]\{1\}')"
echo $version
tar --xform=s/rh-devsuite/rh-devsuite-$version/ -cvzf $(pwd)/rpmbuild/SOURCES/rh-devsuite-src.tar.gz -C ./SOURCES/ rh-devsuite/
rpmbuild -ba SPECS/rh-devsuite.spec --define "_topdir $(pwd)/rpmbuild"
pushd $(pwd)/rpmbuild/RPMS/x86_64/
sha256sum rh-devsuite-2.2.0-1.el7.x86_64.rpm > rh-devsuite-2.2.0-1.el7.x86_64.rpm.sha256
sha256sum rh-devsuite-debuginfo-2.2.0-1.el7.x86_64.rpm > rh-devsuite-debuginfo-2.2.0-1.el7.x86_64.rpm.sha256
popd
pushd $(pwd)/rpmbuild/SRPMS/
sha256sum rh-devsuite-2.2.0-1.el7.src.rpm > rh-devsuite-2.2.0-1.el7.src.rpm.sha256
popd
