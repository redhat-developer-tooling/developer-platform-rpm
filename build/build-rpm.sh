#!/bin/sh
rm -rf $(pwd)/rpmbuild/
mkdir -p $(pwd)/rpmbuild/SOURCES/
tar -cvzf $(pwd)/rpmbuild/SOURCES/rh-devsuite-src-2.1.0-1.tar.gz -C ./SOURCES/ rh-devsuite-2.1.0/
rpmbuild -ba SPECS/rh-devsuite.spec --define "_topdir $(pwd)/rpmbuild"
pushd $(pwd)/rpmbuild/RPMS/x86_64/
sha256sum *.rpm > SHA256SUMS
popd
pushd $(pwd)/rpmbuild/SRPMS/
sha256sum *.rpm > SHA256SUMS
popd
