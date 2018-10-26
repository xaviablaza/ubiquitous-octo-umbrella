#!/bin/sh
set +e
docker pull xaviablaza/xmr-stak
cd /home/xavi/ubiquitous-octo-umbrella && git reset --hard && git clean --force && git pull origin master
docker stop xmr-stak
nvidia-docker run --rm -u $(id -u):$(id -g) --name xmr-stak -v "$PWD":/mnt xaviablaza/xmr-stak --config config.txt --noCPU
