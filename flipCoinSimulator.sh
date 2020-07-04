#!/bin/bash -x

declare -A singlet
singlet[head]=" "
singlet[tails]=" "
total_heads=0
total_tails=0
count=0

declare -A doublet
doublet[first_combination]=" "
doublet[second_combination]=" "
doublet[third_combination]=" "
doublet[fourth_combination]=" "
doublet[percent_combo1]=0
doublet[percent_combo2]=0
doublet[percent_combo3]=0
doublet[percent_combo4]=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0


read -p "Enter how many times you want flip the coin  " num
while [ $count -lt $num ]
do
	flip1=$(($RANDOM%2))
	flip2=$(($RANDOM%2))
if [ $flip1 -eq 1 ]
then
	singlet[head]=H
	((total_heads++))
	if [ $flip2 -eq 1 ]

	then
		((total_first_comb++))
		doublet[first_combination]="HH"
	else
		((total_second_comb++))
		doublet[second_combination]="HT"
	fi
else
		singlet[tails]=T
		((total_tails++))
		if [ $flip2 -eq 1 ]
		then
			  ((total_third_comb++))
			   doublet[third_combination]="TH"
		else
			((total_fourth_comb++))
			doublet[fourth_combination]="TT"
		fi
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

echo "Doublet Combination" ${double[first_combination]} ${double[second_combination]} ${double[third_combination]} ${double[fourth_combination]}
doublet[percent_combo1]=$(echo $total_first_comb $num | awk '{print $1/$2*100}')
echo "Percentage of HH Combination ="${doublet[percent_combo1]}

doublet[percent_combo2]=$(echo $total_second_comb $num | awk '{print $1/$2*100}')
echo "Percentage of HT Combination ="${doublet[percent_combo2]}

doublet[percent_combo3]=$(echo $total_third_comb $num | awk '{print $1/$2*100}')
echo "Percentage of TH Combination ="${doublet[percent_combo3]}

doublet[percent_combo4]=$(echo $total_fourth_comb $num | awk '{print $1/$2*100}')
echo "Percentage of TT Combination ="${doublet[percent_combo4]}
