# docker-cronkeep
Port of the awesome web based cron manager <a href="https://github.com/cronkeep/cronkeep" target="_blank">CronKeep</a> as a Docker container

# Setup A: Global Composer
The initial setup script:
```
composer create-project cronkeep/cronkeep --keep-vcs -s dev ./www
```
Be sure to substitute `./www` with your desired path for installing cronkeep. Then, follow the rest of the setup instructions here: https://github.com/cronkeep/cronkeep

# Setup B: Local Composer
```
curl -sS https://getcomposer.org/installer | php &&\
php composer.phar create-project cronkeep/cronkeep --keep-vcs -s dev /local/path/to/cronkeep
```
Then, follow the rest of the setup instructions here: https://github.com/cronkeep/cronkeep
