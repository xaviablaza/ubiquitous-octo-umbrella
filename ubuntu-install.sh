#!/bin/sh

# Add repos
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm && \
sudo apt-add-repository ppa:yubico/stable && \
sudo add-apt-repository ppa:graphics-drivers/ppa && \
sudo apt-get update

# Install packages
sudo apt-get install tmux tmate vim vim-gtk git build-essential \
zsh rcm curl \
libssl-dev libreadline-dev zlib1g-dev libpq-dev \
apt-transport-https ca-certificates software-properties-common \
phantomjs libsodium-dev direnv

# Install software
sudo apt-get install pavucontrol xclip flameshot google-chrome-stable yubioath-desktop tilix krita
sudo apt install thunderbird kazam
# Install nvidia drivers
sudo apt install nvidia-390

# Use zsh in terminal
chsh -s $(which zsh)

# Install dotfiles
git clone https://github.com/xaviablaza/dotfiles ~/dotfiles
env RCRC=$HOME/dotfiles/rcrc rcup
rcup

# Install fasd
git clone https://github.com/clvv/fasd ~/fasd
cd ~/fasd
make install
cd ~

# Configure base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
mkdir ~/.vim
mkdir ~/.vim/colors
cd ~/.vim/colors
git clone git://github.com/chriskempson/base16-vim.git base16
cp base16/colors/*.vim .
cd ~

# Install Slack and Hugo
sudo snap install slack --classic
sudo snap install hugo

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# Install Keybase
curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase

# Install Docker
sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install CUDA and cleanup afterwards
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux && \
sudo sh ./cuda_10.0.130_410.48_linux && \
rm ./cuda_10.0.130_410.48_linux

# Install nvidia-docker2
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

sudo apt-get upgrade
