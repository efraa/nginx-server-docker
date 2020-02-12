# Nginx Server for PHP Apps with MySQL 🚀

Nginx server running with Docker for PHP applications. <br />
**With:**

* Composer
* MySQL
* PHPMyAdmin
* NGNX PROXY

### Install 📌
***

* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Getting Started 📌
***

1. Clone
2. Move to -> ``` cd ${APP_NAME} ```
3. Copy ``` .example.env ``` to ``` .env ```

**NOTICE:** Update the values ​​of the variables in ``` .env ```

### Env vars 📌
***

* ``` APP_NAME ``` :: Name of your application. **NOTICE:** Please use uppercase and underscores.
* ``` NGINX_HOST ``` :: Route where your application will live. _example_ :: ``` myapp.local ```
* ``` DB_PASSWORD ``` :: Database pass.
* ``` DB_USER ``` :: Database user.
* ``` DB_NAME ``` :: The database name used by the application.
* ``` DB_HOST ``` :: Name of the service where MySQL runs. _default_ :: ``` db ```
* ``` PHP_VERSION ``` :: PHP version
* ``` MYSQL_VERSION ``` :: MySQL version

### Edit hosts file 📌

You must add the route "${NGINX_HOST}" where your application lives to the hosts file located at: <br />

``` C:\Windows\System32\drivers\etc\hosts ```

**NOTICE:** Add your route and add another version with the prefix ``` db. ```

**Warning:** Just edit the part of the ``` myapp.local || ${NGINX_HOST} ``` route

_Examples_

```sh 
127.0.0.1 ${NGINX_HOST}
127.0.0.1 db.${NGINX_HOST}
```

```sh 
127.0.0.1 myapp.local
127.0.0.1 db.myapp.local
```

### Run the application ⚙️
***

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

    * [http://${NGINX_HOST}](http://${NGINX_HOST}) Your App
    * [http://db.${NGINX_HOST}](http://db.${NGINX_HOST}) AdminDB:: Manage your database.

4. Stop and clear services

    ```sh
    docker-compose down -v
    ```
___

## Scripts

#### Creating a backup of single database

```sh
run/backup.sh
```

#### Restoring a backup of single database

```sh
run/restore.sh
```