run:
	docker-compose up -d

stop:
	docker-compose down

destroy:
	docker-compose down -v

build:
	docker build -t openlobby/openlobby-es-czech:latest .

push:
	docker push openlobby/openlobby-es-czech:latest

release:
	make build
	make push
