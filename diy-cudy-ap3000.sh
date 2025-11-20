#!/bin/bash
#
# DIY script for Cudy AP3000 (Mesh Agent)
# Based on padavanonly immortalwrt-mt798x configuration
#
# This is free software, licensed under the MIT License.
#

# Modify default IP (optional - 避免與主路由衝突)
# 建議設為不同網段或使用 DHCP
#sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Cudy-AP3000-Mesh-Agent/g' package/base-files/files/bin/config_generate

# EasyMesh 防火牆規則說明：
# EasyMesh Agent 通過 LAN 側（有線或無線）連接到 Controller
# OpenWrt 默認 LAN → LAN 策略為 ACCEPT，因此通常不需要額外規則
# 標準部署（Controller 和 Agent 在同一網段）不需要以下規則

# 如果您的網絡拓撲特殊（例如跨 VLAN），請取消以下註釋：
# cat >> package/network/config/firewall/files/firewall.config <<EOF
# # Allow mDNS for EasyMesh device discovery
# config rule
#         option name 'Allow-mDNS-Agent'
#         option src 'lan'
#         option dest_port '5353'
#         option proto 'udp'
#         option target 'ACCEPT'
#         option family 'ipv4'
# EOF
