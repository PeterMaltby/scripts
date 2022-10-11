#/bin/sh

source $S/PABLO.sh 

scriptName="overide"

pStart
echo $@

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
