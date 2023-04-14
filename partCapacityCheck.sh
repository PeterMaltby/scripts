#!/bin/bash
# partCapacityCheck.sh
# author: peterm
# created: 2023-01-05
#############################################################
source $S/PABLO.sh

dfOutput="${tmpDir}/dfOutput.txt"

pStart

df -ki > ${dfOutput}

while read -r line; do
	echo -e ${line}
	echo -e ${line} | xargs | cut -d' ' -f 5
done < ${dfOutput}

pEnd
