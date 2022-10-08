# .zshrc
# created: 08-10-2022
###################################################################
#	 ______  _____  _    _  _____    _____ 
#	|___  / / ____|| |  | ||  __ \  / ____|
#	   / / | (___  | |__| || |__) || |     
#	  / /   \___ \ |  __  ||  _  / | |     
#	 / /__  ____) || |  | || | \ \ | |____ 
#	/_____||_____/ |_|  |_||_|  \_\ \_____|
###################################################################
# Update git repo for this file!
###################################################################

# Environment vars
export S=~/scripts
export D=~/Downloads
export DT=~/Desktop
export G=~/gitrepo
export L=~/logs

export EDITOR=vim
export HISTCONTROL=ignoreboth

# alias scripts
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -lrt'

wttr() { curl wttr.in/Lincoln,+United+Kingdom }

# ZSH config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
bindkey -v

# not sure what this does
# zstyle :compinstall filename '/home/peterm/.zshrc'

# autocomplete
autoload -Uz compinit
compinit
# autocomplete hidden files
_comp_options+=(globdots)

host=`hostname`
case $host in
'homeArch')
	PS1='%B%n%b@%F{12}%m%f %~ %(!.#.$) '
	neofetch
	;;
*)
	PS1='%B%n%b@%F{124}%m%f %~ %(!.#.$) '
	echo "unrecognised host: $host"
	;;
esac

# sort this bit
ssh() {
  $S/colorssh.sh $*
}
