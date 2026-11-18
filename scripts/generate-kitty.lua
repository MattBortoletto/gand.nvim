-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-kitty.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

local lines = {
  "# Gand — a dwarven-inspired dark theme for Kitty",
  "# Generated from lua/gand/palette.lua; do not edit by hand.",
  "# Regenerate: nvim --headless -u NONE -i NONE -l scripts/generate-kitty.lua",
  "",
  "background " .. c.bg,
  "foreground " .. c.fg,
  "cursor " .. c.gold,
  "cursor_text_color " .. c.bg,
  "selection_background " .. c.select,
  "selection_foreground " .. c.fg,
  "",
  "# ANSI blue and bright blue use Runestone, including default macOS ls directories.",
}

local terminal = {
  c.bg, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.fg,
  c.muted, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.bright,
}
for i, color in ipairs(terminal) do
  lines[#lines + 1] = ("color%d %s"):format(i - 1, color)
end

local directory = root .. "/extras/kitty"
vim.fn.mkdir(directory, "p")
local output = directory .. "/gand.conf"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
