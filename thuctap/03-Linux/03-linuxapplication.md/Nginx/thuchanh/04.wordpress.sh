#!/bin/bash

function get_distribution {
    if [ -e /etc/os-release ]; then
        source /etc/os-release
        DISTRIBUTION=$ID
        VERSION=$VERSION_ID
    elif [ -e /etc/lsb-release ]; then
        source /etc/lsb-release
        DISTRIBUTION=$DISTRIB_ID
        VERSION=$DISTRIB_RELEASE
    fi
}

function apache_centos {
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    firewall-cmd --add-service=http
    firewall-cmd --add-service=https
    firewall-cmd --reload
}

function apache_ubuntu {
    apt install -y apache2
    systemctl start apache2
    systemctl enable apache2
    ufw allow apache2
}

function mysql_setup {
    if [ "$DISTRIBUTION" == "centos" ]; then
        sudo yum install mariadb-server mariadb -y
        systemctl start mariadb
        systemctl enable mariadb
    elif [ "$DISTRIBUTION" == "ubuntu" ]; then
        apt -y install mariadb-server
        systemctl start mariadb
        systemctl enable mariadb
    fi

    # Secure MariaDB installation (set root password, remove anonymous users, etc.)
cat << EOF | mysql -uroot
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'Khuongquang99' WITH GRANT OPTION ;FLUSH PRIVILEGES; 
EOF

mysql -u root -pKhuongquang99<<EOF 
CREATE DATABASE $NEW_DB_NAME;
CREATE USER $NEW_USER@localhost IDENTIFIED BY '$NEW_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $NEW_DB_NAME.* TO $NEW_USER@localhost IDENTIFIED BY '$NEW_USER_PASSWORD';
FLUSH PRIVILEGES;
exit
EOF
    echo "User $NEW_USER and database $NEW_DB_NAME created successfully."
}

function php73_centos7 {
    yum install epel-release -y
    yum update epel-release -y
    yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
    yum -y install yum-utils
    yum-config-manager --enable remi-php73
    yum -y install php php-opcache php-mysql
}

function php72_centos8 {
    yum install -y php php-mysqlnd php-fpm php-json
}

function php73_ubuntu {
    apt install php php-mysql -y
}

function wordpress_setup {
    if [ "$DISTRIBUTION" == "centos" ]; then
        yum install wget -y
    elif [ "$DISTRIBUTION" == "ubuntu" ]; then
        apt install -y wget
    fi

    cd /tmp && wget http://wordpress.org/latest.tar.gz
    tar xvfz latest.tar.gz
    cp -R wordpress/* /var/www/thanhquang.com/html
    cp /var/www/thanhquang.com/html/wp-config-sample.php /var/www/thanhquang.com/html/wp-config.php
    sed -i "s/username_here/$NEW_USER/g" /var/www/thanhquang.com/html/wp-config.php
    sed -i "s/database_name_here/$NEW_DB_NAME/g" /var/www/thanhquang.com/html/wp-config.php
    sed -i "s/password_here/$NEW_USER_PASSWORD/g" /var/www/thanhquang.com/html/wp-config.php
}

function apache_conf_centos {
    mkdir -p /var/www/thanhquang.com/html
    mkdir -p /var/www/thanhquang.com/log
    mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled
    echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
    touch /etc/httpd/sites-available/thanhquang.com.conf
    CONFIG_STRING="
<VirtualHost *:80>
    ServerName www.thanhquang.com
    ServerAlias thanhquang.com
    DocumentRoot /var/www/thanhquang.com/html
</VirtualHost>
"
    echo "$CONFIG_STRING" >> /etc/httpd/sites-available/thanhquang.com.conf
    ln -s /etc/httpd/sites-available/thanhquang.com.conf /etc/httpd/sites-enabled/thanhquang.com.conf
}

function apache_conf_ubuntu {
    mkdir -p /var/www/thanhquang.com/html
    mkdir -p /var/www/thanhquang.com/log
    touch /etc/apache2/sites-available/thanhquang.com.conf
    CONFIG_STRING="
<VirtualHost *:80>
    ServerName www.thanhquang.com
    ServerAlias thanhquang.com
    DocumentRoot /var/www/thanhquang.com/html
</VirtualHost>
"
    echo "$CONFIG_STRING" >> /etc/apache2/sites-available/thanhquang.com.conf
    ln -s /etc/apache2/sites-available/thanhquang.com.conf /etc/apache2/sites-enabled/thanhquang.com.conf
}

get_distribution
echo "Nhập tên người dùng mới cho MySQL:"
read NEW_USER
echo "Nhập mật khẩu:"
read NEW_USER_PASSWORD
echo "Nhập tên cơ sở dữ liệu mới:"
read NEW_DB_NAME

if [ "$DISTRIBUTION" == "centos" ] && [ "$VERSION" == "7" ]; then
    apache_centos
    mysql_setup
    php73_centos7
    apache_conf_centos
    wordpress_setup
    systemctl restart httpd
    chmod -R 755 /var/www/*
    chown -R apache:apache /var/www/*
elif [ "$DISTRIBUTION" == "centos" ] && [ "$VERSION" == "8" ]; then 
    apache_centos
    mysql_setup
    php72_centos8
    apache_conf_centos
    wordpress_setup
    systemctl restart httpd
    chmod -R 755 /var/www/*
    chown -R apache:apache /var/www/*
elif [ "$DISTRIBUTION" == "ubuntu" ]; then
    apache_ubuntu
    mysql_setup
    php73_ubuntu
    apache_conf_ubuntu
    wordpress_setup
    systemctl restart apache2
    chmod -R 755 /var/www/*
    chown -R www-data:www-data /var/www/*
fi
