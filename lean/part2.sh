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
#安装argon主题、argon config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git openwrt/package/feeds/luci/luci-theme-argon-18.06
rm -rf openwrt/package/feeds/luci/applications/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config openwrt/package/feeds/luci/applications/luci-app-argon-config

#修改TTYD自动登录
sed -i 's/login/login -f root/g' openwrt/feeds/packages/utils/ttyd/files/ttyd.config

#替换banner
rm -rf openwrt/package/base-files/files/etc/banner
cp /banner openwrt/package/base-files/files/etc/banner

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf

#4.默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' openwrt/feeds/luci/collections/luci/Makefile
