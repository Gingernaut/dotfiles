#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./homebrew_setup.sh
'
    exit
fi

cd "$(dirname "$0")"

brew_pkgs() {
    arch -arm64 brew install coreutils 
    arch -arm64 brew install moreutils 
    arch -arm64 brew install findutils
    arch -arm64 brew install cmake 
    arch -arm64 brew install gcc
    
    arch -arm64 brew install gnu-sed
    
    # Install a modern version of Bash.
    arch -arm64 brew install bash
    arch -arm64 brew install bash-completion2

    arch -arm64 brew install wget

    # Install GnuPG to enable PGP-signing commits.
    arch -arm64 brew install gnupg

    # Install more recent versions of some macOS tools.
    arch -arm64 brew install vim
    arch -arm64 brew install grep
    arch -arm64 brew install openssh


    # Install font tools.
    brew tap bramstein/webfonttools
    arch -arm64 brew install sfnt2woff
    arch -arm64 brew install sfnt2woff-zopfli
    arch -arm64 brew install woff2


    # Install other useful binaries.
    arch -arm64 brew install ack
    arch -arm64 brew install git
    arch -arm64 brew install git-lfs
    arch -arm64 brew install tree


    arch -arm64 brew install zsh
    arch -arm64 brew install python
    arch -arm64 brew install python3
    arch -arm64 brew install wget
    arch -arm64 brew install docker
    arch -arm64 brew install scala
    arch -arm64 brew install apache-spark
    arch -arm64 brew install nvm
    arch -arm64 brew install diff-so-fancy
    arch -arm64 brew install nmap
    arch -arm64 brew install htop
    arch -arm64 brew install jq
    arch -arm64 brew install httpie 
    arch -arm64 brew installctop 
    arch -arm64 brew install curl
}


sdkman_setup() {
    # install SDKMAN to manage java versions
    curl -s "https://get.sdkman.io" | bash
}

vim_setup() {
    # Ask for the administrator password upfront
    sudo -v
    


    if [ ! -f $HOME/.vimrc ]
    then
        ln -s "$(pwd)"/vim/.vimrc $HOME/.vimrc
    else
        echo ".vimrc already exists, skipping symbolic link"
    fi


    # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}

zsh_setup() {


}

brew_pkgs "$@"
# sdkman_setup() "$@"
# vim_setup "$@"
