local M = {}

function M.get(c)
  local groups = {}

  -- Editor
  groups["Normal"] = { fg = c.fg, bg = c.bg }
  groups["NormalNC"] = { fg = c.fg, bg = c.bg }
  groups["NormalFloat"] = { fg = c.fg, bg = c.surface }
  groups["FloatBorder"] = { fg = c.copper, bg = c.surface }
  groups["FloatTitle"] = { fg = c.gold, bold = true }
  groups["WinSeparator"] = { fg = c.border }
  groups["CursorLine"] = { bg = c.surface }
  groups["CursorLineNr"] = { fg = c.gold, bold = true }
  groups["LineNr"] = { fg = c.muted }
  groups["SignColumn"] = { bg = c.bg }
  groups["ColorColumn"] = { bg = c.surface }
  groups["Visual"] = { bg = c.select }
  groups["MatchParen"] = { fg = c.gold, bold = true }
  groups["NonText"] = { fg = c.border }
  groups["EndOfBuffer"] = { fg = c.bg }
  groups["Directory"] = { fg = c.rune }
  groups["Folded"] = { fg = c.muted, bg = c.surface }
  groups["VertSplit"] = { fg = c.border }

  -- Menus and status
  groups["StatusLine"] = { fg = c.fg, bg = c.surface }
  groups["StatusLineNC"] = { fg = c.muted, bg = c.surface }
  groups["Pmenu"] = { fg = c.fg, bg = c.surface }
  groups["PmenuSel"] = { fg = c.gold, bg = c.select, bold = true }
  groups["PmenuSbar"] = { bg = c.border }
  groups["PmenuThumb"] = { bg = c.muted }
  groups["TabLine"] = { fg = c.muted, bg = c.surface }
  groups["TabLineSel"] = { fg = c.gold, bg = c.bg, bold = true }
  groups["Title"] = { fg = c.gold, bold = true }

  -- Search
  groups["Search"] = { fg = c.bg, bg = c.gold }
  groups["IncSearch"] = { fg = c.bg, bg = c.copper }
  groups["CurSearch"] = { fg = c.bg, bg = c.copper }

  -- Classic syntax
  groups["Comment"] = { fg = c.muted, italic = true }
  groups["String"] = { fg = c.green }
  groups["Character"] = { fg = c.green }
  groups["Number"] = { fg = c.purple }
  groups["Boolean"] = { fg = c.purple }
  groups["Float"] = { fg = c.purple }
  groups["Function"] = { fg = c.copper }
  groups["Keyword"] = { fg = c.gold, bold = true }
  groups["Statement"] = { fg = c.gold }
  groups["Conditional"] = { fg = c.gold }
  groups["Repeat"] = { fg = c.gold }
  groups["Operator"] = { fg = c.muted }
  groups["Type"] = { fg = c.rune }
  groups["Structure"] = { fg = c.rune }
  groups["Identifier"] = { fg = c.fg }
  groups["Constant"] = { fg = c.purple }
  groups["PreProc"] = { fg = c.gold }
  groups["Special"] = { fg = c.copper }
  groups["Delimiter"] = { fg = c.muted }
  groups["Error"] = { fg = c.red }
  groups["Todo"] = { fg = c.bg, bg = c.gold, bold = true }

  -- Treesitter
  groups["@comment"] = { link = "Comment" }
  groups["@string"] = { link = "String" }
  groups["@number"] = { link = "Number" }
  groups["@boolean"] = { link = "Boolean" }
  groups["@function"] = { link = "Function" }
  groups["@function.call"] = { link = "Function" }
  groups["@function.method"] = { link = "Function" }
  groups["@keyword"] = { link = "Keyword" }
  groups["@keyword.return"] = { fg = c.gold, bold = true }
  groups["@keyword.conditional"] = { fg = c.gold }
  groups["@keyword.repeat"] = { fg = c.gold }
  groups["@type"] = { link = "Type" }
  groups["@constructor"] = { fg = c.gold }
  groups["@variable"] = { fg = c.fg }
  groups["@variable.builtin"] = { fg = c.gold }
  groups["@variable.parameter"] = { fg = c.fg }
  groups["@property"] = { fg = c.blue }
  groups["@constant"] = { link = "Constant" }
  groups["@operator"] = { link = "Operator" }
  groups["@punctuation.delimiter"] = { fg = c.muted }
  groups["@punctuation.bracket"] = { fg = c.fg }
  groups["@markup.heading"] = { fg = c.gold, bold = true }
  groups["@markup.link"] = { fg = c.rune, underline = true }

  -- LSP semantic tokens
  groups["@lsp.type.function"] = { link = "Function" }
  groups["@lsp.type.method"] = { link = "Function" }
  groups["@lsp.type.class"] = { link = "Type" }
  groups["@lsp.type.struct"] = { link = "Type" }
  groups["@lsp.type.interface"] = { link = "Type" }
  groups["@lsp.type.enum"] = { link = "Type" }
  groups["@lsp.type.property"] = { fg = c.blue }

  -- Diagnostics
  for name, color in pairs({
    Error = c.red,
    Warn = c.gold,
    Info = c.blue,
    Hint = c.rune,
  }) do
    groups["Diagnostic" .. name] = { fg = color }
    groups["DiagnosticSign" .. name] = { fg = color }
    groups["DiagnosticUnderline" .. name] = {
      undercurl = true,
      sp = color,
    }
  end

  -- Diff
  groups["DiffAdd"] = { bg = c.diff_add }
  groups["DiffChange"] = { bg = c.diff_change }
  groups["DiffDelete"] = { bg = c.diff_delete }
  groups["DiffText"] = { bg = c.diff_text }

  return groups
end

return M
