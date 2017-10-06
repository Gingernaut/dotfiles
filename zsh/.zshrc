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

alias ll='ls -lh'
alias la='ls -lha'
alias al='la'
alias vvc='vim ~/.vimrc'
alias vrc='vim ~/.zshrc'
alias top='htop'
alias ifconfig='ip addr'
alias polyfy='~/dotfiles/misc/polyfy.sh'
alias lock='~/dotfiles/misc/lock/lock.sh'
alias listi='yaourt -Qqet' ## lists all user installed packages
alias pacman='sudo pacman'
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot now'
alias update='yaourt -Syua --noconfirm'
alias clean='pacman -Rsn $(pacman -Qtdq); rm -f ~/.xsession-errors;rm -f ~/.xsession-errors.old'
alias upcl='update;clean'
alias untar='tar -xvf'
alias gpom='git push origin master'
alias pingg="webstat google.com"
alias rickroll='nc rya.nc 1987'
alias google='google-chrome-stable'
alias vi='vim'
alias matrix='cmatrix'
alias inst="yaourt -S --noconfirm"
alias fetch='neofetch'
alias upyolo='yaourt -Syyuua --devel --noconfirm'
alias ctop='nocorrect ctop'
alias monitor='~/dotfiles/setMonitors.sh'

webstat() {
	httpstat "http://"$1
	hey -d 100 "http://"$1
}

gall() {
	git add .
	git commit -m $1
	git push origin $2
}

gcomp() {
	g++ -Wall -g -std=c++14 *.cpp -o $1
}

alias pserver='python -m http.server'
PATH=$PATH:/home/tyler/.gem/ruby/2.3.0/bin
export GOPATH=~/Go
export PATH=$PATH:$GOPATH/bin
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$(yarn global bin):$PATH"

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

