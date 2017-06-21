mkdir -p rh-devsuite-repo
cd rh-devsuite-repo
curl http://${DOWNLOAD_HOST}/devel/candidates/jboss/devstudio/devsuite-1.4.0.TP/rpms/signed/rh-devsuite-1.4.0-1.el7.x86_64.rpm -O
curl http://${DOWNLOAD_HOST}/devel/candidates/jboss/devstudio/devsuite-1.4.0.TP/rpms/signed/rh-devsuite-1.4.0-1.el7.x86_64.rpm.sha256 -O
sha256sum --check rh-devsuite-1.4.0-1.el7.x86_64.rpm.sha256 || exit 1

curl http://${DOWNLOAD_HOST}/devel/candidates/jboss/devstudio/devstudio-10.4.0.GA/rpms/signed/rh-eclipse46-devstudio-10.4-0.20170511.1856.el7.x86_64.rpm -O
echo "734c5b2be60adbfefe809ec61698dcc243ce8ae3f39d108b399fd50db810d766 rh-eclipse46-devstudio-10.4-0.20170511.1856.el7.x86_64.rpm" > rh-eclipse46-devstudio-10.4-0.20170511.1856.el7.x86_64.rpm.sha256
sha256sum --check rh-eclipse46-devstudio-10.4-0.20170511.1856.el7.x86_64.rpm.sha256 || exit 1

curl http://${DOWNLOAD_HOST}/rel-eng/Atomic/cdk/rpms/cdk-3.0.0-2/cdk-minishift-3.0.0-2.el7.x86_64.rpm -O
echo "ccaa98daced48b31916015d5be859b99abb5c66ef8c7ec62ae2feab03f2c4bbc cdk-minishift-3.0.0-2.el7.x86_64.rpm" > cdk-minishift-3.0.0-2.el7.x86_64.rpm.sha256
sha256sum --check cdk-minishift-3.0.0-2.el7.x86_64.rpm.sha256 || exit 1

curl http://${DOWNLOAD_HOST}/rel-eng/Atomic/cdk/rpms/cdk-3.0.0/signed/docker-machine-kvm-0.0.7-1.el7.x86_64.rpm -O
echo "63b3b02e11d9e4ac9d8c2ecab24653a3bf41e867a7a7cd165e202c070a1d2d58 docker-machine-kvm-0.0.7-1.el7.x86_64.rpm" > docker-machine-kvm-0.0.7-1.el7.x86_64.rpm.sha256
sha256sum --check docker-machine-kvm-0.0.7-1.el7.x86_64.rpm.sha256 || exit 1

createrepo .

cd ..
zip devsuite-1.4.0-TP-RHEL.zip INSTALL.md LICENSE
zip -r devsuite-1.4.0-TP-RHEL.zip rh-devsuite-repo
sha256sum devsuite-1.4.0-TP-RHEL.zip > devsuite-1.4.0-TP-RHEL.zip.sha256
