#!/bin/sh
rm -rf $(pwd)/rpmbuild/
mkdir -p $(pwd)/rpmbuild/SOURCES/
tar -cvzf $(pwd)/rpmbuild/SOURCES/rh-devsuite-src-2.1.0-1.tar.gz -C ./SOURCES/ rh-devsuite-2.1.0/
rpmbuild -ba SPECS/rh-devsuite.spec --define "_topdir $(pwd)/rpmbuild"
sha256sum $(pwd)/rpmbuild/RPMS/x86_64/*.rpm > $(pwd)/rpmbuild/RPMS/x86_64/SHA256SUMS
sha256sum $(pwd)/rpmbuild/SRPMS/*.rpm > $(pwd)/rpmbuild/SRPMS/SHA256SUMS
