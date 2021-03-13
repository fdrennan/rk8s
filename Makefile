style:
	R -e "styler::style_file('plumber.R')"
	R -e "styler::style_file('entrypoint.R')"

build:
	docker build -t mdneuzerling/plumber-on-k8s .

run:
	docker run -p 8000:8000 mdneuzerling/plumber-on-k8s

list:
	docker ps -aq

stop:
	docker stop $(docker ps -aq)

remove:
	docker rm $(docker ps -aq)