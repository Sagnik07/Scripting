#!/bin/bash
if (( $# == 0 )); then
	echo "Error! Directory and file name expected."
	exit
elif (( $# == 1 )); then
	echo "Error! File name expected."
	exit
fi
cd $1
#echo $2
let c=0
if [ "$2" == "all" ]; then
	for files in *
	do
		if [ -d $files ]; then
			continue
		else
			n1=${files##*.}
			if [ -d $n1 ]; then
				mv $files $n1
			else	
				mkdir $n1
				mv $files $n1
			fi
		fi
	done
else
	for i in $@
	do
		((c=c+1))
		if (( $c == 1 )); then
			continue
		else
			s=`echo *.$i`
			if [ "$s" == "*.$i" ]; then
				echo "No file with extension $i exists"
			elif [ -d $i ]; then
				mv $s $i
			else	
				mkdir $i
				mv $s $i
			fi
		fi
	done
fi
