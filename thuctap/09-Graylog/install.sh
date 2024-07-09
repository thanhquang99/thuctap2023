#!/bin/bash
read -p "Enter Your IP: " IP
sudo apt update -y
sudo apt install curl wget apt-transport-https -y
sudo apt install openjdk-17-jre-headless -y

function install-elasticsearch {
	curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
	echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
	apt update
	apt install elasticsearch -y
	echo "cluster.name: graylog" >> /etc/elasticsearch/elasticsearch.yml
	echo "action.auto_create_index: false" >> /etc/elasticsearch/elasticsearch.yml
	echo "http.max_warning_header_count: 0" >> /etc/elasticsearch/elasticsearch.yml
	systemctl daemon-reload
	systemctl start elasticsearch
	systemctl enable elasticsearch 
}
function install-mongodb {
	curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
	sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-6.0.gpg
	echo "deb [ arch=amd64,arm64 signed=/etc/apt/trusted.gpg.d/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
	apt update
	apt install mongodb-org -y
	systemctl start mongod
	systemctl enable mongod
	systemctl status mongod
}
function install-graylog {
	wget https://packages.graylog2.org/repo/packages/graylog-5.2-repository_latest.deb
	dpkg -i graylog-5.2-repository_latest.deb
	apt-get update
	apt install graylog-server -y
	password_secret=$(pwgen -N 1 -s 96)
	root_password_sha2=$(echo -n thanhquang@123 | shasum -a 256)
	/usr/bin/perl -pi -e 's/^password_secret.*/password_secret=\$password_secret/' /etc/graylog/server/server.conf
	/usr/bin/perl -pi -e 's/^root_password_sha2.*/root_password_sha2=\$root_password_sha2/' /etc/graylog/server/server.conf
	echo "root_timezone = Asia/Ho_Chi_Minh" >> /etc/graylog/server/server.conf
	systemctl daemon-reload
	systemctl start graylog-server
	systemctl enable graylog-server
	systemctl status graylog-server
}
function install-nginx {
	apt install nginx
	openssl genrsa -out CA.key 2048
	openssl req -x509 -sha256 -new -nodes -days 3650 -key CA.key -out CA.pem
	openssl genrsa -out localhost.key 2048
    openssl req -new -key localhost.key -out localhost.csr
	sudo tee localhost.ext > /dev/null <<EOF
authorityKeyIdentifier = keyid,issuer
basicConstraints = CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = graylog.thanhquang.local
IP.1 = $IP
EOF
	openssl x509 -req -in localhost.csr -CA CA.pem -CAkey CA.key -CAcreateserial -days 365 -sha256 -extfile localhost.ext -out localhost.crt
	mkdir /etc/nginx/ssl-certificate
	mv localhost.crt localhost.key /etc/nginx/ssl-certificate
		sudo tee /etc/nginx/sites-available/graylog.conf > /dev/null <<EOF
server {
        listen 80;
        listen [::]:80;
        server_name $IP;
        return 301 https://$host$request_uri;
}

server {
        listen 443 ssl;
        listen [::]:443 ssl;
        server_name $IP;
        # root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        # SSL Configuration
        ssl_certificate     /etc/nginx/ssl-certificate/localhost.crt;
                ssl_certificate_key /etc/nginx/ssl-certificate/localhost.key;
        # Logs Locations
        access_log  /var/log/nginx/graylog_access.log;
        error_log  /var/log/nginx/graylog_error.log;
        location / {
                    proxy_set_header Host $http_host;
                    proxy_set_header X-Forwarded-Host $host;
                    proxy_set_header X-Forwarded-Server $host;
                    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                    proxy_set_header X-Graylog-Server-URL https://$server_name/;
                    proxy_pass       http://127.0.0.1:9000;
        }
}
EOF
    ln -s /etc/nginx/sites-available/graylog.conf /etc/nginx/sites-enabled/
    systemctl start nginx
    systemctl restart nginx
    systemctl enable nginx
}
install-elasticsearch
install-mongodb
install-graylog
install-nginx
