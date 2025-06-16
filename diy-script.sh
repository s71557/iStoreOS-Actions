#!/bin/bash

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# 更新 golang 1.24 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# 必要的库
git clone --depth=1 -b main https://github.com/linkease/istore-packages package/istore-packages
git clone --depth=1 -b dev https://github.com/jjm2473/luci-app-diskman package/diskman
git clone --depth=1 -b dev6 https://github.com/jjm2473/OpenAppFilter package/oaf
git clone --depth=1 -b master https://github.com/linkease/nas-packages package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci package/nas-packages-luci
git clone --depth=1 -b main https://github.com/jjm2473/openwrt-apps package/openwrt-apps

# 移除要替换的包
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
rm -rf package/diy/luci-app-ota

# 科学上网插件
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-nikki package/nikki
git clone https://github.com/sbwml/openwrt_helloworld package/helloworld

#OTA
git_sparse_clone main https://github.com/s71557/istoreos-ota luci-app-ota
git_sparse_clone main https://github.com/zijieKwok/github-ota fw_download_tool
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/luci-app-mentohust package/mentohust

### 个性化设置
sed -i 's/iStoreOS/StoneOS/' package/istoreos-files/files/etc/board.d/10_system
sed -i 's/192.168.100.1/192.168.100.1/' package/istoreos-files/Makefile
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='StoneOS-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Stone'/g" package/base-files/files/etc/openwrt_release

# TTYD
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# 更换默认背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg feeds/third/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# iStoreOS-settings
git clone --depth=1 -b main https://github.com/s71557/istoreos-settings package/default-settings

# 更新Feeds
./scripts/feeds update -a
./scripts/feeds install -a
