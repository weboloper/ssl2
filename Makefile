.PHONY: up-local up-staging up-prod stop restart clean-override

up-local:
	@echo "🚀 Preparing LOCAL environment..."
	cp docker-compose.local.override.yml docker-compose.override.yml
	cp backend/.env.sample backend/.env.dev
	cp .env.sample .env
	# docker-compose up -d

up-staging:
	@echo "🚀 Starting STAGING environment..."
	cp docker-compose.staging.override.yml docker-compose.override.yml
	cp backend/.env.sample backend/.env.staging
	cp .env.sample .env
	# docker-compose up -d

up-prod:
	@echo "🚀 Starting PRODUCTION environment..."
	cp docker-compose.production.override.yml docker-compose.override.yml
	cp backend/.env.sample backend/.env.production
	cp .env.sample .env
	# docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

clean-override:
	rm -f docker-compose.override.yml
	@echo "🧹 Removed docker-compose.override.yml"
