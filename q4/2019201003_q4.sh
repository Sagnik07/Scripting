#!/bin/bash
while [ 1 == 1 ]
do
	echo -n "Enter password: "
	read -s passw
	echo
	if (( ${#passw} < 8 )); then
		echo "Weak Password! Try again.. "
		echo "Hint: Password should contain atleast 8 characters including one digit and one non alphabetic character"
	elif (( `echo $passw | grep -c "[[:digit:]]"` == 0 )); then
		echo "Weak Password! Try again.. "
		echo "Hint: Password should contain atleast 8 characters including one digit and one non alphabetic character"
	elif (( `echo $passw | grep -c -E "[@#$%&*=+-]+"` == 0 )); then
		echo "Weak Password! Try again.. "
		echo "Hint: Password should contain atleast 8 characters including one digit and one non alphabetic character"
	elif (( ${#passw} >= 4 )); then
		let n=${#passw}-4
		for i in `seq 0 $n`
		do
			let flag=0
			for j in `seq 4 ${#passw}`
			do
				a=${passw:i:j}
				if (( `grep -c -E "$a" /usr/share/dict/cracklib-small` > 0 )); then
					echo "Weak Password dict match! Try again.. "
					echo "Hint: Password should contain atleast 8 characters including one digit and one non alphabetic character"
					((flag=1))
					break
				fi
			done
			if (( $flag == 1 )); then
				break
			fi
		done
		if (( $flag == 0 )); then
			echo "Password Set"
			exit
		fi
	else
		echo "Password Set"
		exit
	fi
done
