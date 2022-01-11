# Trackle

`Trackle` is a results tracker and database for [Wordle](https://www.powerlanguage.co.uk/wordle/)

## Requirements

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-   PHP 8.0+
-   [Composer](https://getcomposer.org/)
-   [MySQL](https://www.mysql.com/)

**PHP:** Install php8.0 minimum, with these extensions:

- bcmath
- curl
- dom
- gd
- gmp
- iconv
- intl
- json
- mbstring
- mysqli
- opcache
- pdo_mysql
- redis
- sodium
- xml
- zip

Trackle **must** be run over HTTPS - you'll be unable to login otherwise!

## Installation

Clone the repo and run `composer` - as it's a private repo, I recommend cloning it with the [GitHub CLI](https://cli.github.com/).
```shell
cd /var/www
gh repo clone charliewilson/trackle
cd trackle
composer install
```
Run the install.sql script to add the admin user and some sample content:
```shell
mysql -uroot -p < install.sql
```
Add your MySQL host/credentials to example.env:
```dotenv
DB_HOST="localhost"            <-- change this if you're not running a local MySQL server
DB_USER="MYSQL_USERNAME"       <-- the mysql username (i.e. 'root')
DB_PASS="MYSQL_PASSWORD"       <-- mysql password
PRODUCTION="false"

TRACKLE_DB="trackle"              <-- DON'T change this if you ran the DB setup with install.sql!
```
Move/rename the example .env file
```shell
mv example.env ../.env
```
You're done! Assuming you've setup a vhost in Apache for the `/var/www/trackle` document root, visit it in your web
browser and login with the username/password: `charlie/test`
