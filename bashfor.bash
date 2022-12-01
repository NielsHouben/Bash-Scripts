#!/bin/bash
arr=($(echo $PATH | sed "s/:/ /g"))
#echo $PATH | sed "s/:/ /g"
for path in "${arr[@]}"
do
	echo "$path"
done
