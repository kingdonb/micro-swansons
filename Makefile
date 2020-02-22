.PHONY: backend up clean mrproper dbsetup migrate console test

# build
backend:
	docker build -f Dockerfile.backend ./ -t kingdonb/microswansons-backend:latest

up:
	docker-compose up

# down
clean:
	docker-compose rm -f

mrproper: clean
	docker volume rm micro-swansons_db-data

# database
dbsetup:
	docker exec -it tables-backend bash --login -c 'rails db:setup'
migrate:
	docker exec -it tables-backend bash --login -c 'rails db:migrate'
console:
	docker exec -it tables-backend bash --login -c 'rails console'
test:
	docker exec -it tables-backend bash --login -c 'rspec'
