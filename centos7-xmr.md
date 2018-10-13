# CentOS 7 Mining Operation

[Verify you have a CUDA-enabled GPU](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#verify-you-have-cuda-enabled-system)
```
sudo yum install pciutils
lspci | grep -i nvidia
```

[Install Docker](https://docs.docker.com/install/linux/docker-ce/centos/#install-using-the-repository)
```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo systemctl start docker
sudo docker run hello-world

sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
logout
```

[Install nvidia-docker](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0))

[Follow this, and run the commands below after:](http://www.advancedclustering.com/act_kb/installing-nvidia-drivers-rhel-centos-7/)
```
Download the NVIDIA driver and CUDA
sudo yum install wget
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/390.87/NVIDIA-Linux-x86_64-390.87.run
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux

Install nvidia-docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.repo | \
  sudo tee /etc/yum.repos.d/nvidia-docker.repo
sudo yum -y install nvidia-docker2
sudo pkill -SIGHUP dockerd
```

Run this in the /xmr-stak folder:

sudo nvidia-docker run --rm -d -it -u $(id -u):$(id -g) --name xmr-stak -v "$PWD":/mnt xaviablaza/xmr-stak --config config.txt --noCPU

monerohash.com:2222 in pools.txt, then add wallet address: 4BKmXgzLJueVgGxBgRjNpzbNUVwyLSQs5EMTy83AT2xHbS9k6zWu2rUJ1yfxbgnorAZFYjsKRfC9WYTBJtqrRSxZPQfmmJ1