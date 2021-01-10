#!/bin/bash

wordString=$1

if [[ "$#" < 1 || "$#" > 1 ]];
then
	echo "error: wrong number of arguments for pigLatin.sh (needs exactly one)" >| errorMessage.txt
	cat errorMessage.txt
	exit 1
fi

if [[ ${wordString:0:1} != [aeiou] ]];
then
	k=0
	for (( i=0; i<${#wordString}; i++));
	do
		if [[ ${wordString:$i:1} == [aeiou] ]];
		then
			break
		else
			k=$((k+1))
		fi
	done

	ay="ay"
	firsthalf=${wordString:$k}
	secondhalf=${wordString:0:$k}
	piglatin="$firsthalf$secondhalf$ay"
	echo $piglatin
else
	piglatin=$wordString\way
	echo $piglatin
fi
exit 0
