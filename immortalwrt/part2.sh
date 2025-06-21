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
sed -i 's/login/login -f root/g' feeds/packages/utils/ttyd/files/ttyd.config
#替换banner
rm -rf package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/631894570/small-package/main/.github/diy/banner -O package/base-files/files/etc/banner
sed -i 's/2020-01-01/'`date +%Y-%m-%d`'/g' package/base-files/files/etc/banner
#cp /mnt/f/openwrt_build/banner package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/631894570/small-package/main/.github/diy/30-sysinfo.sh -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh
sed -i '3d' package/base-files/files/etc/profile
sed -i '3i\\[ -f \/etc\/banner \] && cat \/etc\/banner | lolcat' package/base-files/files/etc/profile
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd
#修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-design/g' feeds/luci/collections/luci/Makefile

#rm -rf feeds/luci/applications/luci-app-homeproxy
