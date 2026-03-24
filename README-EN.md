# Emby Beautify

## EN & CN

- [简体中文](README.md)
- [English](README-EN.md)

_Emby Beautify Plugin — Carousel enhancement, glassmorphism labels, entry animations (for Chromium-based browsers)_

# Warning: The media library cover is an original design. Please do not imitate it without authorization

---

## Features

- 🎠 **Seamless Carousel** — Homepage banner auto-rotates (10s interval) with clone-frame technique for seamless infinite looping
- ◀▶ **Carousel Navigation** — Hidden prev/next buttons that appear on hover, with debounce protection for rapid clicks
- 🪟 **Glassmorphism Library Labels** — Media library cards show a frosted glass title bar sliding up from the bottom on hover (`backdrop-filter: blur`), replacing the old full-overlay approach
- 🎬 **Entry Animations** — Staggered card entrance animations and logo fade-in effects
- 📦 **Dual Deployment** — Supports both Chrome Extension (Manifest V3) and server-side injection

## Animation Preview

<https://user-images.githubusercontent.com/22045978/568278832-14b2fe00-1367-403d-94ca-551fdc1a060d.mp4>

## Usage Instructions

Library label display mode can be toggled via `--heicha-library-label-mode` in `:root` at the top of `static/css/style.css`:

- `always` — Always visible at reduced opacity, brighter on hover **(default)**
- `hover` — Only visible on mouse hover
- `none` — Completely hidden

## Usage Method

**Two methods — only need to deploy one**

> Plugin Version

_Requires users to load the extension (Chrome 88+ required for Manifest V3)_

Chrome Extension Settings > Developer Mode > Load the unzipped extension > Select the source code directly

> Server Version

_No need to use plugins, deploy directly to the server, users can use it seamlessly_

    # Docker Version (If the script is updated, just re-execute)
    # Note: You need to have access to Github. If you don't understand, please leave a message in the group
    # EmbyServer is the container name. If your container name is not this, please change it to the correct one!
    # Reference tutorial (unofficial): https://mj.tk/2023/07/Emby
    docker exec EmbyServer /bin/sh -c 'cd /system/dashboard-ui && wget -O - https://tinyurl.com/2p97xcpd | sh'

    # Normal version
    # Reference tutorial (unofficial): https://cangshui.net/5167.html

---

## TODO

- Encapsulate as a single JS/CSS for client use
- Playback jump to third-party player function
- Online version detection and update

