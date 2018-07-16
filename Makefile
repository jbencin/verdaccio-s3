TAG ?= latest

all:
	docker build -t verdaccio-s3:$(TAG) .
