#!/bin/bash -x

#Welcome to Gambling Simulator

#CONSTANTS
STAKE=100
BET=1
ISWIN=1

#FOR LOOP FOR CHECKING FOR A MONTH
for (( index=1; index<=20; index++ ))
do
#VARIABLE
	cash=$STAKE
	minimum=$(($STAKE-$STAKE/2))
	maximum=$(($STAKE+$STAKE/2))
	while (( $cash != $minimum && $cash != $maximum ))
	do
#RANDOM CHECK FOR WIN OR LOSS
		randomCheck=$((RANDOM%2))
		if [ $randomCheck -eq $ISWIN ]
		then
			echo win
			((cash++))
		else
			echo losse
			((cash--))
		fi
	done
	totalAmount[index]=$cash
done
echo "Total Amount won or loss :: "${totalAmount[@]}
