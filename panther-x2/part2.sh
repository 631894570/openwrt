#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#修改TTYD自动登录
sed -i 's/login/login -f root/g' openwrt/feeds/packages/utils/ttyd/files/ttyd.config

#替换banner
rm -rf openwrt/package/base-files/files/etc/banner
curl -o openwrt/package/base-files/files/etc/banner https://raw.githubusercontent.com/631894570/openwrt/main/banner

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.10/g' openwrt/package/base-files/files/bin/config_generate

# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#4.默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-design/g' openwrt/feeds/luci/collections/luci/Makefile
