# iStore OS 固件 | 定制的麻烦自行 fork 修改

![支持设备](https://img.shields.io/badge/支持设备:-blueviolet.svg?style=flat-square)  ![X86-64](https://img.shields.io/badge/X86-64-blue.svg?style=flat-square) ![X86-64EFI](https://img.shields.io/badge/X86-64EFI-blue.svg?style=flat-square) 
[![iStore使用文档](https://img.shields.io/badge/使用文档-iStore%20OS-brightgreen?style=flat-square)](https://doc.linkease.com/zh/guide/istoreos) [![最新固件下载](https://img.shields.io/github/v/release/draco-china/istoreos-rk35xx-actions?style=flat-square&label=最新固件下载)](../../releases/latest)


## 功能特性
| 内置插件                 | 状态 | 内置插件         | 状态 | 内置插件         | 状态 | 内置插件         | 状态 |
|:------------------------:|:----:|:----------------:|:----:|:----------------:|:----:|:----------------:|:----:|
| PassWall                 | ✅   | openclash                   | ✅   | MosDNS                 | ✅   | mwan3负载均衡                 | ✅   |
| HomeProxy                | ✅   | Nikki                       | ✅   | 锐捷认证                | ✅   | 支持OTA在线升级                | ✅  |

## 默认配置

- IP: `http://192.168.100.1` or `http://iStoreOS.lan/`
- 用户名: `root`
- 密码: `空`
- 如果设备只有一个网口，则此网口就是 `LAN` , 如果大于一个网口, 默认第一个网口是 `WAN` 口, 其它都是 `LAN`
- 如果要修改 `LAN` 口 `IP` , 首页有个内网设置，或者用命令 `quickstart` 修改

## 支持架构

### x86 架构

| 启动       | 包名称                                              |
| ---------- | --------------------------------------------------- |
| X86-64     | stoneos-x86-64-generic-squashfs-combined.img.gz    |
| X86-64-EFI | stoneos-x86-64-generic-squashfs-combined-efi.img.gz |

## 鸣谢

- [iStoreOS](https://github.com/istoreos/istoreos)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [ImmortalWrt](https://github.com/immortalwrt)
- [GitHub Actions](https://github.com/features/actions)
- [oppen321/iStoreOS-action](https://github.com/oppen321/iStoreOS-action)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=s71557/iStoreOS-Actions&type=Timeline)](https://www.star-history.com/#s71557/iStoreOS-Actions&Timeline)
