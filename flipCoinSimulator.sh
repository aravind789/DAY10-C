#!/bin/bash -x
random=$(($RANDOM%2))
if [ $random -eq 1 ]
then
	echo "HEADS"
else
	echo "TAILS"
fi

