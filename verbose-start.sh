#!/bin/sh
sudo nvidia-docker run --rm -it -u $(id -u):$(id -g) --name xmr-stak -v "$PWD":/mnt xaviablaza/xmr-stak --config config.txt
