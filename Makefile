.PHONY: backend
backend:
	docker build -f Dockerfile.backend ./ -t kingdonb/microswansons-backend:latest
