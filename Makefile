#
# Makefile

defaut: help

build: ## docker compose build
	docker compose build

up: ## docker compose up
	./scripts/update_dot_env.sh
	docker compose up -d
	docker compose ps -a
	open http://`./scripts/host_ip.sh`:1337/
	open http://`./scripts/host_ip.sh`:8081/

down: ## docker compose down
	docker compose down

clean: down ## clean up container data
	rm -fr ./container_data

logs: ## show compose logs
	docker compose logs

backup: ## db data backup
	docker compose exec db /tmp/data/scripts/backup.sh

restore_latest: ## db data restore latest file
	docker compose exec db /tmp/data/scripts/restore.sh

docker-build:
	docker build -t ourboard .

docker-run:
	docker run --rm -it --entrypoint sh ourboard

help: ## Display this help screen
	@grep -E '^[a-zA-Z][a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
