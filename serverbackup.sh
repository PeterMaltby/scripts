#!/bin/sh
# serverBackup.sh
# created: 2022-10-12
############################################################
############################################################

source $S/PABLO.sh

tmp=${tmpDir}/tmp.tmp
fileList=${tmpDir}/fileList.txt
encryptCacheDir=${tmpDir}/sync/encCache
lastRunFiles=${tmpDir}/lastFileList.txt
delList=${tmpDir}/sync/del.txt

folderName=`echo $1 | awk -F/ '{print $NF}'`
scriptName="${scriptName}:$folderName"

#change this in future
encPass="fnjdhfjsdhjfdsgbfd"

pStart

mkdir -p ${encryptCacheDir}

pwdOutput=${1}

cd ${pwdOutput}

pLog "pwd output: \"${pwdOutput}\""

pLog "Syncing local encrypted cache"

# find this comment

#this is a comment
find . -type f -not -path '*/.*' > ${fileList}

if [ -f ${lastRunFiles} ]; then

	diff ${lastRunFiles} ${fileList} | grep '<' | cut -d' ' -f2 > ${tmp}

	cat ${tmp}

	while read fileToDel
	do
		echo "${fileToDel}" | openssl aes-256-cbc -pbkdf2 -salt -a -pass pass:${encPass} | sed 's|/|_|g' >> ${delList}
	done < ${tmp}

	echo "del List"
	cat ${delList}
	
fi

cp ${fileList} ${lastRunFiles}


pEnd



while read fileToBackup
do
	echo ${fileToBackup}
	tempHash=`echo ${fileToBackup} | openssl aes-256-cbc -pbkdf2 -salt -a -pass pass:${tempPassword}`
	tempHash=`echo "${tempHash}" | sed 's|/|_|g'`

	echo "tempHash ${tempHash}.aes"

	cp -p ${fileToBackup} ${encryptCache}/${tempHash}.aes
	echo "cp -p ${fileToBackup} ${encryptCache}/${tempHash}.aes"




done < ${fileList}


pLog "checking server availible : WIP"



cd ${1}

pEnd
