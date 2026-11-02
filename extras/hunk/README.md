# gand for Hunk

`gand.toml` defines the named `gand` theme: Deepstone and Iron surfaces,
Parchment text, gold accents, Moss additions, and Ember deletions. Syntax colors
follow Gand's Neovim theme. Changed words receive stronger diff backgrounds
derived from the same palette. Secondary text and borders are lifted slightly
for readability, while selected hunks and changed words have stronger highlights.

The file uses Hunk's root `theme` and `[themes.gand]` tables, including
`syntax_scopes`. Its contents can be merged into a Hunk config; keep the `theme`
setting above table headers. It does not change any other review settings.

Regenerate from the shared palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-hunk.lua
```

See [Hunk themes](https://www.hunk.dev/docs/configure/themes/).
