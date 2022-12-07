# awesome wm configuration
This repo provides an awesome configuration file designed to be used on a system running awesome on top of gnome to ensure all gtk stuff is present. Audio stuff is built for pipewire but should in theory work for everything else as well.
## Requirements
```
xss-lock
i3lock
nitrogen
picom
arandr
pavucontrol
```
### Installation:
```
make install
```
### Uninstallation:
```
make uninstall
```


### configure screen setup (configure using arandr and save with autorandr)
```
autorandr --save docked
```

### add udev rule to allow brightness changing (only on intel graphics)
`/etc/udev/rules.d/backlight.rules`
```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"```