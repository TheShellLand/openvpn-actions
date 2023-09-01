#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install gpg curl

# Install the OpenVPN repository key used by the OpenVPN packages
curl -fsSL https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/openvpn-repo-pkg-keyring.gpg > /dev/null

# Add the OpenVPN repository
DISTRO=$(lsb_release -c | awk '{print $2}')
sudo curl -fsSL https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list -o /etc/apt/sources.list.d/openvpn3.list
sudo apt update

# Install OpenVPN Connector setup tool
sudo apt install python3-openvpn-connector-setup

# Enable IP forwarding
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sudo sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sudo sysctl -p

# Configure NAT
IF=$(ip route | grep -m 1 default | awk '{print $5}')
sudo iptables -t nat -A POSTROUTING -o $IF -j MASQUERADE
sudo ip6tables -t nat -A POSTROUTING -o $IF -j MASQUERADE
sudo DEBIAN_FRONTEND=noninteractive apt install -y iptables-persistent

# Run openvpn-connector-setup to import ovpn profile and connect to VPN.
# You will be asked to provide setup token, You can get it from the
# Linux Connector configuration page in CloudConnexa Portal
sudo openvpn-connector-setup
