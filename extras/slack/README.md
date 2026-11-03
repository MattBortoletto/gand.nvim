# gand for Slack

[`gand.txt`](gand.txt) contains a copyable Slack theme string generated from
Gand's shared palette: Deepstone and Iron backgrounds, Parchment text, a gold
selection, Moss presence indicators, and Ember mention badges.

## Installation

1. Copy the entire line from `gand.txt`.
2. In Slack on desktop, open your profile picture → **Preferences** →
   **Appearance** → **Custom theme**.
3. Next to **Theme Colors**, select **Import theme**.
4. Paste the line into **Paste your legacy theme colors**, then click **Apply**.

Use dark mode and turn off **Window gradient** for a closer match. Slack may
adapt imported legacy colors to its current theme system, so the result can
differ from the exact palette.

The ten colors are ordered as follows:

| Element | Palette color |
| --- | --- |
| Column background | Deepstone (`bg`) |
| Menu background | Iron (`surface`) |
| Active item background | Dwarven Gold (`gold`) |
| Active item text | Deepstone (`bg`) |
| Hover item background | `select` |
| Column text | Parchment (`fg`) |
| Active presence | Moss (`green`) |
| Mention badge | Ember (`red`) |
| Top navigation background | Iron (`surface`) |
| Top navigation text | Parchment (`fg`) |

Regenerate after editing the shared palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-slack.lua
```

See [Slack's theme and import instructions](https://slack.com/help/articles/205166337-Change-your-Slack-theme).
