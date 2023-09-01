#!/bin/bash 

set -ex

# Run openvpn-connector-setup to import ovpn profile and connect to VPN.
# You will be asked to provide setup token, You can get it from the
# Linux Connector configuration page in CloudConnexa Portal
sudo -E openvpn-connector-setup

# sleep for 6 hours
sleep 21600
