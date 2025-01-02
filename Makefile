down:
	docker compose down --remove-orphans
up:
	docker compose up --build --remove-orphans -d
up-f:
	docker compose up --build --remove-orphans
