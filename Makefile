install:
	$(eval WHOAMI=$(shell whoami))
	mkdir -p backup
	cp /etc/systemd/logind.conf ./backup/logind.conf 2>/dev/null
	cp /home/$(WHOAMI)/.config/picom.conf ./backup/ 2>/dev/null
	cp /home/$(WHOAMI)/.config/awesome/rc.lua backup/ 2>/dev/null
	mkdir -p /home/$(WHOAMI)/.config/awesome
	mkdir -p /home/$(WHOAMI)/.config/autorandr/
	if ! [ -d "/home/$(WHOAMI)/.config/awesome/awesome-wm-widgets/" ]; then git clone https://github.com/streetturtle/awesome-wm-widgets.git /home/$(WHOAMI)/.config/awesome/awesome-wm-widgets; fi
	chmod +x scripts/*
	mkdir -p /home/$(WHOAMI)/awesomescripts/
	cp scripts/* /home/$(WHOAMI)/awesomescripts/
	sh adjust_dir.sh
	cp build/adjusted.lua /home/$(WHOAMI)/.config/awesome/rc.lua
	if ! [ -d "arc-icon-theme" ]; then git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme && ./autogen.sh --prefix=/usr && sudo make install; fi
	sudo cp logind.conf /etc/systemd/logind.conf
	cp autorandrpostswitch /home/$(WHOAMI)/.config/autorandr/postswitch
	awesome -k
	

uninstall:
	$(eval WHOAMI=$(shell whoami))
	rm -rf /home/$(WHOAMI)/awesomescripts/
	rm -rf /home/$(WHOAMI)/.config/awesome/awesome-wm-widgets
	sudo cp ./backup/logind.conf /etc/systemd/logind.conf  2>/dev/null
	cp ./backup/rc.lua /home/$(WHOAMI)/.config/awesome/rc.lua 2>/dev/null
	cp ./backup/picom.conf /home/$(WHOAMI)/.config/picom.conf 2>/dev/null
	cd arc-icon-theme && sudo make uninstall 2>/dev/null
	rm -rf arc-icon-theme
	rm /home/$(WHOAMI)/.config/autorandr/postswitch
