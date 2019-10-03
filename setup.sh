#!/bin/zsh
set -x

rm -rf ~/.z*

sudo apt-get update -y && sudo apt-get upgrade -y

printf "prezto setup \n \n"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
sudo chsh -s /bin/zsh

printf "--------- \n"
printf "Linking dotfiles \n \n"

ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/zsh/.zshrc"  "${ZDOTDIR:-$HOME}/.zshrc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/zsh/.zpreztorc"  "${ZDOTDIR:-$HOME}/.zpreztorc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/vim/.vimrc"  "${ZDOTDIR:-$HOME}/.vimrc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/.gitconfig"  "${ZDOTDIR:-$HOME}/.gitconfig"


printf "---------"
printf "installing packages \n \n"

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


printf "installing docker \n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}


printf "installing docker-compose /n"
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# General server
sudo apt-get install fail2ban htop -y;

source ~/.zshrc
update;clean
printf "-----------------------"
printf "!! Install completed !!"
printf "-----------------------"
