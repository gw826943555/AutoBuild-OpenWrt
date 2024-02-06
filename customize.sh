#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
# 修改默认时区
sed -i "s/timezone='UTC'/timezone='CST-8'/g" ./package/base-files/files/bin/config_generate
# 修改默认地区
sed -i "/timezone/a\\\t\tset system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
# 开启TCP Fast Open
#sed -i '/memberships/a\\\tnet.ipv4.tcp_fastopen=3' ./package/base-files/files/etc/sysctl.d/10-default.conf
# 修改最大连接数
#sed -i 's/nf_conntrack_max=16384/nf_conntrack_max=65536/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf
# 开启WiFi
sed -i 's/radio${devidx}.disabled=1/radio${devidx}.disabled=0/g' ./package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 开启software flow offloading
sed -i '/^config defaults/a \\toption flow_offloading\t1' ./package/network/config/firewall/files/firewall.config
# 修改默认IP地址
sed -i 's/192.168.1.1/192.168.111.1/g' ./package/base-files/files/bin/config_generate