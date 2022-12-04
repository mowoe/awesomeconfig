# awesome wm configuration
## Requirements
```
xss-lock
i3lock
nitrogen
picom
arandr
pavucontrol
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

### configure xss-lcok
```
xss-lock --transfer-sleep-lock -- "/home/mowoe/lock.sh" --nofork
```

### add custom locking script
```
cp lock.sh ~/
chmod +x ~/lock.sh
```

### picom is used to combat ugly tearing

### copy logind.conf to proper location:
```
sudo cp logind.conf /etc/systemd/logind.conf
```

### copy scripts to proper location:
```
cp scripts/* ~/
```