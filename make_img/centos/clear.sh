#!/bin/bash
if [[ $@ -ne 0 ]];then
	root=$1
else
	root="$(pwd)/centos6.8/"
fi
umount $root/proc
umount $root/sys
rm -rf $root
