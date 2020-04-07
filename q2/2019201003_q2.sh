#!/bin/bash
if (( $# == 0 )); then
	echo "Error! File name expected."
	exit
fi
n1=$1
n2=${n1##*.}
if [ -f $n1 ]; then
	if [ "$n2" == "txt" -o "$n2" == "c" -o "$n2" == "cpp" -o "$n2" == "py" -o "$n2" == "java" -o "$n2" == "sh" -o "$n2" == "bat" -o "$n2" == "odt" ]; then
		vi $n1	
	elif [ "$n2" == "mp3" -o "$n2" == "wav" -o "$n2" == "mp4" -o "$n2" == "flv" ]; then
		vlc $n1
	elif [ "$n2" == "jpg" -o "$n2" == "png" -o "$n2" == "bmp" ]; then
		eog $n1
	elif [ "$n2" == "html" ]; then
		firefox $n1
	elif [ "$n2" == "doc" -o "$n2" == "docx" -o "$n2" == "pptx" -o "$n2" == "xlx" -o "$n2" == "xlsx" ]; then
		libreoffice $n1
	elif [ "$n2" == "pdf" ]; then
		evince $n1
	else
		echo "File format not supported"
	fi
else
	if [ -d $n1 ]; then
		echo "Provide file name, not directory name!"
	else
		echo "File not found"
	fi
fi
