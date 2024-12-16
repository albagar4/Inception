NAME = Inception

all:
	@docker compose -f ./srcs/docker-compose.yml up -d

build:
	@docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker system prune -a

.PHONY: all build down clean
