# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tyler/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U compinit
compinit


#Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ll='ls -l'
alias la='ls -la'
alias vrc='vim ~/.zshrc'
alias top='htop'
alias ifconfig='ip addr'
alias polyfy='~/dotfiles/misc/polyfy.sh'
alias lock='~/lock.sh'
alias listi='yaourt -Qqet' ## lists all user installed packages
alias pacman='sudo pacman'
alias wifi-menu='sudo rfkill unblock all; sudo ip link set wlp6s0 up; sudo wifi-menu'
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot now'
alias update='yaourt -Syua --noconfirm'
alias clean='pacman -Rsn $(pacman -Qtdq)'
alias untar='tar -xvf'
alias open='thunar'
alias gpom='git push origin master'
alias subl='subl3'
alias pingg="ping http://www.google.com"
alias rickroll='nc rya.nc 1987'
alias google='google-chrome-stable'
alias 'gnuke'="git reset --hard && git clean -fdx"

# The Fuck package
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"
source /usr/share/doc/pkgfile/command-not-found.zsh
