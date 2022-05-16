dev_token = "4a65d329-52c9-4830-a156-217973fb72de"
production_token = ${PRODUCTION_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python3 -m pytest --cov=./ tests/test_sample.py --cov-report=xml:flagtwo.coverage.xml

test.flagone:
	rm coverage.xml || true
	rm .coverage || true
	python3 -m pytest --cov=./ tests/test_number_two.py --cov-report=xml:flagone.coverage.xml

dev.report:
	./codecov -t ${dev_token} -F flagtwo -f flagtwo.coverage.xml

dev.report.flagone:
	./dev.sh -t ${dev_token} -F flagone -f flagone.coverage.xml

production.report:
	./production.sh -t ${production_token} -F flagtwo  -f flagtwo.coverage.xml

production.report.flagone:
	./production.sh -t ${production_token} -F flagone  -f flagone.coverage.xml

dev.full:
	${MAKE} dev.download
	${MAKE} test
	${MAKE} dev.report
	${MAKE} test.flagone
	${MAKE} dev.report.flagone

dev.partial:
	${MAKE} dev.download
	${MAKE} test
	${MAKE} dev.report

production.full:
	${MAKE} production.download
	${MAKE} test.flagone
	${MAKE} production.report.flagone
	${MAKE} test
	${MAKE} production.report

production.partial:
	${MAKE} production.download
	${MAKE} test
	${MAKE} production.report

dev.download:
	curl -s https://github.com/codecov/uploader/releases/download/v0.2.2/codecov-linux > dev.sh
	chmod +x ./dev.sh

production.download:
	curl -s https://github.com/codecov/uploader/releases/download/v0.2.2/codecov-linux > production.sh
	chmod +x ./production.sh
