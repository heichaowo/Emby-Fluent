#!/bin/bash

# Emby Fluent 服务端安装脚本
# 在 Emby 的 web 目录下执行此脚本

rm -rf emby-fluent
mkdir -p emby-fluent
wget https://raw.githubusercontent.com/heichaowo/emby-fluent/main/static/css/style.css -P emby-fluent/
wget https://raw.githubusercontent.com/heichaowo/emby-fluent/main/static/js/common-utils.js -P emby-fluent/
wget https://raw.githubusercontent.com/heichaowo/emby-fluent/main/static/js/jquery-3.6.0.min.js -P emby-fluent/
wget https://raw.githubusercontent.com/heichaowo/emby-fluent/main/static/js/md5.min.js -P emby-fluent/
wget https://raw.githubusercontent.com/heichaowo/emby-fluent/main/content/main.js -P emby-fluent/

# 检查 index.html 是否已注入
if grep -q "emby-fluent" index.html; then
    echo "Index.html already contains emby-fluent, skipping insertion."
else
    # 定义要插入的代码
    code='<link rel="stylesheet" id="theme-css" href="emby-fluent/style.css" type="text/css" media="all" />\n<script src="emby-fluent/common-utils.js"></script>\n<script src="emby-fluent/jquery-3.6.0.min.js"></script>\n<script src="emby-fluent/md5.min.js"></script>\n<script src="emby-fluent/main.js"></script>'

    # 在 </head> 之前插入代码
    new_content=$(echo -e "${content/<\/head>/$code<\/head>}")

    # 将新内容写入 index.html
    echo -e "$new_content" > index.html
    echo "Emby Fluent injected successfully."
fi