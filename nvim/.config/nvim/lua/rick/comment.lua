require('Comment').setup(
  {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },

    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
}
)
