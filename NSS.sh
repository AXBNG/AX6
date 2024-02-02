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

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 修正
rm -rf feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
rm -rf feeds/packages/utils/coremark
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/nss-packages/utils/mhz

svn export https://github.com/immortalwrt/luci/tree/master/modules/luci-base feeds/luci/modules/luci-base
svn export https://github.com/immortalwrt/luci/tree/master/modules/luci-mod-status feeds/luci/modules/luci-mod-status

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
