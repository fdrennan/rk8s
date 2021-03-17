style:
	R -e "styler::style_file('plumber.R')"
	R -e "styler::style_file('entrypoint.R')"
	R -e "styler::style_dir('R')"

build:
	docker build -t local-rk8s .

runlocal:
	docker run -p 8000:8000 local-rk8s

runprod:
	docker run -p 8000:8000 fdrennan/rk8s

list:
	docker ps -aq

stop:
	docker stop $(docker ps -aq)

remove:
	docker rm $(docker ps -aq)



