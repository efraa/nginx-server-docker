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

    1.1 Make sure you have an ``` index.php ``` file in app/ <br />
    1.2 Make sure you have an ``` composer.json ``` file in app/ 

2. Start the application: <br />
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
    2.1 Example: ``` <MY_APP_SERVER> <MY_APP_MY_SQL_ADMIN> ```


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

## Docker commands

### Installing package with composer

```sh
docker run --rm -v $(pwd)/app:/app composer require symfony/yaml
```

### Updating PHP dependencies with composer

```sh
docker run --rm -v $(pwd)/app:/app composer update
```

#### Creating a backup of single database

```sh
run/backup.sh
```

#### Restoring a backup of single database

```sh
run/restore.sh
```