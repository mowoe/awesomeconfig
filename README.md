# awesome wm configuration
- This repo provides an awesomewm configuration file designed to be used on a system running awesome on top of gnome to ensure all gtk stuff is present. Audio stuff is built for pipewire but should in theory work for everything else as well.

- Locking is done via i3lock. XSS-lock listens to systemd events to ensure locking is done *before* suspension/hibernation
- Systemd logind is handling suspending the laptop upon its lid being closed
- wallpaper is set using nitrogen, which is started along with each session
- some small bash scripts handle volume control and lcd brightness control via XF86 keys
- Screen layout can be configured using arandr and then automatically reused with autorandr
- To combat some really ugly tearing on intel cpus, picom is used as a compositor.
- CPU and Battery widgets from [here](https://github.com/streetturtle/awesome-wm-widgets.git)
- Automatic Locking and Suspending via Super+L shortcut
- Screenshot via `Print`-Key
## Requirements
```
xss-lock
i3lock
nitrogen
picom
arandr
autorandr
pavucontrol
gnome-screenshot
acpi-tools (community/acpi in arch)
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
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```
###  add yourself to group video:
```
sudo usermod -aG video $(whoami)
```
