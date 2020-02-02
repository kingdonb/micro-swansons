.PHONY: backend
backend:
	faas build -f ./backend/manners.yml --build-arg ADDITIONAL_PACKAGE='build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev'
