# Emby Fluent

## EN & CN

- [简体中文](README.md)
- [English](README-EN.md)

_Emby Fluent — 为 Emby 打造的现代化 UI 增强扩展，支持 Emby 4.8 / 4.9_

# ⚠️ 警告: 媒体库封面为原创设计, 未经授权请勿模仿使用

---

## 功能特性

### 🎠 首页 Banner 轮播

- 自动轮播最新影视 Backdrop（10 秒间隔）
- 克隆帧技术实现无缝无限循环
- 左右隐藏式导航按钮，悬浮显现，支持快速切换与边界防抖
- **智能筛选**：仅选取同时拥有 Backdrop + Logo 的高质量影视条目
- **高清图片**：`maxWidth: 3000` 确保高分辨率显示
- **容错处理**：自动移除加载失败的幻灯片，全部失败时优雅降级

### 🪟 毛玻璃媒体库标签

- 媒体库卡片底部毛玻璃标题条（`backdrop-filter: blur`）
- Flexbox 完全居中显示
- 三种显示模式可切换：`always` / `hover` / `none`

### 🎬 动画效果

- 媒体库卡片依次入场动画
- LOGO 淡入效果
- 卡片 hover 缩放（`scale(1.1)`）

### 🔤 精选字体栈

- **Plus Jakarta Sans** — 西文主字体（Google Fonts）
- **HarmonyOS Sans SC** — 中文主字体（预分片按需加载）
- **霞鹜文楷** — 中文衬线备选
- **CDN 智能回退**：全球用户走 jsDelivr，国内用户自动降级至 npmmirror

### 📐 布局优化

- 侧边栏默认收起，不占据页面空间
- 顶部导航栏透明渐变，融入 Banner
- 超细滚动条（0.3em）
- 兼容 Emby 4.8 / 4.9 的 Flex 布局差异

### 📦 双模部署

- Chrome 扩展版（Manifest V3）
- 服务端注入版

---

## 兼容性

| Emby 版本 | 状态 |
|-----------|------|
| 4.8.x     | ✅ 完全支持 |
| 4.9.x     | ✅ 完全支持 |

| 浏览器 | 最低版本 |
|--------|---------|
| Chrome / Edge | 88+ (Manifest V3) |
| 其他 Chromium 内核 | 88+ |

---

## 动画预览

<https://user-images.githubusercontent.com/22045978/568278832-14b2fe00-1367-403d-94ca-551fdc1a060d.mp4>

---

## 配置项

媒体库标题显示模式可在 `static/css/style.css` 顶部 `:root` 中切换：

```css
:root {
  --heicha-library-label-mode: always;  /* always | hover | none */
}
```

| 值       | 效果                            |
|----------|---------------------------------|
| `always` | 常驻半透明标签，hover 加亮（默认） |
| `hover`  | 仅鼠标悬浮时显示                 |
| `none`   | 完全隐藏                        |

---

## 使用方法

**两种方法，只需部署一种即可**

### 插件版

_需要用户装载插件（Chrome 88+ 支持 Manifest V3）_

1. 打开 Chrome 扩展设置 → 开启**开发者模式**
2. 点击**加载已解压的扩展程序**
3. 选择本项目源码目录即可

### 服务器版

_无需安装插件，直接部署至服务端，用户无缝使用_

```bash
# Docker 版 (如遇脚本更新, 重新执行即可)
# EmbyServer 为容器名, 如果你的容器名不是这个请改成正确的
docker exec EmbyServer /bin/sh -c 'cd /system/dashboard-ui && wget -O - https://tinyurl.com/2p97xcpd | sh'

# 参考教程(非官方): https://cangshui.net/5167.html
```

> **注意**：Docker 版需要能访问 GitHub 的网络环境

---

## 项目结构

```
Emby-Fluent/
├── manifest.json          # Chrome 扩展配置 (Manifest V3)
├── content/
│   └── main.js            # 核心逻辑: Banner 轮播、字体注入、DOM 适配
├── static/
│   ├── css/
│   │   └── style.css      # 全部样式: 布局、动画、毛玻璃、侧边栏
│   ├── js/
│   │   ├── jquery-3.6.0.min.js
│   │   ├── common-utils.js
│   │   └── md5.min.js
│   └── img/
│       └── icon.png
├── script.sh              # 服务端部署脚本
└── README.md
```

---

## TODO

- [ ] 封装为单 JS/CSS，供客户端直接使用
- [ ] 播放跳转第三方播放器功能
- [ ] 版本在线检测更新
- [ ] 提供定制 Docker 镜像懒人包（基于 GitHub Actions 自动构建）

---

## License

[MIT](LICENSE)
