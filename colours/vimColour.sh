#!/bin/zsh
# peterm

schemeName=${1}

#0	black: '#202020' 00
#1	red: '#703a00'	08
#2	green: '#009900' 0B
#3	yellow: '#2eb82e' 0A
#4	blue: '#0066cc' 0D
#5	magenta: '#f06c00' 0E
#6	cyan: '#990099' 0C
#7	white: '#fcfcfc' 05
#8	black: '#504e49' 03
#9	red: '#e60000' 09
#10	green: '#b3ff66' 01
#11	yellow: '#66ffff' 02
#12	blue: '#00ace6' 04
#13	magenta: '#dbdb24' 06
#14	cyan: '#ff4dff' 0F
#15	white: '#cecdca' 07

sed 	-e "s/{{base00-hex}}/fcfcfc/g" \
	-e "s/{{base01-hex}}/00ace6/g" \
	-e "s/{{base02-hex}}/66ffff/g" \
	-e "s/{{base03-hex}}/ff4dff/g" \
	-e "s/{{base04-hex}}/504e49/g" \
	-e "s/{{base05-hex}}/202020/g" \
	-e "s/{{base06-hex}}/cecdca/g" \
	-e "s/{{base07-hex}}/dbdb25/g" \
	-e "s/{{base08-hex}}/990099/g" \
	-e "s/{{base09-hex}}/f06c00/g" \
	-e "s/{{base0A-hex}}/703a00/g" \
	-e "s/{{base0B-hex}}/cecdca/g" \
	-e "s/{{base0C-hex}}/e60000/g" \
	-e "s/{{base0D-hex}}/504e49/g" \
	-e "s/{{base0E-hex}}/e60000/g" \
	-e "s/{{base0F-hex}}/e60000/g" \
	-e "s/"00"/"04"/g" \
	-e "s/"01"/"15"/g" \
	-e "s/"02"/"14"/g" \
	-e "s/"03"/"03"/g" \
	-e "s/"04"/"04"/g" \
	-e "s/"05"/"05"/g" \
	-e "s/"06"/"06"/g" \
	-e "s/"07"/"00"/g" \
	-e "s/"08"/"08"/g" \
	-e "s/"09"/"12"/g" \
	-e "s/"10"/"12"/g" \
	-e "s/"11"/"11"/g" \
	-e "s/"12"/"07"/g" \
	-e "s/"13"/"07"/g" \
	-e "s/"14"/"00"/g" \
	-e "s/"15"/"07"/g" \
./template.vim > ${schemeName}
