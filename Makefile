include .env
export

build: ## Build current containers and add current user in django files and folder.
	docker-compose up -d

start: ## Start current containers.
	docker-compose up

stop: ## Stop and remove running current containers.
	docker-compose down

stop-all: ## Stop all running containers.
	docker stop $(docker ps -q)


