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
setopt no_beep         #turn off bell
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
alias wifi='sudo rfkill unblock all; sudo ip link set wlp6s0 up; sudo wifi-menu'
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot now'
alias update='yaourt -Syua --noconfirm;npm update -g'
alias clean='pacman -Rsn $(pacman -Qtdq); rm -f ~/.xsession-errors;rm -f ~/.xsession-errors.old;clear'
alias upcl='update;clean;'
alias untar='tar -xvf'
alias open='thunar'
alias gpom='git push origin master'
alias subl='subl3'
alias pingg="webstat google.com"
alias rickroll='nc rya.nc 1987'
alias google='google-chrome-stable'
alias gpa='git pull --all'
alias gnuke="git reset --hard && git clean -fdxi;git pull --all"
alias vi='vim'
alias matrix='cmatrix'
alias inst="yaourt -S --noconfirm"
alias schemer='~/Go/bin/schemer2'
alias fetch='neofetch'
alias grm='git rm -rf'
alias gcache='git config credential.helper cache'
alias upyolo='yaourt -Syyuua --devel --noconfirm'
alias reload='xrdb ~/.Xresources'
alias intellij='intellij-idea-ultimate-edition'
alias cat='cat -n'
alias dclean='docker rmi $(docker images -f "dangling=true" -q)'
alias ctop='nocorrect ctop '

dnuke() {
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)
}

dock() {
	intern=eDP1
	extern=HDMI1

	if xrandr | grep "$extern disconnected"; then
	    xrandr --output "$extern" --off --output "$intern" --auto

	else
	    xrandr --output "$intern" --off --output "$extern" --auto
	fi
}

webstat() {
	httpstat "http://"$1
	hey -d 100 "http://"$1
}

gall() {
	git add .
	git commit -m $1
	git push origin master
}

gcomp() {
	g++ -Wall -g -std=c++14 *.cpp -o $1
}

alias pserver='python -m http.server'
PATH=$PATH:/home/tyler/.gem/ruby/2.3.0/bin

export GOPATH=~/Go
export PATH=$PATH:$GOPATH/bin
source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



alias pbox=' ssh root@192.241.244.104'




