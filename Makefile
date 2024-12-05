init:
	sudo apt update 
	sudo apt update -y
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	nvm install 22
	npm install -g npm && npm install

serve:
	cd docs/ && bundle exec jekyll serve

npm_update:
	npm install -g npm-check-updates
	ncu --upgrade
	make npm_build

npm_build:
	@printf '\n\n$(bold)Instalando Node Modules$(sgr0)\n'
	npm install
	
	rm -rf docs/assets/vendor
	rm -rf docs/assets/vendor/images/bootstrap-icons

	mkdir -p docs/assets/vendor/bootstrap
	cp -r node_modules/bootstrap/dist/* docs/assets/vendor/bootstrap
	npm run sass-prod

	mkdir -p docs/assets/vendor/bootstrap-icons
	cp -r node_modules/bootstrap-icons/font/* docs/assets/vendor/bootstrap-icons

	mkdir -p docs/assets/vendor/images/bootstrap-icons
	cp -r node_modules/bootstrap-icons/icons/* docs/assets/vendor/images/bootstrap-icons

	mkdir -p docs/assets/vendor/htmx
	cp -r node_modules/htmx.org/dist/* docs/assets/vendor/htmx

	mkdir -p docs/assets/vendor/chart.js
	cp -r node_modules/chart.js/dist/* docs/assets/vendor/chart.js

	mkdir -p docs/assets/vendor/jquery
	cp -r node_modules/jquery/dist/* docs/assets/vendor/jquery

npm_dev:
	npm run sass-dev