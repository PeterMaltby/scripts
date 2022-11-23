#!/bin/zsh


moveFrom=../moveFrom.tmp
ls -1A > ${moveFrom}
moveTo=`ls -1A | awk -F. '{print $1}' | awk -F_ '{print$2"_"$1".jpg"}'`

while read fileFrom
do
	moveTo=`echo ${fileFrom} | awk -F. '{print $1}' | awk -F_ '{print$2"_"$1".jpg"}'`

	echo "${fileFrom} renaming too ${moveTo}"
	mv ${fileFrom} ${moveTo}
done < ${moveFrom}

