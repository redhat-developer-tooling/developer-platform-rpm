home="/home/$USER/.minishift"
if [ -z ${MINISHIFT_HOME+x} ]
then
  echo "MINISHIFT_HOME is $home";
else
  echo "MINISHIFT_HOME is set to '$MINISHIFT_HOME'"
  home="${MINISHIFT_HOME}"
fi
minishift setup-cdk --force --default-vm-driver="kvm"
#search for OpenShift CLI
file=$(find $home -name "oc" -type "f")

#add soft link to directory in PATH
rm -f ~/.local/bin/oc
mkdir -p ~/.local/bin
ln -s $file ~/.local/bin/oc
