#!/bin/zsh

function setTerminalColors {
    osascript \
        -e "tell application \"Terminal\"" \
        -e "tell selected tab of front window" \
        -e "set normal text color to $1" \
        -e "set background color to $2" \
        -e "end tell" \
        -e "end tell"
}

for ARG in $*
do
  case "$ARG" in
    peterm@pxaa2acctool01)
      setTerminalColors "{65535,65535,0}" "{0,0,0}"
      ;;
    *)
      setTerminalColors "{65535,65535,65535}" "{0,0,0}"
      ;;
  esac
done

ssh $*

setTerminalColors "{0,0,0}" "{65535,65535,65535}"

# dalek industry murphy torte zellner
# 
# white
# zellner red comment
# dalek red comment brown tick 
# 
# black
# industry blue on black
# murphy green on black yellow interface
