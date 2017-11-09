# run this file after installing zsh.

## installing & configuring zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -f ~/.zshrc;
rm -f ~/.zpreztorc;

ln -s /$USER/dotfiles/zsh/.zshrc /$USER/.zshrc;
ln -s /$USER/dotfiles/zsh/.zpreztorc /$USER/.zpreztorc;


source ~/.zshrc

# Vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# General server
sudo apt-get install fail2ban;

sudo rm -f /etc/apt/apt.conf.d/10periodic;
sudo rm -f /etc/apt/apt.conf.d/50unattended-upgrades;

sudo echo "APT::Periodic::Update-Package-Lists '1';
APT::Periodic::Download-Upgradeable-Packages '1';
APT::Periodic::AutocleanInterval '7';
APT::Periodic::Unattended-Upgrade '1';" > /etc/apt/apt.conf.d/10periodic;


sudo echo "Unattended-Upgrade::Allowed-Origins {
        '${distro_id}:${distro_codename}';
        '${distro_id}:${distro_codename}-security';
        'Ubuntu lucid-security';
    //  'Ubuntu lucid-updates';
};" > /etc/apt/apt.conf.d/50unattended-upgrades;


sudo apt-get install logwatch
sudo echo "/usr/sbin/logwatch --output mail --mailto tylermpeterson36@gmail.com --detail high" >> /etc/cron.daily/00logwatch;



sudo apt-get update -y;
sudo apt-get upgrade -y;
