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

docker network create phpinfo
docker container run \
  --detach \
  --name phpinfo \
  --network phpinfo \
  --read-only \
  --restart always \
  --user nobody \
  --volume ./src/:src/:ro \
  --workdir /app/ \
  local/phpinfo:test \
