local wilder = require("wilder")
local palette = require('github-theme.palette').load('github_dark_dimmed')

-- Create a highlight group for the popup menu
local text_highlight = wilder.make_hl("WilderText", { { a = 1 }, { a = 1 }, { foreground = palette.fg.default } })
local mauve_highlight = wilder.make_hl("WilderMauve", { { a = 1 }, { a = 1 }, { foreground = palette.red.base } })

-- Enable wilder when pressing :, / or ?
wilder.setup({
  modes = { ":", "/", "?" },
  next_key = "<C-n>",
  previous_key = "<C-p>",
})

wilder.set_option('renderer', wilder.wildmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  highlights = {
    default = text_highlight,
    border = mauve_highlight,
    accent = mauve_highlight,
  },
}))
