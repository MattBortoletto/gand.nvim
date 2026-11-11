-- Run with: nvim --headless -u NONE -i NONE -l scripts/generate-iterm2.lua
local script = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")
local root = vim.fn.fnamemodify(script, ":h:h")
local c = dofile(root .. "/lua/gand/palette.lua").get()

local lines = {
  '<?xml version="1.0" encoding="UTF-8"?>',
  '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">',
  "<!-- Gand — a dwarven-inspired dark theme for iTerm2. -->",
  "<!-- Generated from lua/gand/palette.lua; do not edit by hand. -->",
  "<!-- Regenerate with scripts/generate-iterm2.lua; see README.md for the command. -->",
  '<plist version="1.0">',
  "<dict>",
}

local function color(name, hex)
  lines[#lines + 1] = ("  <key>%s</key>"):format(name)
  lines[#lines + 1] = "  <dict>"
  lines[#lines + 1] = "    <key>Color Space</key>"
  lines[#lines + 1] = "    <string>sRGB</string>"
  lines[#lines + 1] = "    <key>Alpha Component</key>"
  lines[#lines + 1] = "    <real>1</real>"
  for i, component in ipairs({ "Red", "Green", "Blue" }) do
    local value = assert(tonumber(hex:sub(i * 2, i * 2 + 1), 16)) / 255
    lines[#lines + 1] = ("    <key>%s Component</key>"):format(component)
    lines[#lines + 1] = ("    <real>%.10f</real>"):format(value)
  end
  lines[#lines + 1] = "  </dict>"
end

color("Background Color", c.bg)
color("Foreground Color", c.fg)
color("Bold Color", c.bright)
color("Cursor Color", c.gold)
color("Cursor Text Color", c.bg)
color("Selection Color", c.select)
color("Selected Text Color", c.fg)

-- ANSI blue and bright blue use Runestone, matching the other terminal themes.
local terminal = {
  c.bg, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.fg,
  c.muted, c.red, c.green, c.gold, c.rune, c.purple, c.rune, c.bright,
}
for i, hex in ipairs(terminal) do
  color(("Ansi %d Color"):format(i - 1), hex)
end

lines[#lines + 1] = "</dict>"
lines[#lines + 1] = "</plist>"

local directory = root .. "/extras/iterm2"
vim.fn.mkdir(directory, "p")
local output = directory .. "/gand.itermcolors"
assert(vim.fn.writefile(lines, output) == 0, "Failed to write " .. output)
print("Generated " .. output)
