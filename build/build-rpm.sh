#!/bin/sh
rm -f ~/rpmbuild/SOURCES/rh-devsuite-src-2.0.0-1.tar.gz
tar -cvzf ~/rpmbuild/SOURCES/rh-devsuite-src-2.0.0-1.tar.gz -C ./SOURCES/ rh-devsuite-2.0.0/
rpmbuild -bb SPECS/rh-devsuite.spec
