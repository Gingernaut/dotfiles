#!/usr/bin/env zsh

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install
####################### Additional Zim settings #######################

zstyle ':zim:duration-info' threshold 2
zstyle ':zim:duration-info' show-milliseconds yes

autoload -Uz add-zsh-hook
add-zsh-hook preexec duration-info-preexec
add-zsh-hook precmd duration-info-precmd

RPS1='${duration_info}'

homebrewupdates() {
  brewu;
  brewU;
  caskU;
  brewc;
  brewa;
  brewd;
}

####################### History Settings #######################


HISTFILE=~/.histfile
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=2000000 # big big history
export HISTFILESIZE=2000000 # big big history

export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt INC_APPEND_HISTORY        # Appends every command to the history file once it is executed


# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_COMPLETION_DIR_COMMANDS="cd rmdir tree"



####################### Aliases #######################
alias ll='ls -lh'
alias la='ls -lha'
alias cla="clear;la"
alias top='htop'
alias vvc='vim ~/.vimrc'
alias vrc='vim ~/.zshrc'
alias open='open -a ForkLift '
alias update="homebrewupdates;zimfw update;vim +PlugUpdate +qall;softwareupdate -l;"
alias dstop='docker stop $(ps -q)'
alias cat='bat --paging=never --style=plain'
alias githa='git rev-parse --short HEAD | cut -c 1-7 | pbcopy'

# LosslessCut cleanup
alias cleantrimmings="find . -type f -name '*.llc' -delete;find . -type f -name '*.bin' -delete"

# credential sourcing
[ -f ~/dotfiles/credentials.sh ] && source ~/dotfiles/credentials.sh

####################### Helper functions #######################

pawk () {
  awk "{print \$$@ }"
}

pyclean () {
  rm -rf .pytest_cache;
  find . -type f -name "*.py[co]" -delete;
  find . -type d -name "__pycache__" -delete;
}

nvenv () {
  if [[ "$VIRTUAL_ENV" != "" ]]
  then
    deactivate;
  fi
  pyclean;
  if [ -d "$(pwd)/.venv" ]
  then 
      echo "removing current .venv"
      rm -rf .venv;
  fi;
  python3 -m venv .venv;
  source .venv/bin/activate;
  

  if [ -e pyproject.toml ]; then
    if grep -q "poetry-core" pyproject.toml; then
      echo "installing poetry dependencies";
        poetry install;
    elif grep -q "pdm" pyproject.toml; then
      echo "Installing pdm dependencies";
      pdm install;
    fi
  elif [ -e requirements.txt ]; then
    echo "installing requirements.txt";
    pip3 install -r requirements.txt;
  fi
}

####################### Compatability settings #######################

export DOCKER_DEFAULT_PLATFORM=linux/amd64

export PATH="/usr/local/sbin:$PATH"

# For compilers to find curl you may need to set:
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"

# For pkg-config to find curl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

###################### Utility tool homes #######################


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pyenv
# poetry 
export PATH="/Users/tpeterson/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"



# zoxide

eval "$(zoxide init zsh)"