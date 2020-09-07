# dataefk-postgres-database

## Demo

[![asciicast](https://github.com/dataefk/database-fundamentals/blob/feature/postgres/assets/gifs/dataefk-postgres-database.gif)](https://asciinema.org/a/358218)

## Stack name

```bash
export COMPOSE_PROJECT_NAME=dataefk-postgres-database
```

## Create stack

Create and start containers. Option `-d` Detached mode: Run containers in the background.

```bash
docker-compose -f relational-databases/postgres/docker-compose.yml up -d
```

## Connect Database

```bash
docker-compose -f relational-databases/postgres/docker-compose.yml \
    exec dataefk-postgres-server psql \
    -h dataefk-postgres-server \
    -U dataefk
```

## Change Schema Search Path

```bash
SET search_path TO dataefk_adm;
```

## List Tables

```bash
\dt;
```
