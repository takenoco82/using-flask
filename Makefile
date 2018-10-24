SERVICE_API=api

.PHONY: run
run: stop
	docker-compose up -d --build --remove-orphans

.PHONY: lock
lock:
	echo '' > requirements.lock
	docker-compose build ${SERVICE_API}
	docker-compose run --rm ${SERVICE_API} pip freeze > requirements.lock

.PHONY: stop
stop:
	docker-compose stop
	docker-compose rm -f

.PHONY: test
test:
	docker-compose build --build-arg TEST=1 ${SERVICE_API}
	docker-compose run --rm ${SERVICE_API} nosetests -v --nologcapture /usr/src/app/tests
