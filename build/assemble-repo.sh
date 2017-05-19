mkdir -p rh-devsuite-repo
cd rh-devsuite-repo
curl http://${DOWNLOAD_HOST}/devel/candidates/jboss/devstudio/devsuite-1.4.0.TP/rpms/signed/rh-devsuite-1.4.0-1.el7.x86_64.rpm -O
curl http://${DOWNLOAD_HOST}/devel/candidates/jboss/devstudio/devstudio-10.4.0.GA/rpms/signed/rh-eclipse46-devstudio-10.4-0.20170511.1856.el7.x86_64.rpm -O
curl http://${DOWNLOAD_HOST_CDK}/builds/RPMs/cdk-3.0.0/cdk-minishift-3.0.0-1.el7.x86_64.rpm -O
curl http://${DOWNLOAD_HOST_CDK}/builds/RPMs/cdk-3.0.0/docker-machine-kvm-0.0.7-1.el7.x86_64.rpm -O
createrepo .
cd ..
zip devsuite-1.4.0-TP-RHEL.zip INSTALL.md LICENSE
zip -r devsuite-1.4.0-TP-RHEL.zip rh-devsuite-repo
sha256sum devsuite-1.4.0-TP-RHEL.zip > devsuite-1.4.0-TP-RHEL.zip.sha256
