#!/bin/bash
a=$1
if [ -f $a ]; then
	if [ `echo $a | grep -E "\.tar$"` ]; then
		tar xf $a
	elif [ `echo $a | grep -E "\.tar\.gz$"` ]; then
		tar xvzf $a
	elif [ `echo $a | grep -E "\.tar\.bz2$"` ]; then
		tar xvjf $a
	elif [ `echo $a | grep -E "\.bz2$"` ]; then
		bzip2 -d $a
	elif [ `echo $a | grep -E "\.zip$"` ]; then
		unzip $a
	else
		echo "Cannot compress"
	fi
else
	if [ -d $a ]; then
		echo "Provide file name, not directory name!"
	else
		echo "File not found"
	fi
fi
