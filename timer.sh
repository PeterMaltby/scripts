#!/bin/bash

source $S/PABLO.sh

pStart

pLog "starting timer"
pMasterLog "master start"

for ((i = 0; i <= 10 ; i++))
do
	echo -n $'\r' "[${i}]"
 	sleep 1
done

pLog "timer done!"

pEnd
