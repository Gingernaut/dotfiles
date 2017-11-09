# run this file after installing zsh and prezto
ln -s /$USER/dotfiles/.gitconfig /$USER/.gitconfig;

rm -f ~/.zshrc;
rm -f ~/.zpreztorc;

ln -s /$USER/dotfiles/zsh/.zshrc /$USER/.zshrc;
ln -s /$USER/dotfiles/zsh/.zpreztorc /$USER/.zpreztorc;

# Vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

ln -s /$USER/dotfiles/vim/.vimrc /$USER/.vimrc;

# General server
sudo apt-get install fail2ban;

sudo apt-get install logwatch;
sudo echo "/usr/sbin/logwatch --output mail --mailto tylermpeterson36@gmail.com --detail high" >> /etc/cron.daily/00logwatch;

sudo apt-get update -y;
sudo apt-get upgrade -y;

source ~/.zshrc;