#!/bin/bash

# 本脚本由贴吧道行歌提供 - DoX_sillytavern
# 此脚本用于自动安装和运行SillyTavern

set -e # 如果任何命令失败，则退出脚本

# 检查网络连接
echo "检查网络连接..."
ping -c 1 google.com > /dev/null 2>&1 || { echo "网络连接失败，请检查你的网络设置"; exit 1; }

# 检查dpkg是否需要配置
echo "检查是否存在dpkg配置问题..."
dpkg --configure -a

# 更新软件包信息
echo "更新软件包信息..."
apt update

# 升级所有软件包
echo "升级软件包..."
apt upgrade -y

# 清理可能存在的无用软件包
echo "清理无用软件包..."
apt autoclean
apt clean

# 检查Git是否已安装
if ! command -v git &> /dev/null; then
    echo "安装Git..."
    pkg install git -y
else
    echo "Git已安装，跳过此步骤."
fi

# 克隆SillyTavern仓库
REPO_URL="https://github.com/SillyTavern/SillyTavern.git"
echo "克隆SillyTavern仓库: $REPO_URL"
git clone $REPO_URL || { echo "无法克隆仓库"; exit 1; }

# 进入SillyTavern目录并安装node.js和依赖项
echo "进入SillyTavern目录..."
cd SillyTavern

echo "安装node.js和依赖项..."
if ! command -v node &> /dev/null; then
    pkg install nodejs -y
else
    echo "Node.js已安装，跳过此步骤."
fi
npm install || { echo "安装依赖失败"; exit 1; }

# 运行SillyTavern
echo "运行SillyTavern..."
./start.sh || bash start.sh

echo "SillyTavern已经启动！"
echo "感谢使用，本脚本由贴吧道行歌提供"
