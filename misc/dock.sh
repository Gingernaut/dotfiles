xrandr --output eDP1 --off

xrdb ~/dotfiles/misc/.new_xresources

xrandr --setprovideroutputsource 1 0
xrandr --setprovideroutputsource 2 0

xrandr --output DVI-I-1 --mode 1920x1080
xrandr --output DVI-I-2 --mode 1920x1080
xrandr --output DVI-I-1 --primary
xrandr --output DVI-I-2 --left-of DVI-I-1

bspc monitor DVI-I-1 I II III IV V
bspc monitor DVI-I-2 VI VII VIII IX X