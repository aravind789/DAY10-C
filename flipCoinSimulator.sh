#!/bin/bash -x

declare -A singlet
singlet[head]=" "
singlet[tails]=" "
total_heads=0
total_tails=0
count=0
read -p "Enter how many times you want flip the coin  " num
while [ $count -lt $num ]
do
	flip=$(($RANDOM%2))
	if [ $flip -eq 1 ]
	then
		echo "HEADS"
		singlet[head]=H
		((total_heads++))
	else
		singlet[tails]=T
		echo "TAILS"
		((total_tails++))
	fi
		((count++))
done
echo "Singlet Combination" ${singlet[head]} ${singlet[tails]}
echo "Total heads are $total_heads"
echo "Total tails are $total_tails"
precentage_head=$(echo $total_heads $num | awk '{print $1/$2*100}')
echo $percentage_head
percentage_tails=$(echo $total_tails $num | awk '{print $1/$2*100}')
echo $percentage_tails
