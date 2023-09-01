#!/bin/bash 

set -ex

echo ${OPENVPN_SETUP_TOKEN}
# Run openvpn-connector-setup to import ovpn profile and connect to VPN.
# You will be asked to provide setup token, You can get it from the
# Linux Connector configuration page in CloudConnexa Portal
sudo openvpn-connector-setup

# sleep for 6 hours
sleep 21600
