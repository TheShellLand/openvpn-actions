#!/bin/bash 

# installs openvpn connector

set -xe 

curl -O https://network-management-gw.openvpn.com/network-gate/api/v1/scripts/VWJ1bnR1IDIyLjA0/gateway/ubuntu_22_04.sh
chmod +x ubuntu_22_04.sh
