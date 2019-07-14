#HOST = antica.uberhip.com moved to balancar
HOST = balancar.uberhip.com


help:
	@echo 'Makefile for Uberhip.com Jekyll Site'
	@echo ''
	@echo '  make build                   regenerates site'
	@echo '  make clean                   removes contents of _site'
	@echo '  make test_deploy             deploys site to test server'
	@echo '  make prod_deploy             deploys site to production server'

clean:
	rm -rf misc/gallery
	rm -rf _site/*

build: clean
	cd _sigal; /Users/godber/.virtualenvs/sigal/bin/sigal build
	jekyll build
	chmod -R 755 _site/*

prod_deploy: build
	rsync -a _site/ $(HOST):/var/www/web6/web/
	notify-send 'Deploy Status' 'Deploy to production complete'

test_deploy: build
	rsync -a _site/ $(HOST):/var/www/web3/web/
	notify-send 'Deploy Status' 'Deploy to test complete'
