#!/bin/bash

# 本脚本来自贴吧道行歌 - DaoX_SillyTavern
# 此脚本用于自动设置和运行SillyTavern

echo "请确保软件为最新版并且已连接VPN"

# 检查并修复任何dpkg中断问题
dpkg --configure -a

# 更新软件包信息
echo "更新软件包信息..."
apt-get update

# 升级所有软件包
echo "升级软件包..."
apt-get upgrade -y

# 清理可能存在的无用软件包
echo "清理无用软件包..."
apt-get clean
apt-get autoclean

# 安装Git
echo "安装Git..."
pkg install git -y

# 克隆SillyTavern仓库
echo "克隆SillyTavern仓库..."
git clone https://github.com/LOOTOOT/DoX_sillytavern || { echo "无法克隆仓库"; exit 1; }

# 进入SillyTavern目录并安装node.js和依赖项
echo "安装node.js和依赖项..."
cd SillyTavern
pkg install nodejs -y
npm install || { echo "安装失败"; exit 1; }

# 运行酒馆
echo "运行酒馆..."
./start.sh || bash start.sh

echo "酒馆已经启动！"
echo "感谢使用，本脚本来自贴吧道行歌"
