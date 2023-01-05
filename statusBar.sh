#!/bin/bash
# statusBar.sh
# author: peterm
# created: 2023-01-05
#############################################################
source $S/PABLO.sh
overunProtection=false

pStart
while true; do
	xsetroot -name "`date \"+%Y-%m-%d %T\"`"
	sleep 1s
done

# should never run as x server will close down
pEnd
