#!/bin/bash

source $S/PABLO.sh

overunProtection=false

pStart

pLog "starting timer"

for ((i = 0; i <= 10 ; i++))
do
	echo -n $'\r' "[${i}]"
 	sleep 1
done

pLog "timer done!"

pEnd
