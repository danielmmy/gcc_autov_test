#!/bin/bash


#!/bin/bash

terms=("Wall clock time" "CPU clock = " "Task clock = " "Instructions = " "Cycles = " "Cache references = " "Cache misses = ")

terms_it=0
count=0
while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ $line == *${terms[$terms_it]}* ]];then
		result=`echo -n $line | cut -d= -f2 | cut -d" " -f 2`
		echo -n "$result;"
		if [ $terms_it -eq 6  ]; then
			terms_it=0
			echo 
		else
			terms_it=$((terms_it+1))
		fi

		if [ $count -eq 29 ];then
			break
		fi
	fi	
done < "$1"
