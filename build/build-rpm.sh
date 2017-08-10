#!/bin/sh
rm -rf $(pwd)/build/SOURCES
mkdir -p $(pwd)/build/SOURCES/
tar -cvzf $(pwd)/build/SOURCES/rh-devsuite-src-2.0.0-1.tar.gz -C ./SOURCES/ rh-devsuite-2.0.0/
rpmbuild -bb SPECS/rh-devsuite.spec --define "_rpmdir $(pwd)/build"
