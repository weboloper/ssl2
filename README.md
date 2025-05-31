# Django Docker Boilerplate

This project is a **production-ready Django boilerplate** running on **Docker**, integrating PostgreSQL, Gunicorn, NGINX, and Let's Encrypt. It supports multiple environments: local, staging, and production.

## 🚀 Features

- PostgreSQL as the database service
- Django backend served with Gunicorn
- NGINX as a reverse proxy for static/media files
- Automated SSL with Let's Encrypt and Certbot
- Environment-specific configuration using `docker-compose.override.yml`
- Environment-based `.env` files
- Easy startup commands with `Makefile`

---

## 🧰 Setup Environment

Create the override and environment files for your desired environment:

```bash
make up-local     # Prepares local development (Certbot disabled)
make up-staging   # Prepares staging environment (Certbot enabled)
make up-prod      # Prepares production environment (Certbot enabled)
```

Alternatively, you can run setup environment manually directly:

```bash
# For staging:
cp .env.sample .env
cp docker-compose.staging.override.yml docker-compose.override.yml
cp backend/.env.sample backend/.env.staging

```

## 🔐 SSL Setup

Before running, make the script executable and run it:

```bash
chmod +x init.sh
./init.sh
```

## 📂 Project Structure

```bash
.
├── backend/ # Django project
│ └── .env.staging # Sample environment file
├── data/db/ # PostgreSQL persistent data
├── nginx/
│ ├── conf/ # NGINX configuration
│ ├── certbot/ # Certbot config and challenge path
│ └── html/ # Optional static HTML
├── docker-compose.yml
├── docker-compose.staging.override.yml
├── docker-compose.prod.override.yml
├── Makefile
└── init.sh # SSL and initial setup script
```

| Command                                                      | Description                                |
| ------------------------------------------------------------ | ------------------------------------------ |
| `make up-local`                                              | Prepares the local environment             |
| `make up-staging`                                            | Prepares the staging environment           |
| `make up-prod`                                               | Prepares the production environment        |
| `docker-compose down`                                        | Stops all running containers               |
| `docker exec -it backend sh`                                 | Opens a shell inside the backend container |
| `docker-compose exec backend python manage.py collectstatic` | Collects static files                      |
| `docker-compose logs -f`                                     | Follows logs for all services              |

📖 Reference

> This repository is accompanied by a [step-by-step guide on how to
> set up nginx and Let’s Encrypt with Docker](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

## 🐍 Cpanel Python App Setup

Follow these steps to initialize and configure your Django application:

1. **Setup Environment**
   Set DJANGO_ENV on Cpanel (dev, staging, or production)

2. **Initialize Git repository**
   Remove old passenger_wsgi and pull repository

```bash
rm passenger_wsgi.py
git init
git remote add origin <repository_url>
git pull origin main
```

3. **Enter To The Venv**
   Enter to the virtual environment.To enter to virtual environment, run the command

```bash
source /home/username/venv....
```

4. **Install Python Dependencies & Restart**
   Install dependencies and restart app

```bash
pip install -r requirements.txt
```

## 📂 Frontend Compose

```bash
docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.frontend.yml up -d
```
