# Emby Fluent

## EN & CN

- [简体中文](README.md)
- [English](README-EN.md)

_Emby Fluent — A modern UI enhancement extension for Emby, supporting Emby 4.8 / 4.9_

# ⚠️ Warning: Media library covers are original designs. Do not copy or use without authorization.

---

## Features

### 🎠 Homepage Banner Carousel

- Auto-rotating latest media backdrops (10s interval)
- Clone-frame technique for seamless infinite looping
- Hidden prev/next navigation buttons, visible on hover with click debounce
- **Smart Filtering**: Only selects items with both Backdrop + Logo for high-quality display
- **HD Images**: `maxWidth: 3000` ensures high-resolution rendering
- **Error Handling**: Auto-removes failed slides; graceful degradation when all fail

### 🪟 Glassmorphism Library Labels

- Frosted glass title bar at the bottom of media library cards (`backdrop-filter: blur`)
- Flexbox-centered text alignment
- Three display modes: `always` / `hover` / `none`

### 🎬 Animations

- Staggered card entrance animations
- Logo fade-in effects
- Card hover zoom (`scale(1.1)`)

### 🔤 Curated Font Stack

- **Plus Jakarta Sans** — Latin primary font (Google Fonts)
- **HarmonyOS Sans SC** — CJK primary font (pre-split, on-demand loading)
- **LXGW WenKai** — CJK serif alternative
- **Smart CDN Fallback**: Global users via jsDelivr, China users auto-fallback to npmmirror

### 📐 Layout Optimizations

- Sidebar collapsed by default, doesn't occupy page space
- Transparent gradient top navigation bar, blending into the banner
- Ultra-thin scrollbar (0.3em)
- Compatible with Emby 4.8 / 4.9 Flex layout differences

### 📦 Dual Deployment

- Chrome Extension (Manifest V3)
- Server-side injection

---

## Compatibility

| Emby Version | Status |
|-------------|--------|
| 4.8.x       | ✅ Fully supported |
| 4.9.x       | ✅ Fully supported |

| Browser | Minimum Version |
|---------|----------------|
| Chrome / Edge | 88+ (Manifest V3) |
| Other Chromium-based | 88+ |

---

## Animation Preview

<https://user-images.githubusercontent.com/22045978/568278832-14b2fe00-1367-403d-94ca-551fdc1a060d.mp4>

---

## Configuration

Library label display mode can be toggled in `:root` at the top of `static/css/style.css`:

```css
:root {
  --heicha-library-label-mode: always;  /* always | hover | none */
}
```

| Value    | Effect                                    |
|----------|-------------------------------------------|
| `always` | Persistent semi-transparent label, brighter on hover (default) |
| `hover`  | Only visible on mouse hover               |
| `none`   | Completely hidden                         |

---

## Installation

**Two methods — only one is needed**

### Extension Version

_Requires Chrome 88+ with Manifest V3 support_

1. Open Chrome Extensions Settings → Enable **Developer Mode**
2. Click **Load unpacked**
3. Select the project source directory

### Server Version

_No extension needed, deploy directly to the server for seamless use_

```bash
# Docker Version (re-execute if the script is updated)
# EmbyServer is the container name — change it if yours is different
docker exec EmbyServer /bin/sh -c 'cd /system/dashboard-ui && wget -O - https://tinyurl.com/2p97xcpd | sh'

# Reference tutorial (unofficial): https://cangshui.net/5167.html
```

> **Note**: Docker version requires network access to GitHub

---

## Project Structure

```
Emby-Fluent/
├── manifest.json          # Chrome extension config (Manifest V3)
├── content/
│   └── main.js            # Core logic: banner carousel, font injection, DOM adaptation
├── static/
│   ├── css/
│   │   └── style.css      # All styles: layout, animations, glassmorphism, sidebar
│   ├── js/
│   │   ├── jquery-3.6.0.min.js
│   │   ├── common-utils.js
│   │   └── md5.min.js
│   └── img/
│       └── icon.png
├── script.sh              # Server-side deployment script
└── README.md
```

---

## TODO

- [ ] Bundle as single JS/CSS for direct client use
- [ ] Playback redirect to third-party player
- [ ] Online version detection and updates
- [ ] Custom Docker image via GitHub Actions auto-build

---

## License

[MIT](LICENSE)
