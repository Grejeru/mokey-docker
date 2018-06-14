# SelfServ Docker infrastructure

This project was created to move old mokey application to Docker environment.

## Content

### docker-compose configurations

There are test (local) configuration stored in docker-compose.test.yml file and production one stored in docker-compose.yml file.

To manually start **test environment**:
1. download repository
2. create db directory inside
3. run command (will spawn environment without detaching, so all logs will be visible on console)

```bash
# docker-compose -f docker-compose.test.yml up --build
```

**Production** environment can be started via command:

```bash
# docker-compose up -d
```

### List of containers:

```bash
[root@Asgaard mokey-docker]# docker-compose ps
     Name                   Command               State    Ports
------------------------------------------------------------------
selfserv-db      docker-entrypoint.sh mysqld      Up      3306/tcp
selfserv-mokey   /start.sh                        Up      8080/tcp
selfserv-nginx   nginx -g daemon off;             Up
selfserv-redis   docker-entrypoint.sh redis ...   Up      6379/tcp
[root@Asgaard mokey-docker]#
```

 * **selfserv-db** is mysql database container from image ```mariadb```
 * **selfserv-redis** is redis container from image ```redis:alpine```
 * **selfserv-nginx** is proxy/static files container from image ```nginx:alpine``` with own Dockerfile configuration stored in ```nginx/Dockerfile```
 * **selfserv-mokey** is application docker with mokey daemon running based on ```CentOS 7``` image with own Dockerfile configuration stored in ```mokey/Dockerfile```

## Testing

Adjust below files with proper informations:

```bash
mokey-docker
├── README.md
├── db
│   └── delete.me
├── docker-compose.test.yml
├── docker-compose.yml
├── mokey
│   ├── Dockerfile
│   ├── mokey.yaml
│   └── start.sh
└── nginx
    ├── Dockerfile
    ├── mokey.conf
    ├── nginx.conf
    ├── proxy_params.conf
    └── ssl_params.conf
```

```bash
/docker-compose.yml - line 43 with proper path for db volume data location
/mokey/mokey.yaml - proper configuration with auth_key, enc_key, ipahost, smtp_*, email_*
/mokey/start.sh - ipa enrollment command with ipa data
/nginx/mokey.conf - proper mokey domain
```
