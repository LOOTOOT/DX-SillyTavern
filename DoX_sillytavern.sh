#!/bin/bash

# 本脚本来自贴吧道行歌
# 此脚本用于自动设置和运行SillyTavern

# 更新包管理器和软件包
echo "更新软件包信息..."
apt update && apt upgrade -y

# 安装Git
echo "安装Git..."
pkg install git -y

# 克隆SillyTavern仓库
echo "克隆SillyTavern仓库..."
git clone https://github.com/SillyTavern/SillyTavern || { echo "无法克隆仓库"; exit 1; }

# 进入SillyTavern目录并安装node.js和依赖项
echo "安装node.js和依赖项..."
cd SillyTavern && pkg install nodejs -y && npm install || { echo "安装失败"; exit 1; }

# 运行酒馆
echo "运行酒馆..."
./start.sh || bash start.sh

echo "酒馆已经启动！"
echo "感谢使用，本脚本来自贴吧道行歌"
