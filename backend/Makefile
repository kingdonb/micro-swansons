.PHONY: backend
backend:
	faas build -f ./manners.yml --build-arg ADDITIONAL_PACKAGE='build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev'
tag:
	docker tag kingdonb/manners:latest kingdonb/manners:0.1.0
push:
	docker push kingdonb/manners:0.1.0
