#!/bin/bash
if [[ $@ -ne 0 ]];then
        root=$1
else
        root="$(pwd)/centos6.8/"
fi
for file in $(ls rpmpackages/*rpm)
do
	f=$(basename $file)
	mv -vf rpmpackages/$f ./
	rpm -ivh --force-debian --root $root rpmpackages/*rpm
	if [[ $? -ne 0 ]];then
		mv $f rpmpackages/
	fi
done
