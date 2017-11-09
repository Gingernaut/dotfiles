HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
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

alias ll='ls -lh'
alias la='ls -lha'
alias al='la'
alias vvc='vim ~/.vimrc'
alias vrc='vim ~/.zshrc'
alias top='htop'
alias ifconfig='ip addr'
alias untar='tar -xvf'
alias gpom='git push origin master'
alias vi='vim'
alias fetch='neofetch'
alias ctop='nocorrect ctop'
alias clean='sudo apt autoremove -y'
alias inst='sudo apt-get install -y'
alias update='sudo apt-get update -y; sudo apt-get upgrade -y'
alias upcl='update;clean'

gall() {
	git add .
	git commit -m $1
	git push origin $2
}

gcomp() {
	g++ -Wall -g -std=c++14 *.cpp -o $1
}

alias pserver='python -m http.server'

alias cla="clear;la"

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

