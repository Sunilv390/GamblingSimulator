#!/bin/bash -x

#Welcome to Gambling Simulator

#CONSTANTS
STAKE=100
BET=1
ISWIN=1

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
