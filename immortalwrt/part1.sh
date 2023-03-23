#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add kenzo feed source
#sed -i '$a src-git-full kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

sed -i '$a src-git-full design https://github.com/gngpp/luci-theme-design' feeds.conf.default
sed -i '$a src-git-full designconfig https://github.com/gngpp/luci-app-design-config' feeds.conf.default

# 软件中心istore
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
svn co https://github.com/linkease/istore/trunk/luci package/istore
svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
rm -rf package/istore/.svn
sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci-app-store/Makefile
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/istore/luci-app-store/luasrc/controller/store.lua
