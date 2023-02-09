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
alias cla="clear;la"
alias al='la'
alias vvc='vim ~/.vimrc'
alias vrc='vim ~/.zshrc'
alias top='htop'
alias ifconfig='ip addr'
alias update='brew update'
alias untar='tar -xvf'
alias pingg="webstat google.com"
alias vi='vim'
alias fetch='neofetch'
alias ctop='nocorrect ctop'

# Spark
 export PATH="$PATH:/opt/apache-spark/bin"

webstat() {
	httpstat "http://"$1
	hey -d 100 "http://"$1
}

export GOPATH=~/Go
export PATH=$PATH:$GOPATH/bin

export SCALA_HOME=/usr/local/opt/scala/idea
# source /usr/share/nvm/init-nvm.sh


[ -f ~/dotfiles/credentials.sh ] && source ~/dotfiles/credentials.sh
# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Users/tpeterson/.local/bin:$PATH"