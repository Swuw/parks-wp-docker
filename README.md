# Test task (Parks)

Parks simple site with post about Polish national parks.

## Linux or MacOS with `make` file

### Getting started

1) Run script in root project directory `cp ./.env.develope ./.env`;
2) Run script in root project directory `cp ./app/wp-config-sample.php ./app/wp-config.php`;
3) Run script in root project directory `make build`;
4) Open in your browser http://localhost/.

### Web Application

##### Stopping and starting containers
- Stop: `make stop`;
- Start: `make start`;

## Windows, Linux or MacOS with docker

### Getting started

1) Rename the `./.env.develope` file to `./.env`;
2) Rename the `./app/wp-config-sample.php` file to `./app/wp-config.php`;
4) Run script in root project directory;
 - `docker-compose up -d`;
5) Open in your browser http://localhost/.

### Web Application

##### Stopping and starting containers
- Stop: `docker-compose stop` or `docker-compose stop` - additionally deletes the containers.
- Start: `docker-compose start` or `docker-compose start` - additionally creates a containers.