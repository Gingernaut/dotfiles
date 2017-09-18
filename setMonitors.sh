# vertical monitor
xrandr --newmode "vertical"  178.35  1080 1168 1288 1496  1920 1921 1924 1987  -HSync +Vsync
xrandr --addmode HDMI2 "vertical"
xrandr --output HDMI2 --mode "vertical"

# ultrawide
xrandr --newmode "ultrawide"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync
xrandr --addmode HDMI1 "ultrawide"
xrandr --output HDMI1 --mode "ultrawide"