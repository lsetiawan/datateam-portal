# Docker setup

1. Conda install the datateam env file at `docker/environment.yml`.
2. Activate the `datateam` environment: `conda activate datateam`.
3. Build the docker images (make sure to run the following in the top of repo): `docker-compose -f ./docker/docker-compose.yml build`.
4. Bring up the portal and mysql: `docker-compose -f ./docker/docker-compose.yml up -d portal`.
5. For initial database setup, run migration: `docker exec -it docker_portal_1 bin/cake migrations migrate`.
6. Get into the db-loader container and run initial loading script.

    ```bash
    docker-compose -f ./docker/docker-compose.yml run db-loader bash
    conda activate datateam
    ./initial.sh
    ```
