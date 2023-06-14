#
# Makefile

defaut: help

build: ## docker-compose build
	docker-compose build

up: ## docker-compose up
	docker-compose up -d
	open http://localhost:1337/

down: ## docker-compose down
	docker-compose down

logs: ## show compose logs
	docker-compose logs

docker-build:
	docker build -t ourboard .

docker-run:
	docker run --rm -it --entrypoint sh ourboard

help: ## Display this help screen
	@grep -E '^[a-zA-Z][a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
