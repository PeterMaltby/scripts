# .zshrc
# created: 2022-10-08
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

export EDITOR=vim
export HISTCONTROL=ignoreboth

# alias scripts
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -lrtA'

# ZSH config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
bindkey -v

# not sure what this does
# zstyle :compinstall filename '/home/peterm/.zshrc'

# autoload -Uz compinit
# compinit
# autoload -Uz promptinit


PROMPT='%n@%F{27}%M%f %~ %# '
#RPROMPT='[%F{13}%?%f]'
PS1='%n@%m %/ $ '


neofetch

# sort this bit
ssh() {
  $S/colorssh.sh $*
}

weather() { curl wttr.in }

