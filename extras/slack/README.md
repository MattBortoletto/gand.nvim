# gand for Slack

[`gand.txt`](gand.txt) contains the selected four-color Slack theme:

```text
#6B7B88,#E0B567,#A1BD88,#D47E78
```

It combines a steel blue gray with Gand's Dwarven Gold, Moss, and Ember.

## Installation

1. Copy the entire line from `gand.txt`.
2. In Slack on desktop, open your profile picture → **Preferences** →
   **Appearance** → **Custom theme**.
3. Select **Import theme**, paste the theme string, and click **Apply**.

Regenerate after editing the shared palette:

```sh
nvim --headless -u NONE -i NONE -l scripts/generate-slack.lua
```

The steel background is fixed; the other three colors use Gand's shared dark palette.

See [Slack's theme instructions](https://slack.com/help/articles/205166337-Change-your-Slack-theme).
