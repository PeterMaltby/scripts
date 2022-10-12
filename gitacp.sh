#/bin/sh

source $S/PABLO.sh 

pwdvar=${1}

scriptName="${scriptName}:wiki"

gitDirName=`echo ${scriptName} | cut -d/ -f-1`

pStart
pLog "$@"
pLog "input var = ${1}"

cd ${gitRepoDir}

pwdvar=`pwd`
pLog "moved to dir: ${pwdvar}"

pError "oh no a error"

git pull

git status

git add *

git commit -m "update"

git push -f

pEnd
