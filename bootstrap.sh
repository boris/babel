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

sudo su - vagrant <<EOF
cd /home/vagrant
git clone https://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> .bash_profile
echo 'eval "$(rbenv init -)"' >> .bash_profile
git clone https://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build
rbenv install 2.6.5
rbenv global 2.6.5
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
gem install bundler
EOF

echo "Install"
cd ~/code
bundle install
bundle update

echo "Run migrations"
bundle exec rake db:migrate ENV=development
