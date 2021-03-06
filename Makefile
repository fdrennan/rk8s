push: style readme build
	echo 'Package built'

style:
	R -e "styler::style_file('plumber.R')"
	R -e "styler::style_file('entrypoint.R')"
	R -e "styler::style_dir('R')"

renv:
	R -e "renv::rebuild()"

snap:
	R -e "renv::snapshot()"

build:
	docker build -t local-rk8s .

readme:
	R -e "rmarkdown::render('README.Rmd')

up:
	docker-compose up

upd:
	docker-compose up -d

hopin:
	docker run -it local-rk8s bash

run:
	docker run -p 80:8000 local-rk8s

runprod:
	docker run -p 80:8000 fdrennan/rk8s



