# gand for Claude Code

`gand.json` defines a dark Claude Code theme using Gand's shared palette.
Gold accents, Runestone suggestions, stone panels, and Moss/Ember diffs match
the other themes. Shimmer and selection colors are derived from existing colors.

Claude Code's main background comes from the terminal. The mouse-selection
and composer sidebar colors apply only in fullscreen mode.

Regenerate after editing the shared palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-claude.lua
```

See the [Claude Code custom theme reference](https://code.claude.com/docs/en/terminal-config#create-a-custom-theme).
