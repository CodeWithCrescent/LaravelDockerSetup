.PHONY: up down restart build bash logs test migrate rollback seed fresh optimize cache-clear

# Start all containers
up:
	docker-compose up -d

# Stop all containers
down:
	docker-compose down

# Restart all containers
restart:
	docker-compose restart

# Build all containers
build:
	docker-compose build

# Access the app container
bash:
	docker-compose exec app bash

# View container logs
logs:
	docker-compose logs -f

# Run tests
test:
	docker-compose exec app php artisan test

# Run migrations
migrate:
	docker-compose exec app php artisan migrate

# Rollback migrations
rollback:
	docker-compose exec app php artisan migrate:rollback

# Seed the database
seed:
	docker-compose exec app php artisan db:seed

# Fresh migrations with seed
fresh:
	docker-compose exec app php artisan migrate:fresh --seed

# Optimize Laravel
optimize:
	docker-compose exec app php artisan optimize:clear

# Clear cache
cache-clear:
	docker-compose exec app php artisan cache:clear
	docker-compose exec app php artisan config:clear
	docker-compose exec app php artisan route:clear
	docker-compose exec app php artisan view:clear
