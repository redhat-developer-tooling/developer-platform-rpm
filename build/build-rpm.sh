#!/bin/sh
rm -rf $(pwd)/rpmbuild/
mkdir -p $(pwd)/rpmbuild/SOURCES/
tar -cvzf $(pwd)/rpmbuild/SOURCES/rh-devsuite-src.tar.gz -C ./SOURCES/ rh-devsuite/
rpmbuild -ba SPECS/rh-devsuite.spec --define "_topdir $(pwd)/rpmbuild"
