#!/bin/bash 

set -ex

# Run openvpn-connector-setup to import ovpn profile and connect to VPN.
# You will be asked to provide setup token, You can get it from the
# Linux Connector configuration page in CloudConnexa Portal
sudo -E openvpn-connector-setup

sudo systemctl start system-openvpn3\x2dsession.slice
sudo systemctl status system-openvpn3\x2dsession.slice

tail -f /var/log/syslog /var/log/openvpn.log /var/log/messages | grep -i openvpn
