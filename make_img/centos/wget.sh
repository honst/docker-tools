#!/bin/bash
for p in $@
do
	wget http://mirrors.163.com/centos/6.8/os/x86_64/Packages/$p
done
