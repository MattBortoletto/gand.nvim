# gand for VS Code

This folder is a ready-to-install VS Code theme extension with two themes:
**Gand Dark** and **Gand Light**. Syntax colors follow the Neovim theme:
gold keywords, copper functions, Runestone types, Moss strings, Amethyst
constants, and steel-blue properties. The integrated terminal uses the same
ANSI colors as the Ghostty theme.

## Installation

Link or copy this folder into your VS Code extensions directory, then restart
VS Code:

```sh
ln -s "$PWD/extras/vscode" ~/.vscode/extensions/gand
```

For Cursor or VSCodium, use `~/.cursor/extensions` or
`~/.vscode-oss/extensions` instead.

Open the command palette, run **Preferences: Color Theme**, and choose
**Gand Dark** or **Gand Light**.

To build a `.vsix` package instead:

```sh
cd extras/vscode && npx @vscode/vsce package
code --install-extension gand-*.vsix
```

Regenerate after editing the shared palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-vscode.lua
```

See the [VS Code color theme guide](https://code.visualstudio.com/api/extension-guides/color-theme).
