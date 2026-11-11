# Gand for Herdr

A dark theme for Herdr's terminals and interface, with Deepstone backgrounds,
Parchment text, Dwarven Gold accents, and Runestone terminal blues.

Copy the theme into Herdr's themes directory:

```sh
mkdir -p ~/.config/herdr-app/themes
cp extras/herdr/gand.json ~/.config/herdr-app/themes/gand.json
```

Select Gand in Herdr's theme picker, or set `"theme": "gand"` in
`~/.config/herdr-app/settings.json`. Settings apply to layouts without their own
theme; the theme picker overrides the current layout's theme.

Generated from `lua/gand/palette.lua`. Regenerate from the repository root:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-herdr.lua
```
