Self sign fast way:

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048


Test Docker nginx:
docker run --name some-nginx1 -v /root/web:/usr/share/nginx/html:ro --rm -p 7778:80 nginx

own docker registry:
Tag or build
docker build -t gitlab.labor.lan:5050/root/test2 .
docker tag [image_name] gitlab.labor.lan:5050/root/test2/[name]

push
docker push gitlab.labor.lan:5050/root/test2/[name]


Gitlab certifactes to config/ssl. name same as the domain. before start to prevent letencrypt
CA to config/trusted-certs
#Create key
openssl genrsa -out gitlab.labor.lan.key 2048

#Create certificate (for wildcard *.labor.lan as fqdn)
openssl req -new -key gitlab.labor.lan.key -out gitlab.labor.lan.csr

#Sign certificate with ca
openssl x509 -req -in gitlab.labor.lan.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out gitlab.labor.lan.crt


install CA:
sudo cp ca.crt /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates

Sources: 
install ca:
https://askubuntu.com/questions/73287/how-do-i-install-a-root-certificate

https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309
https://gist.github.com/Soarez/9688998
https://dev.to/benjaminblack/obtaining-an-elliptic-curve-dsa-certificate-with-lets-encrypt-51bc
https://blog.heckel.io/2018/08/05/issuing-lets-encrypt-certificates-for-65000-internal-servers/

Testtool:
https://github.com/drwetter/testssl.sh

