vim.opt.list = true

require("indent_blankline").setup {
    show_current_context = true,
}

require("wilder").setup({
    modes = { ":", "/", "?" },
    next_key = "<C-n>",
    previous_key = "<C-p>",
})

-- This isn't dumb but it was getting on the way of my stuff on telescope
require('jaq-nvim').setup {
    cmds = {
        internal = {
            lua = "luafile %",
            vim = "source %",
        },
        external = {
            javascript = "node %",
            markdown   = "glow %",
            python     = "python3 %",
            go         = "go run %",
            cs         = "dotnet run",
            sh         = "sh %",
            hurl       = "hurl %",
        }
    },
    behavior = {
        default     = "float",
        startinsert = false,
        autosave    = false
    },
    ui = {
        float = {
            border   = "rounded",
            winhl    = "Normal",
            borderhl = "FloatBorder",
            winblend = 0,
            height   = 0.6,
            width    = 0.6,
            x        = 0.5,
            y        = 0.5
        },
    }
}
