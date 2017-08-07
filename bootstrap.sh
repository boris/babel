#! /usr/bin/env bash
# Variables
DBHOST=localhost
DBNAME=babel_dev
DBUSER=dbuser
DBPASSWD=test123

apt-get update

echo -e "\n--- Install base packages ---\n"
apt-get install -y vim curl build-essential python-software-properties git libssl-dev libreadline-dev zlib1g-dev libmysqlclient-dev libsqlite3-dev nodejs nodejs-dev 2>&1

echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
apt-get install -y mysql-server mysql-client 2>&1

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"

sudo su - ubuntu <<EOF
cd /home/ubuntu
git clone https://github.com/sstephenson/rbenv.git /home/ubuntu/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/ubuntu/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git /home/ubuntu/.rbenv/plugins/ruby-build
EOF
