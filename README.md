# phpinfo

```
git clone https://github.com/ipulido/phpinfo
cd phpinfo
git checkout main
```
```
php -f src/index.php -S 0.0.0.0:8080
```
```
curl localhost:8080/src/index.php
```
Instrucciones para construir la imagen docker
```
git checkout santander
docker build --file Dockerfile --tag ipulido/phpinfo:santander .
```
