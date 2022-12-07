#!/bin/bash
# PABLO.sh
# created: 2022-10-08
############################################################
############################################################

dateStamp=`date "+%Y%m%d"`
timeStamp=`date "+%H%M"`

hostName=`hostname`

scriptNameFull=${0##*/}
scriptName=`echo ${0##*/} | cut -d. -f1`

# PABLO Dir todo: move this somewhere more suitable withen unix.
# PABLO Dir todo: set perms of dir to a PABLO group
PABLODir=~/PABLO
# Shared Directory where files can be transfered to other PABLO enabled systems and where master logs are shared
shareDir=~"${PABLODir}/share/"
# script specific directory
baseDir="${PABLODir}/${scriptName}"
# directory to store logs
logsDir="${baseDir}/logs"
# run flags are used to stop the same script starting twice
runFlagsDir="${baseDir}/flags"
# temp dir will be removed at the end of each run
tmpDir="${baseDir}/tmp"

# master log file stores logs for all scripts and are shared across machines
masterLogDir="${shareDir}/MASTER_LOGS"
masterLog="${masterLogDir}/${hostName}_${dateStamp}.log"

# how many days to retain logs (can be overwritten)
logRetention=30

# ensures dirs are created
mkdir -p ${logsDir}
mkdir -p ${runFlagsDir}
mkdir -p ${tmpDir}
mkdir -p ${shareDir}
mkdir -p ${masterLogDir}

# used at start of script to initiate PABLO script run
pStart () {
	logFile="${logsDir}/${scriptName}_${dateStamp}.log"
	runFlagFile="${runFlagsDir}/${scriptName}.txt"

	# regex to check valid script name
	checkRegex="^[0-9a-zA-Z_]*\.sh$"

	# if script name is invalid fail
	if [[ ! ${scriptNameFull} =~ ${checkRegex} ]]; then
		pError "START failed: name invalid \"${scriptNameFull}\}"
		exit 1
	fi

	if test -e ${runFlagFile}; then
		PID=`cat ${runFlagFile}`
		pError "START failed: already running with PID \"${PID}\""
		exit 1
	fi

	# delete retained logs
	find ${logsDir} -type f -mtime +${logRetention} -exec rm -f {} \;

	touch ${runFlagFile}
	echo $$ > ${runFlagFile}

	startTimeStamp=`date +%s`

	pMasterLog "START success: with PID \"$$\""

}

# create log on script log only
pLog () {
	dateTime=`date "+%Y%m%d %H%M%S"`

	echo "${dateTime} [${timeStamp} ${scriptName}] ${1}" >> ${logFile}
}

# will create log on script and master log
pMasterLog () {
	dateTime=`date "+%Y%m%d %H%M%S"`

	echo "${dateTime} [${timeStamp} ${scriptName}] ${1}" >> ${masterLog}
	pLog "(M) ${1}"
}

# will create error log on script and master log
pError () {
	pMasterLog "ERROR ${1}"
}

pEnd () {
	# Remove temp files
	rm -f ${tmpDir}/*
	rmRet=$?
	if [ $rmRet != 0 ]; then
		pError "END failed: removing tmp files, rm returned \"$rmRet\""
		exit 1
	fi

	# Remove run flag
	rm -f ${runFlagFile}
	rmRet=$?
	if [ $rmRet != 0 ]; then
		pError "END failed: removing running flag, rm returned \"$rmRet\""
		exit 1
	fi
	
	finishTimeStamp=`date +%s`
	totalExecTime=`expr $finishTimeStamp - $startTimeStamp`
	
	pLog "COMPLETED SUCCESSFULLY in ${totalExecTime} secs"

	exit 0
}
