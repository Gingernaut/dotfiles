HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/tyler/.zshrc'
autoload -Uz compinit
compinit
autoload -U compinit
compinit

#Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ll='ls -l'
alias la='ls -la'
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
alias update='yaourt -Syua --noconfirm'
alias clean='pacman -Rsn $(pacman -Qtdq); rm -f ~/.xsession-errors;rm -f ~/.xsession-errors.old;clear'
alias untar='tar -xvf'
alias open='thunar'
alias gpom='git push origin master'
alias subl='subl3'
alias ping='ping -c 4 '
alias pingg="ping www.google.com"
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

PATH=$PATH:/home/tyler/.gem/ruby/2.3.0/bin

eval "$(thefuck --alias)"
eval "$(thefuck --alias oops)"

source /usr/share/doc/pkgfile/command-not-found.zsh
