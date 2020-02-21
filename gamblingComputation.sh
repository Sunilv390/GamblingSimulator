#!/bin/bash -x

#Welcome to Gambling Simulator

#CONSTANTS
STAKE=100
BET=1
ISWIN=1
cash2=$STAKE

function gambler(){
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
			((cash++))
		else
			((cash--))
		fi
			dayWonLoss=$(($cash-$STAKE))
	done
	totalAmount[index]=$cash
	dayWonLoss[index]=$dayWonLoss
	WonandLossAmount=$(($WonandLossAmount+$dayWonLoss))
   totalWonLossAmount[index]=$WonandLossAmount
done
echo "Total Amount won or loss :: "${totalAmount[@]}
echo "Days won and Loss by :: "${dayWonLoss[@]}
echo "Total won and Loss amount :: "${totalWonLossAmount[@]}

#SHOWING LUCKIEST AND UNLUCKIEST DAY
for k in ${!totalWonLossAmount[@]}
do
   echo $k 'thdayisLuckiest' ${totalWonLossAmount[$k]}
done | sort -rn -k3 | head -1

for k in ${!totalWonLossAmount[@]}
do
   echo $k 'thdayisUnlucky' ${totalWonLossAmount[$k]}
done | sort -rn -k3 | tail -1

#CHECKING TO PLAY AGAIN
if [ $WonandLossAmount -ge $cash2 ]
then
	 gambler
else
	echo "SORRY U HAVE TO STOP GAMBLING :("
fi
}
gambler

