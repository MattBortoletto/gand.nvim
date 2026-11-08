-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-vscode.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local palette = dofile(root .. "/lua/gand/palette.lua")

local function blend(background, foreground, amount)
  local channels = {}
  for offset = 2, 6, 2 do
    local a = tonumber(background:sub(offset, offset + 1), 16)
    local b = tonumber(foreground:sub(offset, offset + 1), 16)
    channels[#channels + 1] = math.floor(a + (b - a) * amount + 0.5)
  end
  return ("#%02X%02X%02X"):format(unpack(channels))
end

-- VS Code draws some highlights over text and decorations, so these need alpha.
local function alpha(color, amount)
  return ("%s%02X"):format(color, math.floor(amount * 255 + 0.5))
end

local function workbench(c)
  return {
    -- Base
    { "focusBorder", c.gold },
    { "foreground", c.fg },
    { "disabledForeground", c.muted },
    { "descriptionForeground", c.muted },
    { "errorForeground", c.red },
    { "icon.foreground", c.fg },
    { "selection.background", c.select },
    { "widget.border", c.border },
    { "widget.shadow", alpha("#000000", 0.3) },
    { "sash.hoverBorder", c.gold },
    { "textLink.foreground", c.rune },
    { "textLink.activeForeground", c.gold },
    { "textBlockQuote.background", c.surface },
    { "textBlockQuote.border", c.border },
    { "textCodeBlock.background", c.surface },
    { "textPreformat.foreground", c.copper },
    { "textSeparator.foreground", c.border },
    { "toolbar.hoverBackground", c.select },

    -- Buttons and inputs
    { "button.background", c.gold },
    { "button.foreground", c.bg },
    { "button.hoverBackground", blend(c.gold, c.bright, 0.2) },
    { "button.secondaryBackground", c.select },
    { "button.secondaryForeground", c.fg },
    { "button.secondaryHoverBackground", c.border },
    { "checkbox.background", c.surface },
    { "checkbox.border", c.border },
    { "checkbox.foreground", c.gold },
    { "dropdown.background", c.surface },
    { "dropdown.border", c.border },
    { "dropdown.foreground", c.fg },
    { "input.background", c.surface },
    { "input.border", c.border },
    { "input.foreground", c.fg },
    { "input.placeholderForeground", c.muted },
    { "inputOption.activeBackground", alpha(c.gold, 0.25) },
    { "inputOption.activeBorder", c.gold },
    { "inputOption.activeForeground", c.fg },
    { "inputValidation.errorBackground", c.diff_delete },
    { "inputValidation.errorBorder", c.red },
    { "inputValidation.warningBackground", c.diff_change },
    { "inputValidation.warningBorder", c.gold },
    { "inputValidation.infoBackground", c.surface },
    { "inputValidation.infoBorder", c.blue },
    { "badge.background", c.gold },
    { "badge.foreground", c.bg },
    { "progressBar.background", c.gold },
    { "scrollbar.shadow", alpha("#000000", 0.3) },
    { "scrollbarSlider.background", alpha(c.border, 0.5) },
    { "scrollbarSlider.hoverBackground", alpha(c.border, 0.8) },
    { "scrollbarSlider.activeBackground", c.border },

    -- Lists and trees
    { "list.activeSelectionBackground", c.select },
    { "list.activeSelectionForeground", c.gold },
    { "list.inactiveSelectionBackground", c.surface },
    { "list.inactiveSelectionForeground", c.fg },
    { "list.hoverBackground", c.surface },
    { "list.focusOutline", c.border },
    { "list.highlightForeground", c.gold },
    { "list.focusHighlightForeground", c.gold },
    { "list.errorForeground", c.red },
    { "list.warningForeground", c.gold },
    { "tree.indentGuidesStroke", c.border },

    -- Activity bar, side bar, and panels
    { "activityBar.background", c.bg },
    { "activityBar.foreground", c.gold },
    { "activityBar.inactiveForeground", c.muted },
    { "activityBar.activeBorder", c.gold },
    { "activityBar.border", c.border },
    { "activityBarBadge.background", c.gold },
    { "activityBarBadge.foreground", c.bg },
    { "sideBar.background", c.bg },
    { "sideBar.foreground", c.fg },
    { "sideBar.border", c.border },
    { "sideBarTitle.foreground", c.muted },
    { "sideBarSectionHeader.background", c.bg },
    { "sideBarSectionHeader.foreground", c.fg },
    { "sideBarSectionHeader.border", c.border },
    { "panel.background", c.bg },
    { "panel.border", c.border },
    { "panelTitle.activeForeground", c.gold },
    { "panelTitle.activeBorder", c.gold },
    { "panelTitle.inactiveForeground", c.muted },

    -- Title bar, status bar, and tabs
    { "titleBar.activeBackground", c.bg },
    { "titleBar.activeForeground", c.fg },
    { "titleBar.inactiveBackground", c.bg },
    { "titleBar.inactiveForeground", c.muted },
    { "titleBar.border", c.border },
    { "commandCenter.background", c.surface },
    { "commandCenter.foreground", c.fg },
    { "commandCenter.border", c.border },
    { "statusBar.background", c.surface },
    { "statusBar.foreground", c.fg },
    { "statusBar.border", c.border },
    { "statusBar.noFolderBackground", c.surface },
    { "statusBar.debuggingBackground", c.copper },
    { "statusBar.debuggingForeground", c.bg },
    { "statusBarItem.hoverBackground", c.select },
    { "statusBarItem.remoteBackground", c.gold },
    { "statusBarItem.remoteForeground", c.bg },
    { "editorGroup.border", c.border },
    { "editorGroupHeader.tabsBackground", c.surface },
    { "editorGroupHeader.tabsBorder", c.border },
    { "tab.activeBackground", c.bg },
    { "tab.activeForeground", c.rune },
    { "tab.activeBorderTop", c.rune },
    { "tab.inactiveBackground", c.surface },
    { "tab.inactiveForeground", c.muted },
    { "tab.hoverBackground", c.select },
    { "tab.border", c.border },
    { "tab.unfocusedActiveForeground", c.fg },
    { "tab.unfocusedActiveBorderTop", c.border },
    { "breadcrumb.foreground", c.muted },
    { "breadcrumb.focusForeground", c.fg },
    { "breadcrumb.activeSelectionForeground", c.gold },

    -- Editor
    { "editor.background", c.bg },
    { "editor.foreground", c.fg },
    { "editorLineNumber.foreground", c.muted },
    { "editorLineNumber.activeForeground", c.gold },
    { "editorCursor.foreground", c.gold },
    { "editorCursor.background", c.bg },
    { "editor.lineHighlightBackground", c.surface },
    { "editor.lineHighlightBorder", c.surface },
    { "editor.selectionBackground", c.select },
    { "editor.inactiveSelectionBackground", alpha(c.select, 0.6) },
    { "editor.selectionHighlightBackground", alpha(c.gold, 0.15) },
    { "editor.wordHighlightBackground", alpha(c.blue, 0.15) },
    { "editor.wordHighlightStrongBackground", alpha(c.gold, 0.2) },
    { "editor.findMatchBackground", alpha(c.copper, 0.5) },
    { "editor.findMatchBorder", c.copper },
    { "editor.findMatchHighlightBackground", alpha(c.gold, 0.25) },
    { "editor.findRangeHighlightBackground", alpha(c.surface, 0.6) },
    { "editor.rangeHighlightBackground", alpha(c.gold, 0.1) },
    { "editor.foldBackground", alpha(c.surface, 0.6) },
    { "editorBracketMatch.background", alpha(c.gold, 0.2) },
    { "editorBracketMatch.border", c.gold },
    { "editorBracketHighlight.foreground1", c.gold },
    { "editorBracketHighlight.foreground2", c.purple },
    { "editorBracketHighlight.foreground3", c.rune },
    { "editorBracketHighlight.foreground4", c.copper },
    { "editorBracketHighlight.foreground5", c.green },
    { "editorBracketHighlight.foreground6", c.blue },
    { "editorBracketHighlight.unexpectedBracket.foreground", c.red },
    { "editorIndentGuide.background1", c.surface },
    { "editorIndentGuide.activeBackground1", c.border },
    { "editorWhitespace.foreground", c.border },
    { "editorRuler.foreground", c.surface },
    { "editorCodeLens.foreground", c.muted },
    { "editorLink.activeForeground", c.rune },
    { "editorInlayHint.background", c.surface },
    { "editorInlayHint.foreground", c.muted },
    { "editorGutter.background", c.bg },
    { "editorGutter.addedBackground", c.green },
    { "editorGutter.modifiedBackground", c.gold },
    { "editorGutter.deletedBackground", c.red },
    { "editorGutter.foldingControlForeground", c.muted },
    { "editorOverviewRuler.border", c.border },
    { "editorOverviewRuler.addedForeground", c.green },
    { "editorOverviewRuler.modifiedForeground", c.gold },
    { "editorOverviewRuler.deletedForeground", c.red },
    { "editorOverviewRuler.errorForeground", c.red },
    { "editorOverviewRuler.warningForeground", c.gold },
    { "editorOverviewRuler.infoForeground", c.blue },
    { "editorOverviewRuler.findMatchForeground", c.copper },
    { "editorError.foreground", c.red },
    { "editorWarning.foreground", c.gold },
    { "editorInfo.foreground", c.blue },
    { "editorHint.foreground", c.rune },
    { "problemsErrorIcon.foreground", c.red },
    { "problemsWarningIcon.foreground", c.gold },
    { "problemsInfoIcon.foreground", c.blue },
    { "editorWidget.background", c.surface },
    { "editorWidget.foreground", c.fg },
    { "editorWidget.border", c.copper },
    { "editorHoverWidget.background", c.surface },
    { "editorHoverWidget.border", c.copper },
    { "editorSuggestWidget.background", c.surface },
    { "editorSuggestWidget.border", c.border },
    { "editorSuggestWidget.foreground", c.fg },
    { "editorSuggestWidget.selectedBackground", c.select },
    { "editorSuggestWidget.selectedForeground", c.gold },
    { "editorSuggestWidget.highlightForeground", c.gold },
    { "peekView.border", c.copper },
    { "peekViewEditor.background", c.surface },
    { "peekViewEditor.matchHighlightBackground", alpha(c.gold, 0.25) },
    { "peekViewResult.background", c.surface },
    { "peekViewResult.selectionBackground", c.select },
    { "peekViewResult.matchHighlightBackground", alpha(c.gold, 0.25) },
    { "peekViewTitle.background", c.surface },
    { "peekViewTitleLabel.foreground", c.gold },
    { "peekViewTitleDescription.foreground", c.muted },
    { "minimap.findMatchHighlight", c.copper },
    { "minimap.selectionHighlight", c.select },
    { "minimapGutter.addedBackground", c.green },
    { "minimapGutter.modifiedBackground", c.gold },
    { "minimapGutter.deletedBackground", c.red },

    -- Diff
    { "diffEditor.insertedLineBackground", c.diff_add },
    { "diffEditor.removedLineBackground", c.diff_delete },
    { "diffEditor.insertedTextBackground", alpha(c.green, 0.2) },
    { "diffEditor.removedTextBackground", alpha(c.red, 0.2) },
    { "diffEditor.diagonalFill", c.border },
    { "merge.currentHeaderBackground", alpha(c.green, 0.4) },
    { "merge.currentContentBackground", alpha(c.green, 0.15) },
    { "merge.incomingHeaderBackground", alpha(c.blue, 0.4) },
    { "merge.incomingContentBackground", alpha(c.blue, 0.15) },

    -- Source control
    { "gitDecoration.addedResourceForeground", c.green },
    { "gitDecoration.modifiedResourceForeground", c.gold },
    { "gitDecoration.deletedResourceForeground", c.red },
    { "gitDecoration.renamedResourceForeground", c.rune },
    { "gitDecoration.untrackedResourceForeground", c.green },
    { "gitDecoration.ignoredResourceForeground", c.muted },
    { "gitDecoration.conflictingResourceForeground", c.copper },
    { "gitDecoration.submoduleResourceForeground", c.purple },

    -- Menus, quick input, and notifications
    { "menu.background", c.surface },
    { "menu.foreground", c.fg },
    { "menu.selectionBackground", c.select },
    { "menu.selectionForeground", c.gold },
    { "menu.separatorBackground", c.border },
    { "menu.border", c.border },
    { "quickInput.background", c.surface },
    { "quickInput.foreground", c.fg },
    { "quickInputList.focusBackground", c.select },
    { "quickInputList.focusForeground", c.gold },
    { "quickInputTitle.background", c.surface },
    { "pickerGroup.foreground", c.gold },
    { "pickerGroup.border", c.border },
    { "keybindingLabel.background", c.select },
    { "keybindingLabel.foreground", c.fg },
    { "keybindingLabel.border", c.border },
    { "keybindingLabel.bottomBorder", c.border },
    { "notifications.background", c.surface },
    { "notifications.foreground", c.fg },
    { "notifications.border", c.border },
    { "notificationCenterHeader.background", c.surface },
    { "notificationsErrorIcon.foreground", c.red },
    { "notificationsWarningIcon.foreground", c.gold },
    { "notificationsInfoIcon.foreground", c.blue },

    -- Terminal; blue uses Runestone to match the Ghostty theme
    { "terminal.background", c.bg },
    { "terminal.foreground", c.fg },
    { "terminalCursor.foreground", c.gold },
    { "terminal.selectionBackground", c.select },
    { "terminal.ansiBlack", c.bg },
    { "terminal.ansiRed", c.red },
    { "terminal.ansiGreen", c.green },
    { "terminal.ansiYellow", c.gold },
    { "terminal.ansiBlue", c.rune },
    { "terminal.ansiMagenta", c.purple },
    { "terminal.ansiCyan", c.rune },
    { "terminal.ansiWhite", c.fg },
    { "terminal.ansiBrightBlack", c.muted },
    { "terminal.ansiBrightRed", c.red },
    { "terminal.ansiBrightGreen", c.green },
    { "terminal.ansiBrightYellow", c.gold },
    { "terminal.ansiBrightBlue", c.rune },
    { "terminal.ansiBrightMagenta", c.purple },
    { "terminal.ansiBrightCyan", c.rune },
    { "terminal.ansiBrightWhite", c.bright },
  }
end

-- TextMate scopes mirror the Neovim highlight groups in lua/gand/highlights.lua.
local function token_colors(c)
  return {
    { "Comment", { "comment", "punctuation.definition.comment" }, c.muted, "italic" },
    { "String", { "string", "constant.character", "markup.inline.raw" }, c.green },
    { "Escape", { "constant.character.escape", "string.regexp" }, c.copper },
    {
      "Number, boolean, constant",
      { "constant.numeric", "constant.language", "constant.other", "variable.other.constant", "variable.other.enummember" },
      c.purple,
    },
    {
      "Keyword",
      { "keyword", "keyword.control", "storage.type", "storage.modifier" },
      c.gold,
    },
    { "Preprocessor", { "meta.preprocessor", "keyword.control.directive", "entity.name.function.preprocessor" }, c.gold },
    { "Operator", { "keyword.operator", "punctuation.separator", "punctuation.terminator", "punctuation.accessor" }, c.muted },
    { "Brackets", { "punctuation.section", "meta.brace", "punctuation.definition.parameters" }, c.fg },
    { "Function", { "entity.name.function", "support.function", "meta.function-call" }, c.copper },
    { "Type", { "entity.name.type", "entity.name.class", "entity.name.namespace", "support.type", "support.class", "entity.other.inherited-class" }, c.rune },
    { "Variable", { "variable", "variable.parameter", "meta.definition.variable" }, c.fg },
    { "Builtin variable", { "variable.language", "support.variable" }, c.gold },
    { "Property", { "variable.other.property", "variable.other.object.property", "support.type.property-name", "meta.object-literal.key" }, c.blue },
    { "Tag", { "entity.name.tag" }, c.gold },
    { "Attribute", { "entity.other.attribute-name" }, c.copper },
    { "Special", { "punctuation.definition.template-expression", "punctuation.section.embedded", "storage.type.function.arrow" }, c.copper },
    { "Invalid", { "invalid", "invalid.illegal" }, c.red },
    { "Heading", { "markup.heading", "entity.name.section" }, c.gold, "bold" },
    { "Bold", { "markup.bold" }, nil, "bold" },
    { "Italic", { "markup.italic" }, nil, "italic" },
    { "Link", { "markup.underline.link", "string.other.link" }, c.rune, "underline" },
    { "Quote", { "markup.quote" }, c.muted, "italic" },
    { "List", { "punctuation.definition.list" }, c.gold },
    { "Inserted", { "markup.inserted" }, c.green },
    { "Deleted", { "markup.deleted" }, c.red },
    { "Changed", { "markup.changed" }, c.gold },
  }
end

local function semantic_tokens(c)
  return {
    { "function", c.copper },
    { "method", c.copper },
    { "class", c.rune },
    { "struct", c.rune },
    { "interface", c.rune },
    { "enum", c.rune },
    { "type", c.rune },
    { "typeParameter", c.rune },
    { "namespace", c.rune },
    { "property", c.blue },
    { "enumMember", c.purple },
    { "variable", c.fg },
    { "parameter", c.fg },
    { "variable.readonly", c.purple },
    { "variable.defaultLibrary", c.gold },
    { "keyword", c.gold },
  }
end

local encode = vim.json.encode

-- Emit keys in a stable order for readable generated diffs.
local function theme(name, variant)
  local c = palette.get(nil, variant)
  local lines = {
    "{",
    '  "$schema": "vscode://schemas/color-theme",',
    '  "name": ' .. encode(name) .. ",",
    '  "type": ' .. encode(variant) .. ",",
    '  "semanticHighlighting": true,',
    '  "colors": {',
  }

  local colors = workbench(c)
  for i, entry in ipairs(colors) do
    local comma = i < #colors and "," or ""
    lines[#lines + 1] = ("    %s: %s%s"):format(encode(entry[1]), encode(entry[2]), comma)
  end
  lines[#lines + 1] = "  },"

  lines[#lines + 1] = '  "tokenColors": ['
  local tokens = token_colors(c)
  for i, entry in ipairs(tokens) do
    local settings = {}
    if entry[3] then
      settings[#settings + 1] = '"foreground": ' .. encode(entry[3])
    end
    if entry[4] then
      settings[#settings + 1] = '"fontStyle": ' .. encode(entry[4])
    end
    local comma = i < #tokens and "," or ""
    lines[#lines + 1] = "    {"
    lines[#lines + 1] = ('      "name": %s,'):format(encode(entry[1]))
    lines[#lines + 1] = ('      "scope": %s,'):format(encode(entry[2]))
    lines[#lines + 1] = ('      "settings": { %s }'):format(table.concat(settings, ", "))
    lines[#lines + 1] = "    }" .. comma
  end
  lines[#lines + 1] = "  ],"

  lines[#lines + 1] = '  "semanticTokenColors": {'
  local semantic = semantic_tokens(c)
  for i, entry in ipairs(semantic) do
    local comma = i < #semantic and "," or ""
    lines[#lines + 1] = ("    %s: %s%s"):format(encode(entry[1]), encode(entry[2]), comma)
  end
  lines[#lines + 1] = "  }"
  lines[#lines + 1] = "}"
  return lines
end

local outputs = {
  ["gand-dark-color-theme.json"] = theme("Gand Dark", "dark"),
  ["gand-light-color-theme.json"] = theme("Gand Light", "light"),
}
for file, lines in pairs(outputs) do
  local output = root .. "/extras/vscode/themes/" .. file
  vim.fn.mkdir(vim.fn.fnamemodify(output, ":h"), "p")
  assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
  print("Generated " .. output)
end
