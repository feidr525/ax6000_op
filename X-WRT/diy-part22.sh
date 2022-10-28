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

# 修改ip 和wifi名字密码 
sed -i 's/192.168.15.1/192.168.1.253/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.15.1/192.168.1.253/g' package/feeds/luci/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js
sed -i 's/SSID=\${DISTRIB_ID}_\${SUBFIX}/SSID=openwrt/g' feeds/x/base-config-setting/files/uci.defaults
sed -i 's/SSID_PASSWD=88888888/SSID_PASSWD=password/g' feeds/x/base-config-setting/files/uci.defaults

# 取消隐藏的app
sed -i 's/-hidden//g' feeds/luci/applications/luci-app-opkg/root/usr/share/luci/menu.d/luci-app-opkg.json
sed -i 's/-hidden//g' feeds/x/luci-app-simplenetwork/root/usr/share/luci/menu.d/luci-base.json
sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-system/root/usr/share/luci/menu.d/luci-mod-system.json
sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json


#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile
#sed -i "s/.*PKG_VERSION:=.*/PKG_VERSION:=4.3.9_v1.2.14/" package/lean/qBittorrent-static/Makefile
# welcome test 

#删除相同名字的包或者不需要的包 #改grep 后面******  后面再增加包 got clone 或者 svn co 
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
find ./ | grep Makefile | grep argon | xargs rm -f

        
#增加mosdns
git clone https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns
git clone https://github.com/sbwml/v2ray-geodata.git package/v2ray-geodata
#增加alist
git clone https://github.com/sbwml/luci-app-alist package/alist
rm -rf feeds/packages/lang/golang
svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang

#增加argon主题
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-theme-argon package/luci/luci-theme-argon
#KMS
git clone https://github.com/cokebar/luci-app-vlmcsd.git package/luci/luci-app-vlmcsd
git clone https://github.com/cokebar/openwrt-vlmcsd.git package/luci/openwrt-vlmcsd
#DDNS-GO
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/luci/ddns-go

#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard package/luci/luci-app-wizard

#取消原主题luci-theme-bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
