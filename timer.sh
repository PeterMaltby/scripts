#!/bin/zsh

echo "starting timer..."

for ((i = 0; i <= 60 ; i++))
do
	echo -n $'\r' "[${i}]"
 	sleep 1
done
echo "\ntimer complete!"
