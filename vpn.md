# VPNing the network

## Setup DigitalOcean to run an ipsec vpn server
https://github.com/hwdsl2/docker-ipsec-vpn-server

## Install this on computers that will be on the network
https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md#linux-vpn-clients

You could also just have a 2-computer VPN, then somehow get the IPs of the other computers on its own network.
You can then run stuff like `ansible-playbook` to set up things like a Kubernetes cluster.
