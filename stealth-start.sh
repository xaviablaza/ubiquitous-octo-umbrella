#!/bin/sh
nvidia-docker run --rm -d -it -u $(id -u):$(id -g) --name xmr-stak -v "$PWD":/mnt xaviablaza/xmr-stak --config config.txt --noCPU
