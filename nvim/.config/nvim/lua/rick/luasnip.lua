local ls = require "luasnip"
local types = require("luasnip.util.types")
local map = vim.keymap.set

require("luasnip/loaders/from_vscode").lazy_load()
-- Basic Config
ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
  },
}

-- Keymaps
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

map("n", "<leader>ss", "<cmd>source ~/.config/nvim/lua/rick/luasnip.lua<CR>")

-- Snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- Format node
-- It takes a format string and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- Insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [defaut_text])
local i = ls.insert_node

local rep = require("luasnip.extras").rep

ls.add_snippets("lua", {
  s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
  s("afb", fmt(
    [[
    const {1} = ({2}) => {{
      {3}
    }}
    ]],
    { i(1), i(2), i(3) }
  ))
})

ls.add_snippets("javascriptreact", {
  s("afb", fmt(
    [[
    const {1} = ({2}) => {{
      {3}
    }}
    ]],
    { i(1), i(2), i(3) }
  ))
})



