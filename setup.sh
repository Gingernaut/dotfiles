#!/bin/zsh
set -x

rm -f ~/.zshrc

printf "prezto setup \n \n"

rm -rf ~/.zprezto;  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
sudo chsh -s /bin/zsh

printf "--------- \n"
printf "Linking dotfiles \n \n"

ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/zsh/.zshrc"  "${ZDOTDIR:-$HOME}/.zshrc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/zsh/.zprofile"  "${ZDOTDIR:-$HOME}/.zprofile"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/zsh/.zpreztorc"  "${ZDOTDIR:-$HOME}/.zpreztorc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/vim/.vimrc"  "${ZDOTDIR:-$HOME}/.vimrc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/x_files/.xinitrc"  "${ZDOTDIR:-$HOME}/.xinitrc"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/x_files/.Xresources"  "${ZDOTDIR:-$HOME}/.Xresources"
ln -fns  "${ZDOTDIR:-$HOME}/dotfiles/.gitconfig"  "${ZDOTDIR:-$HOME}/.gitconfig"

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# go get -u github.com/davecheney/httpstat
# go get -u github.com/rakyll/hey
# go get -u github.com/tuneinc/fasts3


source ~/.zshrc
printf "-----------------------"
printf "!! Install completed !!"
printf "-----------------------"
sleep 1

