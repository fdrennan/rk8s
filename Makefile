style:
	R -e "styler::style_file('plumber.R')"
	R -e "styler::style_file('entrypoint.R')"
	R -e "styler::style_dir('R')"

snap:
	R -e "renv::snapshot()"

build:
	docker build -t local-rk8s .

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



