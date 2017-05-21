# Red Hat Development Suite for Red Hat Enterprise Linux 7

## Table of Contents

- [About](#about)
- [Install](#install)
- [Start](#start)
- [Uninstall](#uninstall)
- [License](#license)

## About

The best of Red Hat development tools, integrated together, in one easy to
install bundle.
Red Hat Development Suite combines Red Hat development tools such as Red Hat
JBoss Developer Studio, Red Hat Container Development Kit, and OpenJDK into a
single, integrated developer experience. Combining these powerful tools into a
single integrated development environment results in Red Hat Development Suite
— one of the most effective, powerful, and efficient development environments
for all kinds of developers.

### Packages

Red Hat Development Suite Repository includes following packages:
- rh-devsuite - all tools integrated together
- rh-eclipse46-devstudio - Red Hat JBoss Developer Studio 10.4.0.GA
- cdk-minishift - Red Hat Container Development Kit 3.0.GA
- docker-machine-kvm - Red Hat Container Development Kit minishift kvm driver

### Prerequisites

Red Hat Development Suite relies on Red Hat Software Collections.
You don’t need to install Red Hat Software Collections but you need to enable
the Red Hat Software Collections repositories before you start the installation
of the Red Hat Development Suite.

The identifier for the repository is rhel-server-rhscl-7-rpms on Red Hat
Enterprise Linux Server and rhel-workstation-rhscl-7-rpms on Red Hat Enterprise
Linux Workstation.

The command to enable the repository on Red Hat Enterprise Linux Server is:

```sh
sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms
```

The command to enable the repository on Red Hat Enterprise Linux Workstation is:

```sh
sudo subscription-manager repos --enable rhel-workstation-rhscl-7-rpms
```

For more information, please refer to the [Red Hat Software Collections](https://access.redhat.com/documentation/en/red-hat-software-collections/?version=2/) documentation.

## Install

### Configure local yum repository

As this is a technical preview, you need to manually configure the Red Hat
Development Suite repository.

Locate `rh-devsuite-repo` in your desired directory (e.g. /opt/rh-devsuite-repo)
and then create a file /etc/yum.repos.d/rh-devsuite.repo with the following
command:

```sh
sudo tee -a /etc/yum.repos.d/rh-devsuite.repo <<'END'
[rh-devsuite]
name=Red Hat Development Suite RPMs
baseurl=file:///opt/rh-devsuite-repo/
gpgkey=https://www.redhat.com/security/data/a5787476.txt
enabled=1
gpgcheck=1
END
```

You are now ready to install Red Hat Development Suite. You can install all
tools from Development Suite with simple command

```sh
sudo yum install rh-devsuite
```

yum will ask you to import public GPG key when it is ready start installation.

```sh
Retrieving key from https://www.redhat.com/security/data/a5787476.txt
Importing GPG key 0xA5787476:
 Userid     : "Red Hat, Inc. (development key) <security@redhat.com>"
 Fingerprint: 2d6d 2858 5549 e02f 2194 3840 08b8 71e6 a578 7476
 From       : https://www.redhat.com/security/data/a5787476.txt
Is this ok [y/N]:
```

Answer 'y' to this request to import the key.

You can also chose to install only specific packages that suites your needs
from [list above](#packages).

### Configure Container Development Kit

For this technical preview you need manually add installed tools to '/usr/bin'
to make them available by default in your favorite shell.

```sh
sudo ln -s /var/lib/cdk-minishift-3.0.0/minishift /usr/bin/minishift
```

`minishift` executable  embeds RHEL7 virtual machine and OpenShift CLI client.
To prepare Container Development Kit to run in your environment execute

```sh
minishift setup-cdk --force --default-vm-driver="kvm"
```

This command will populate `~/.minishift` directory with requires resources.
It also installs OpenShift CLI tool to '~/.minishift/cache/oc/v3.5.5.8/oc'.
You need to run command below so Developer Studio Container Development Kit
tools can find it.

```sh
sudo ln -s /home/$(whoami)/.minishift/cache/oc/v3.5.5.8/oc /usr/bin/oc
```

You don't have to add yourself to any group, but please expect many requests
for root's password. If you get annoyed by entering password 20 times to 
start minishift and 10 times to stop it then just add yourself to `libvirt`
group with command below.

```sh
sudo usermod -a -G libvirt $(whoami)
```

## Start

To start Developer Studio use `Applications->Programming->Red Hat Eclipse 4.6`
launcher.

## Uninstall

To uninstall Red Hat Development Suite and all its dependencies run

``` sh
sudo yum autoremove rh-devsuite
```

If you installed individual packages just replace rh-devsuite in snippet above
with individual package(s) you have installed.

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
