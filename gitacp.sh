#/bin/sh
echo $@

gitRepoDir="$@"
timestamp=$(date +%s)

cd ${gitRepoDir}

git status

git add *

git commit -m "update: ${timestamp}"

git push -f


