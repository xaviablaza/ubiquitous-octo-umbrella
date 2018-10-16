#!/bin/sh
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 && \
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
sudo yum -y install docker-ce && \
sudo systemctl start docker && \
sudo systemctl enable docker && \
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux && \
sudo sh ./cuda_10.0.130_410.48_linux && \
rm ./cuda_10.0.130_410.48_linux && \
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.repo | sudo tee /etc/yum.repos.d/nvidia-docker.repo && \
sudo yum -y install nvidia-docker2 && \
sudo pkill -SIGHUP dockerd && \
touch ~/.profile && \
echo "nvidia-docker run --rm -it -d -u $(id -u):$(id -g) --name xmr-stak -v /home/cuadmin/ubiquitous-octo-umbrella:/mnt xaviablaza/xmr-stak --config config.txt --noCPU" << ~/.profile && \
reboot
