# Gand for Alacritty

Copy `gand.toml` into `~/.config/alacritty/themes/`:

```sh
mkdir -p ~/.config/alacritty/themes
cp extras/alacritty/gand.toml ~/.config/alacritty/themes/gand.toml
```

Add the theme to `~/.config/alacritty/alacritty.toml`:

```toml
[general]
import = ["~/.config/alacritty/themes/gand.toml"]
```

If `[general]` already exists, update its `import` list instead of adding a
second table. Replace any existing color theme import with Gand and keep
other imports you need. Colors defined directly in `alacritty.toml` override
the imported theme.

The theme uses Gand's dark palette, with a gold cursor, parchment text, and
Runestone for ANSI blue and cyan, matching the Ghostty theme.

Regenerate from the repository root after changing the palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-alacritty.lua
```

See the [Alacritty configuration reference](https://alacritty.org/config-alacritty.html)
for import and color settings.
