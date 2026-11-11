# Gand for iTerm2

1. Download [gand.itermcolors](gand.itermcolors).
2. Open **iTerm2 → Settings → Profiles**, select your profile, and open **Colors**.
3. Choose **Color Presets… → Import…** and select `gand.itermcolors`.
4. Choose **gand** from **Color Presets…** to apply it.

The theme uses Gand's dark palette, with a gold cursor, parchment text, and
Runestone for ANSI blue and cyan, matching the Alacritty and Ghostty themes.

Regenerate from the repository root after changing the palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-iterm2.lua
```

See the [iTerm2 color settings documentation](https://iterm2.com/documentation-preferences-profiles-colors.html)
for color preset and profile options.
