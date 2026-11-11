-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-alacritty.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

local lines = {
  "# Gand — a dwarven-inspired dark theme for Alacritty",
  "# Generated from lua/gand/palette.lua; do not edit by hand.",
  "# Regenerate: nvim --headless -u NONE -i NONE -l scripts/generate-alacritty.lua",
  "",
  "[colors.primary]",
  'background = "' .. c.bg .. '"',
  'foreground = "' .. c.fg .. '"',
  'dim_foreground = "' .. c.muted .. '"',
  'bright_foreground = "' .. c.bright .. '"',
  "",
  "[colors.cursor]",
  'text = "' .. c.bg .. '"',
  'cursor = "' .. c.gold .. '"',
  "",
  "[colors.selection]",
  'text = "' .. c.fg .. '"',
  'background = "' .. c.select .. '"',
  "",
  "# ANSI blue and bright blue use Runestone, including default macOS ls directories.",
}

local names = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }
local terminal = {
  { "normal", { c.bg, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.fg } },
  { "bright", { c.muted, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.bright } },
}
for _, group in ipairs(terminal) do
  lines[#lines + 1] = "[colors." .. group[1] .. "]"
  for i, color in ipairs(group[2]) do
    lines[#lines + 1] = ('%s = "%s"'):format(names[i], color)
  end
  lines[#lines + 1] = ""
end

local output = root .. "/extras/alacritty/gand.toml"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
