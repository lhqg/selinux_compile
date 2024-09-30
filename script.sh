#!/bin/bash

unset ID

. /etc/os-release 

case  "${ID}" in
	"debian"|"ubuntu")
		apt-get update -yqq
		apt-get -y install selinux-basics selinux-policy-dev policycoreutils make
	;;
	"fedora"|"rhel"|"almalinux"|"centos"|"rockylinux")
		dnf install -y selinux-policy-devel make
		dnf upgrade -y libsepol
	;;
	*)
		echo "FATAL: distribution ${DISTRO} is not supported."
	;;
esac

# Compile the SELinux code
if [ -d /source/se_module ]
then
	cd /source/se_module
	make -f /usr/share/selinux/devel/Makefile
else
	echo "FATAL: cannot enter /source/se_module directory."
	exit 1
fi