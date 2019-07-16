HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
zstyle :compinstall filename '~/.zshrc'
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
alias untar='tar -xvf'
alias vi='vim'
alias ctop='nocorrect ctop'
alias cla="clear;la"
alias pullall='~/dotfiles/pullAll.sh'
alias update='brew update;pullall'
alias s3='fasts3'
alias ass='SBT_OPTS="-Xmx3G" sbt "set test in assembly := {}" assembly'

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

[ -f ~/dotfiles/.worksettings.sh ] && source ~/dotfiles/.worksettings.sh
