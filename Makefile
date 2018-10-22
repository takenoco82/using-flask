APP_NAME=api

run:
	docker-compose up -d --build --remove-orphans

stop:
	docker-compose stop
	docker-compose rm -f

test:
	docker-compose run --rm ${APP_NAME} nosetests -v --nologcapture /usr/src/app/tests
