local M = {}

function M.get(c)
  return {
    BlinkCmpMenu = { link = "Pmenu" },
    BlinkCmpMenuBorder = { link = "FloatBorder" },
    BlinkCmpMenuSelection = { link = "PmenuSel" },
    BlinkCmpLabel = { fg = c.fg },
    BlinkCmpLabelMatch = { fg = c.gold, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.muted, strikethrough = true },
    BlinkCmpLabelDetail = { fg = c.muted },
    BlinkCmpLabelDescription = { fg = c.muted },
    BlinkCmpSource = { fg = c.muted },
    BlinkCmpKind = { fg = c.rune },
    BlinkCmpGhostText = { fg = c.muted },
    BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
    BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
    BlinkCmpDoc = { link = "NormalFloat" },
    BlinkCmpDocBorder = { link = "FloatBorder" },
    BlinkCmpDocSeparator = { link = "FloatBorder" },
    BlinkCmpDocCursorLine = { link = "Visual" },
    BlinkCmpSignatureHelp = { link = "NormalFloat" },
    BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.gold, bold = true },
  }
end

return M
