# Setup repositories
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm

sudo apt-add-repository ppa:yubico/stable

# Update dependencies
sudo apt-get update

# Install packages
sudo apt-get install tmux tmate vim vim-gtk git build-essential \
zsh rcm curl \
libssl-dev libreadline-dev zlib1g-dev libpq-dev \
apt-transport-https ca-certificates software-properties-common \
kubectl phantomjs libsodium-dev

sudo apt-get install pavucontrol xclip flameshot google-chrome-stable yubioath-desktop tilix gnome-shell-pomodoro krita

sudo apt install thunderbird kazam

# Install NVIDIA Drivers
https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux

# Setup zsh as login shell
chsh -s $(which zsh)

login then log out to see the changes

# Setup AJ's dotfiles
git clone https://github.com/iamarmanjon/dotfiles ~/dotfiles

env RCRC=$HOME/dotfiles/rcrc rcup

# Setup dotfile customizations
https://github.com/clvv/fasd

# Setup terminal and vim themes
https://github.com/chriskempson/base16-shell

https://github.com/cskeeters/base16-konsole

https://github.com/chriskempson/base16-vim#installation

https://github.com/thoughtbot/dotfiles

# Install Slack
sudo snap install slack --classic

# Install asdf
https://github.com/asdf-vm/asdf

# Install Hugo
snap install hugo

# Install yarn
https://yarnpkg.com/lang/en/docs/install/#debian-stable

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn

# Install Keybase
curl -O https://prerelease.keybase.io/keybase_amd64.deb

if you see an error about missing `libappindicator1`
from the next command, you can ignore it, as the
subsequent command corrects it

sudo dpkg -i keybase_amd64.deb

sudo apt-get install -f

run_keybase

# Install docker and docker-compose
https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

In step 4

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    edge"

https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user


