xrandr --newmode "1920x1080_60"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 1920x1080_60
xrandr --output Virtual1 --mode 1920x1080_60

xrandr --newmode "2560x1440_40.00"  201.00  2560 2720 2984 3408  1440 1443 1448 1476 +hsync +vsync
xrandr --addmode Virtual1 2560x1440_40.00
xrandr --output Virtual1 --mode 2560x1440_40.00 --verbose
