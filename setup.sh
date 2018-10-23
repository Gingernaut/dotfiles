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

printf "copying and installing fonts \n \n"
sudo mkdir /usr/local/share/fonts
sudo cp ~/dotfiles/.fonts/*.ttf /usr/local/share/fonts
sudo fc-cache -fv

printf "--------- \n"
printf "installing development packages \n \n"

yaourt -S --noconfirm vim go zsh-syntax-highlighting \
    docker docker-compose htop nvm rofi rustup valgrind \
    visual-studio-code-bin tree strace gzip unzip ctop \


# Docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

go get -u github.com/davecheney/httpstat
go get -u github.com/rakyll/hey

printf "installing user packages"
yaourt -S --noconfirm spotify qbittorrent slack-desktop sqlectron-gui urxvt-unicode

source ~/.zshrc
printf "-----------------------"
printf "!! Install completed !!"
printf "-----------------------"
sleep 1

printf "restarting system for docker group changes to take effect in 5 seconds"
sleep 5
reboot

