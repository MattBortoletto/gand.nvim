-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-hunk.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

-- Stronger backgrounds distinguish changed words from whole added/removed lines.
local function blend(background, foreground, amount)
  local channels = {}
  for offset = 2, 6, 2 do
    local a = tonumber(background:sub(offset, offset + 1), 16)
    local b = tonumber(foreground:sub(offset, offset + 1), 16)
    channels[#channels + 1] = math.floor(a + (b - a) * amount + 0.5)
  end
  return ("#%02X%02X%02X"):format(unpack(channels))
end

local semantic = {
  { "background", c.bg },
  { "panel", c.surface },
  { "panelAlt", c.select },
  { "border", c.border },
  { "accent", c.gold },
  { "accentMuted", c.select },
  { "text", c.fg },
  { "muted", c.muted },
  { "addedBg", c.diff_add },
  { "removedBg", c.diff_delete },
  { "movedAddedBg", c.diff_change },
  { "movedRemovedBg", c.diff_text },
  { "contextBg", c.bg },
  { "addedContentBg", blend(c.diff_add, c.green, 0.2) },
  { "removedContentBg", blend(c.diff_delete, c.red, 0.2) },
  { "contextContentBg", c.bg },
  { "addedSignColor", c.green },
  { "removedSignColor", c.red },
  { "lineNumberBg", c.bg },
  { "lineNumberFg", c.muted },
  { "selectedHunk", blend(c.bg, c.gold, 0.5) },
  { "badgeAdded", c.green },
  { "badgeRemoved", c.red },
  { "badgeNeutral", c.muted },
  { "fileNew", c.green },
  { "fileDeleted", c.red },
  { "fileRenamed", c.rune },
  { "fileModified", c.gold },
  { "fileUntracked", c.copper },
  { "noteBorder", c.rune },
  { "noteBackground", c.surface },
  { "noteTitleBackground", c.select },
  { "noteTitleText", c.rune },
}

-- Explicit TextMate selectors keep common inherited syntax colors in Gand.
local scopes = {
  { "comment", c.muted },
  { "punctuation.definition.comment", c.muted },
  { "string", c.green },
  { "string.quoted", c.green },
  { "string.template", c.green },
  { "string.regexp", c.green },
  { "punctuation.definition.string", c.green },
  { "constant", c.purple },
  { "constant.numeric", c.purple },
  { "constant.language", c.purple },
  { "constant.character", c.purple },
  { "constant.other", c.purple },
  { "keyword", c.gold },
  { "keyword.control", c.gold },
  { "keyword.operator", c.muted },
  { "keyword.operator.word", c.gold },
  { "storage", c.gold },
  { "storage.type", c.rune },
  { "storage.type.function", c.gold },
  { "storage.type.class", c.gold },
  { "storage.modifier", c.gold },
  { "entity.name.function", c.copper },
  { "support.function", c.copper },
  { "variable.function", c.copper },
  { "entity.name.type", c.rune },
  { "entity.name.class", c.rune },
  { "entity.other.inherited-class", c.rune },
  { "support.type", c.rune },
  { "support.class", c.rune },
  { "variable", c.fg },
  { "variable.other", c.fg },
  { "variable.parameter", c.fg },
  { "variable.language", c.gold },
  { "variable.other.property", c.blue },
  { "support.variable.property", c.blue },
  { "punctuation", c.muted },
  { "punctuation.section", c.fg },
  { "entity.name.tag", c.gold },
  { "entity.other.attribute-name", c.blue },
  { "markup.heading", c.gold },
  { "markup.underline.link", c.rune },
  { "markup.inline.raw", c.green },
  { "markup.inserted", c.green },
  { "markup.deleted", c.red },
  { "markup.changed", c.gold },
  { "invalid", c.red },
}

local lines = {
  "# gand for Hunk",
  "# Generated from lua/gand/palette.lua; do not edit by hand.",
  "# Regenerate: nvim --headless -u NONE -i NONE -l scripts/generate-hunk.lua",
  "",
  "[themes.gand]",
  'base = "github-dark-default"',
  'label = "gand"',
}
for _, entry in ipairs(semantic) do
  lines[#lines + 1] = ("%s = %q"):format(entry[1], entry[2])
end
lines[#lines + 1] = ""
lines[#lines + 1] = "[themes.gand.syntax_scopes]"
for _, entry in ipairs(scopes) do
  lines[#lines + 1] = ("%q = %q"):format(entry[1], entry[2])
end

local output = root .. "/extras/hunk/gand.toml"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
