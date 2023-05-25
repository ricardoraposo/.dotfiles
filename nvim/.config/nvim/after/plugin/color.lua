require('palenightfall').setup({
    transparent = true,
    color_overrides = {
        foreground = "#ebebeb"
    },
})

vim.cmd.colorscheme("palenightfall")
vim.cmd("highlight Boolean guifg='#ff5c5c'")
