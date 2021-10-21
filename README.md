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
Instrucciones para clonar la imagen
```
git clone https://github.com/ipulido/phpinfo
cd phpinfo
git checkout santander
```
Instrucciones para construir la imagen docker
```
git checkout santander
docker build --file Dockerfile --tag ipulido/phpinfo:santander .
```
Instrucciones para construir la imagen docker optimizada
```
git pull
docker build --file Dockerfile-optimizado --tag ipulido/phpinfo:santander .
docker push ipulido/phpinfo:santander
```
Instrucciones para ejecutar el contenedor
```
docker run -d --entrypoint /usr/bin/php --name phpinfo -p 8080:8080 --restart always -v ${PWD}/srv/index.php:/pepito.php:ro ipulido/phpinfo:santander -f src/index.php -S 0.0.0.0:8080
```
Instrucciones para desplegar la aplicación en swarm
```
docker stack deploy -c docker-compose.yaml phpinfo
```
