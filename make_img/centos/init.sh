#!/bin/bash
if [[ $@ -ne 0 ]];then
	root=$1
else
	root="$(pwd)/centos6.8/"
fi
mkdir -p $root
cp rpmpackages/RPM-GPG-KEY-CentOS-6 $root/
rpm --import --root $root $root/RPM-GPG-KEY-CentOS-6
mkdir -p $root/var/lib/rpm
rpm --root $root --initdb
rpm -ivh --force-debian --root $root rpmpackages/*rpm
cp rpmpackages/CentOS6-Base-163.repo $root/etc/yum.repos.d/
cp /etc/resolv.conf $root/etc/
yum --installroot $root install yum
mkdir -p $root/proc
mkdir -p $root/sys
mount -t proc foo $root/proc
mount -t sysfs foo $root/sys
chroot $root /bin/bash --login
cd /var/lib/rpm
ls
