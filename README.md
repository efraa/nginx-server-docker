# Nginx Server for PHP Apps with MySQL

Docker running Nginx, PHP, Composer, MySQL and PHPMyAdmin to manage your DB.

___

## Install prerequisites

* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

Check if `docker-compose` is already installed by entering the following command : 

```sh
which docker-compose
```

## Run the application

1. Copy your entire App to the ``` app/ ``` directory.

    1.1 Make sure you have an ``` index.php ``` file in app/
    1.2 Make sure you have an ``` composer.json ``` file in app/

2. Start the application:
    Note: root of main directory ``` ./ ``` not in ``` ./app/ ```

    ```sh
    docker-compose up -d
    ```

    **Please wait this might take a several minutes...**

    ```sh
    docker-compose logs -f # Follow log output
    ```

    2.1 See logs of a specific container:

        ```sh
        docker logs <CONTAINER_NAME>
        ```
        2.1.1 Example: <MY_APP_SERVER> <MY_APP_MY_SQL_ADMIN>


3. Open your browser:

    This project use the following ports:

    | Server     | Port |
    |------------|------|
    | MySQL      | 8989 |
    | AdminDB    | 8040 |
    | App        | 8000 |

    ___

    * [http://localhost:8000](http://localhost:8000/) Your App
    * [http://localhost:8040](http://localhost:8040/) AdminDB

4. Stop and clear services

    ```sh
    docker-compose down -v
    ```
___

## Use Docker commands

### Installing package with composer

```sh
docker run --rm -v $(pwd)/web/app:/app composer require symfony/yaml
```

### Updating PHP dependencies with composer

```sh
docker run --rm -v $(pwd)/web/app:/app composer update
```

#### MySQL shell access

```sh
docker exec -it mysql bash
```

and

```sh
mysql -u "$MYSQL_ROOT_USER" -p "$MYSQL_ROOT_PASSWORD"
```

#### Creating a backup of all databases

```sh
mkdir -p data/dumps
```

```sh
source .env && docker exec $(docker-compose ps -q mysqldb) mysqldump --all-databases -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" > "data/dumps/db.sql"
```

#### Restoring a backup of all databases

```sh
source .env && docker exec -i $(docker-compose ps -q mysqldb) mysql -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" < "data/dumps/db.sql"
```

#### Creating a backup of single database

**`Notice:`** Replace "YOUR_DB_NAME" by your custom name.

```sh
source .env && docker exec $(docker-compose ps -q mysqldb) mysqldump -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" --databases YOUR_DB_NAME > "data/dumps/YOUR_DB_NAME_dump.sql"
```

#### Restoring a backup of single database

```sh
source .env && docker exec -i $(docker-compose ps -q mysqldb) mysql -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" < "data/dumps/YOUR_DB_NAME_dump.sql"
```