#!/bin/bash
url=/usr/local/nginx/conf/nginx.conf
yum -y install gcc openssl-devel pcre-devel
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure --with-http_ssl_module
make && make install
cd 
yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-mysql php-fpm
sed -i '65,71 s/#//' $url
sed -i '70 s/fastcgi_params/fastcgi.conf/' $url
sed -i '/fastcgi_param/#fastcgi_param/' $url
systemctl stop httpd
systemctl start mariadb
systemctl start php-fpm
/usr/local/nginx/sbin/nginx -s stop
/usr/local/nginx/sbin/nginx
