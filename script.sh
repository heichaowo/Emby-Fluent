#!/bin/bash

# Emby Fluent 服务端安装脚本
# 建议在 Emby web 目录下执行，或通过 docker exec 调用

set -e

# 1. 清理旧版目录及 index.html 中的旧注入标记
rm -rf emby-crx
rm -rf emby-fluent
sed -i '/emby-crx/d' index.html 2>/dev/null || true
sed -i '/emby-fluent/d' index.html 2>/dev/null || true

# 2. 下载文件
mkdir -p emby-fluent
wget -q https://raw.githubusercontent.com/heichaowo/Emby-Fluent/main/static/css/style.css -P emby-fluent/
wget -q https://raw.githubusercontent.com/heichaowo/Emby-Fluent/main/static/js/common-utils.js -P emby-fluent/
wget -q https://raw.githubusercontent.com/heichaowo/Emby-Fluent/main/static/js/jquery-3.6.0.min.js -P emby-fluent/
wget -q https://raw.githubusercontent.com/heichaowo/Emby-Fluent/main/static/js/md5.min.js -P emby-fluent/
wget -q https://raw.githubusercontent.com/heichaowo/Emby-Fluent/main/content/main.js -P emby-fluent/
echo "Files downloaded."

# 3. 检查 index.html 是否存在且非空
if [ ! -f index.html ] || [ ! -s index.html ]; then
    echo "Warning: index.html is missing or empty. Please ensure Emby has fully initialized before injecting."
    echo "Tip: Access Emby web UI once, then re-run this script."
    exit 1
fi

# 4. 注入
code='<link rel="stylesheet" id="theme-css" href="emby-fluent/style.css" type="text/css" media="all" /><script src="emby-fluent/common-utils.js"></script><script src="emby-fluent/jquery-3.6.0.min.js"></script><script src="emby-fluent/md5.min.js"></script><script src="emby-fluent/main.js"></script>'

if grep -q "emby-fluent" index.html; then
    echo "Already injected, skipping."
elif grep -q "</head>" index.html; then
    sed -i.bak "s|</head>|${code}</head>|" index.html
    echo "Emby Fluent injected successfully."
else
    echo "Error: </head> tag not found in index.html. Emby may not be fully initialized."
    exit 1
fi
