vim.cmd.colorscheme("sonokai")
require("transparent").setup({
    extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NvimTreeEndOfBuffer",
    },
})
vim.cmd("TransparentEnable")
