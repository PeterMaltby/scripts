#!/bin/sh
# PABLO.sh
# created: 2022-10-08
############################################################
############################################################

# PABLO vars
dateStamp=`date "+%Y%m%d"`
timeStamp=`date "+%H%M"`

scriptNameFull=${0##*/}
scriptName=`echo ${0##*/} | cut -d. -f1`

PABLODir=~/PABLO
baseDir="${PABLODir}/${scriptName}"
logsDir="${baseDir}/logs"
runFlagsDir="${baseDir}/flags"
tmpDir="${baseDir}/tmp"

masterLog="${PABLODir}/PABLO_MASTER_${dateStamp}.log"

logRetention=30

mkdir -p ${logsDir}
mkdir -p ${runFlagsDir}
mkdir -p ${tmpDir}

pStart () {

	logFile="${logsDir}/${scriptName}_${dateStamp}.log"
	runFlagFile="${runFlagsDir}/${scriptName}.txt"

	checkRegex="^[0-9a-zA-Z_]*\.sh$"

	if [[ ! ${scriptNameFull} =~ ${checkRegex} ]]; then
		pError "START failed: name invalid \"${scriptNameFull}\}"
		exit 1
	fi

	if test -e ${runFlagFile}; then
		PID=`cat ${runFlagFile}`
		pError "START failed: already running with PID \"${PID}\""
		exit 1
	fi

	find ${logsDir} -type f -mtime +${logRetention} -exec rm -f {} \;

	touch ${runFlagFile}
	echo $$ > ${runFlagFile}

	startTimeStamp=`date +%s`

	pLog "STARTED with PID \"$$\""
}

pLog () {
	dateTime=`date "+%Y%m%d %H%M%S"`

	echo "${dateTime} [${timeStamp} ${scriptName}] ${1}" >> ${logFile}
}

pMasterLog () {
	dateTime=`date "+%Y%m%d %H%M%S"`

	echo "${dateTime} [${timeStamp} ${scriptName}] ${1}" >> ${masterLog}
	pLog "(MASTER) ${1}"
}

pError () {
	pMasterLog "ERROR ${1}"
}

pEnd () {
	rm -f ${runFlagFile}
	rmRet=$?

	if [ $rmRet != 0 ]; then
		pError "PABLO failed to remove running flag, rm returned \"$rmRet\""
		exit 1
	fi

	finishTimeStamp=`date +%s`
	totalExecTime=`expr $finishTimeStamp - $startTimeStamp`
	
	pLog "COMPLETED SUCCESSFULLY in ${totalExecTime} secs"
}
