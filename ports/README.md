# Application ports

Gand currently ships a Neovim theme. Ghostty, cmux, and other application
configs can be added here as they are developed:

```text
ports/
  ghostty/
  cmux/
```

Each port should contain its theme/config file and a README with installation
instructions. Only add a port directory when there is an implementation.

Keep `lua/gand/palette.lua` as the source of truth. Derive application colors
from those named values instead of maintaining separate palettes. If a target
format needs literal hex values, generate the file from the palette and document
how to regenerate it. For example, Neovim can export the current palette as JSON:

```sh
nvim --headless -u NONE -i NONE --cmd 'set rtp^=.' \
  '+lua io.write(vim.json.encode(require("gand.palette").get()) .. "\n")' +qa
```

Neovim-specific highlights belong in `lua/gand/integrations/`; standalone
application ports belong here.
