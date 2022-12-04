# awesome wm configuration
## Requirements
```
xss-lock
i3lock
nitrogen
```
### Used for:
- xss-lock: ensures screen is always lcoked upon supend/hibernation
- i3lock provides the actual lockscreen
- nitrogen: handles wallpaper stuff

### Install widgets:
```
cd ~/.config/awesome/
git clone https://github.com/streetturtle/awesome-wm-widgets.git
```

### Install icons:
```
cd ~/Dokumente
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install
```

### install gui tools
```
pacman -S arandr autorandr pavucontrol
```

### configure screen setup (configure using arandr and save with autorandr)
```
autorandr --save docked
```