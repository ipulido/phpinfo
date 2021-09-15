#!/bin/sh

git clone https://github.com/ipulido/phpinfo
cd phpinfo
git checkout 2021-09-santander

docker image build \
--file ./Dockerfile \
--no-cache \
--tag local/phpinfo:test \
./

## $ docker container run --entrypoint /bin/sh --interactive --rm --tty local/phpinfo:test
## find / | grep /bin | wc -l
## which php

docker network create phpinfo
docker container run \
  --cpus '0.1' \
  --detach \
  --entrypoint /usr/bin/php \
  --env author=Ismael \
  --label app=phpinfo \
  --memory 100M \
  --name phpinfo \
  --network phpinfo \
  --publish 80:8080 \
  --read-only \
  --restart always \
  --user nobody \
  --volume ./src/:src/:ro \
  --workdir /app/ \
  local/phpinfo:test \
  -f /src/index.php \
  -S 0.0.0.0:8080 \
