local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

local keymap = vim.api.nvim_buf_set_keymap

toggleterm.setup({
    size = 80,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        width = 130,
        height = 35,
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true }
    keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    keymap(0, "t", "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
    keymap(0, "t", "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
    keymap(0, "t", "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
    keymap(0, "t", "<C-w>l", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
