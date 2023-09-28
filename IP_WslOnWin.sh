#!/bin/bash

# 获取 WSL2 IP 地址
ip_address=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# 显示 IP 地址
echo "WSL2 IP Address: $ip_address"

# 如果您想在 Windows 中打开一个网页，例如 Jupyter Notebook，您可以添加以下行
# /mnt/c/Windows/System32/cmd.exe /c "start http://$ip_address:8888"
