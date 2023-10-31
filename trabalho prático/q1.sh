#!/bin/bash
for ((i=$1;i>=0;i--))
do
	let prod=i
	echo -n "$prod " 
done
