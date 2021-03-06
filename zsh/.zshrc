HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/tyler/.zshrc'
autoload -Uz compinit
compinit
autoload -U compinit
compinit

setopt NO_BEEP
setopt NO_LIST_BEEP
set bell-style none

#Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


####################### Aliases #######################
alias ll='ls -lh'
alias la='ls -lha'
alias al='la'
alias vvc='vim ~/.vimrc'
alias vrc='vim ~/.zshrc'
alias top='htop'
alias ifconfig='ip addr'
alias listi='yay -Qqet'
alias update='sudo pacman -Syu --noconfirm;yay -Syua --noconfirm'
alias clean='yay -Rsn $(yay -Qtdq); rm -f ~/.xsession-errors;rm -f ~/.xsession-errors.old'
alias upcl='update;clean'
alias untar='tar -xvf'
alias pingg="webstat google.com"
alias rickroll='nc rya.nc 1987'
alias vi='vim'
alias inst="yay -S --noconfirm"
alias fetch='neofetch'
alias upyolo='yay -Syyuua --devel --noconfirm'
alias ctop='nocorrect ctop'
alias cla="clear;la"

# Spark
 export PATH="$PATH:/opt/apache-spark/bin"

# Remove all docker containers running and exited
alias docker-rma='__drma() { docker ps -aq "$@" | xargs -r docker rm -f; }; __drma'
# Remove all docker images
alias docker-rmia='__drmia() { docker images -q "$@" | xargs -r docker rmi -f; }; __drmia'
# Remove all custom docker networks
alias docker-rmnet='__drmnet() { docker network ls -q -f type=custom "$@" | xargs -r docker network rm; }; __drmnet'
# Remove all unused volumes
alias docker-rmvol='__drmvol() { docker volume ls -q "$@" | xargs -r docker volume rm; }; __drmvol'
# Remove all docker containers and all docker images
alias docker-rmall='docker-rma && docker-rmia'
# Remove all docker containers, images, custom networks, and volumes
alias docker-nuke='docker-rmall; docker-rmnet; docker-rmvol'
# Remove only exited containers, unused images, unused networks, and unused volumes
alias docker-clean='docker-rma -f status=exited; docker-rmia -f dangling=true; docker-rmnet; docker-rmvol -f dangling=true'

webstat() {
	httpstat "http://"$1
	hey -d 100 "http://"$1
}

gcomp() {
	g++ -Wall -g -std=c++14 *.cpp -o $1
}

export GOPATH=~/Go
export PATH=$PATH:$GOPATH/bin

source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

xrdb ~/.Xresources

[ -f ~/dotfiles/credentials.sh ] && source ~/dotfiles/credentials.sh
# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
