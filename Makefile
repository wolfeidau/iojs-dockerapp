REPORTER = spec

all: jshint test

build:
	docker build -t wolfeidau/iojs-dockerapp .

push:
	docker push wolfeidau/iojs-dockerapp

local:
	docker run -t -i --rm -e "NODE_ENV=development" -p 3000:3000 -t wolfeidau/iojs-dockerapp

test:
	@NODE_ENV=test ./node_modules/.bin/mocha --recursive --reporter $(REPORTER) --timeout 3000

jshint:
	jshint lib examples test index.js

tests: test

tap:
	@NODE_ENV=test ./node_modules/.bin/mocha -R tap > results.tap

unit:
	@NODE_ENV=test ./node_modules/.bin/mocha --recursive -R xunit > results.xml --timeout 3000

skel:
	mkdir examples lib test
	touch index.js
	npm install mocha chai --save-dev

.PHONY: all build push local test tap unit jshint skel