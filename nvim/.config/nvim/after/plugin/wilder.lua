local wilder = require("wilder")
local mocha = require("catppuccin.palettes").get_palette("mocha")

-- Create a highlight group for the popup menu
local text_highlight = wilder.make_hl("WilderText", { { a = 1 }, { a = 1 }, { foreground = mocha.text } })
local mauve_highlight = wilder.make_hl("WilderMauve", { { a = 1 }, { a = 1 }, { foreground = mocha.red } })

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
