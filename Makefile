install:
	install itmot itmo_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat itmo.services`" /etc/services || cat itmo.services >> /etc/services
	install itmo.xinetd /etc/xinetd.d/itm
	ln -s /usr/local/bin/itmo_ui /usr/local/bin/nitmo_ui

itmo_ui.pot: itmo_ui
	xgettext -o itmo_ui.pot -L Shell itmo_ui

clone:
	git clone https://github.com/itmo-infocom/calc_examples.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
