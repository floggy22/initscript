Self sign:

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt


openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048


https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309
https://dev.to/benjaminblack/obtaining-an-elliptic-curve-dsa-certificate-with-lets-encrypt-51bc

https://blog.heckel.io/2018/08/05/issuing-lets-encrypt-certificates-for-65000-internal-servers/

https://hub.docker.com/r/adferrand/dnsrobocert



