run:
	python ./src/run.py

test:
	nosetests -v --nologcapture ./src/tests
