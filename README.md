# astro-dock

AstroJS running in Docker, for development and production environment. No need to install nodejs and npm, everything is managed in containers.

```shell
# Dev environment
$ ./dev.sh
# or
$ docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build

# Production
$ docker compose -f docker-compose.yml up --build
```
