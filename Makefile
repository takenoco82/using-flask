run:
	docker-compose up -d --build --remove-orphans

stop:
	docker-compose stop
	docker-compose rm -f

test:
	docker-compose run --rm api nosetests -v --nologcapture /usr/src/app/tests
