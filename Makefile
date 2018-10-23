APP_NAME=api

run:
	docker-compose build ${APP_NAME}
	docker-compose up -d --build --remove-orphans

lock:
	echo '' > requirements.lock
	docker-compose build ${APP_NAME}
	docker-compose run --rm ${APP_NAME} pip freeze > requirements.lock

stop:
	docker-compose stop
	docker-compose rm -f

test:
	docker-compose build --build-arg TEST=1 ${APP_NAME}
	docker-compose run --rm ${APP_NAME} nosetests -v --nologcapture /usr/src/app/tests
