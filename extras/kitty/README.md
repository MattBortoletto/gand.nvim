# Gand for Kitty

Copy `gand.conf` into `~/.config/kitty/themes/` from the repository root:

```sh
mkdir -p ~/.config/kitty/themes
cp extras/kitty/gand.conf ~/.config/kitty/themes/gand.conf
```

Add this line to `~/.config/kitty/kitty.conf`:

```conf
include themes/gand.conf
```

Replace any existing color theme include with Gand. Color settings later in
`kitty.conf` override the included theme. Restart Kitty to apply the theme.

The theme uses Gand's dark palette, with a gold cursor, parchment text, and
Runestone for ANSI blue and cyan, matching the other terminal themes.

Regenerate from the repository root after changing the palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-kitty.lua
```

See the [Kitty configuration reference](https://sw.kovidgoyal.net/kitty/conf/)
for include and color settings.
