install:
	$(eval WHOAMI=$(shell whoami))
	mkdir -p backup
	cp /etc/systemd/logind.conf ./backup/logind.conf 2>/dev/null
	cp /home/$(WHOAMI)/.config/awesome/rc.lua backup/ 2>/dev/null
	mkdir -p ~/.config/awesome
	if ! [ -d "/home/$(WHOAMI)/.config/awesome/awesome-wm-widgets/" ]; then git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome/awesome-wm-widgets; fi
	chmod +x scripts/*
	mkdir -p ~/awesomescripts/
	cp scripts/* ~/awesomescripts/
	sh adjust_dir.sh
	cp build/adjusted.lua ~/.config/awesome/rc.lua
	git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme && ./autogen.sh --prefix=/usr && sudo make install
	sudo cp logind.conf /etc/systemd/logind.conf
	awesome -k
	

uninstall:
	$(eval WHOAMI=$(shell whoami))
	rm -rf ~/awesomescripts/
	rm -rf ~/.config/awesome/awesome-wm-widgets
	sudo cp ./backup/logind.conf /etc/systemd/logind.conf  2>/dev/null
	cp ./backup/rc.lua /home/$(WHOAMI)/.config/awesome/rc.lua 2>/dev/null
	cd arc-icon-theme && sudo make uninstall
