#!/bin/bash
apt update
apt install wget unzip apache2 -y
systemctl start apache2
systemctl enable apache2
wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip -o 2134_gotto_job.zip
cp -r 2134_gotto_job/* /var/www/html/
systemctl restart apache2
