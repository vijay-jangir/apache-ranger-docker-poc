docker network create ranger_env
ls ./docker-composes/*/docker-compose.yml|xargs -I {} docker compose -f {} up -d --build