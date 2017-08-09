minishift setup-cdk --force --default-vm-driver="kvm"
home="/home/$USER/.minishift"
if [ -z ${MINISHIFT_HOME+x} ]
then
  echo "MINISHIFT_HOME is not set";
else
  echo "MINISHIFT_HOME is set to '$MINISHIFT_HOME'"
  home="${MINISHIFT_HOME}"
fi

file=$(find $home -name "oc" -type "f")

sudo rm -f /usr/bin/oc
sudo ln -s $file /usr/bin/oc
