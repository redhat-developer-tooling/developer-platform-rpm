``` shell
rpmbuild -bb SPECS/*.spec

mkdir ~/devsuite-repo

cp ~/rpmbuild/RPMS/*.rpm ~/devsuite-repo

createrepo ~/devsuite-repo

sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms

sudo cat > /etc/yum.repos.d/rh-eclipse46-devstudio.repo <<END \
[rh-eclipse46-devstudio-stable-10.x]
name=rh-eclipse46-devstudio-stable-10.x
baseurl=https://devstudio.redhat.com/static/10.0/stable/rpms/x86_64/
enabled=1
gpgcheck=1
upgrade_requirements_on_install=1
metadata_expire=24h
END


sudo cat > /etc/yum.repos.d/devsuite.repo <<END \
[devsuite]
name=DevSuiteRepository
baseurl=file:///home/eskimo/devsuite-repo
END

sudo yum --nogpgcheck install devsuite
```

[1] https://access.redhat.com/sites/default/files/attachments/rpm_building_practice_10082013.pdf
[2] http://tools.jboss.org/blog/10.2.0.rpm-installation.html
