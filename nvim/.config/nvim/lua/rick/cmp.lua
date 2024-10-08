local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--   return
-- end

-- require("luasnip/loaders/from_vscode").lazy_load()

-- local lspkind = require("lspkind")
local source_mapping = {
  buffer = "[BUF]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[LUA]",
  -- luasnip = "[SNIP]",
  ['vim_dadbod_completion'] = "[DB]",
  path = "[PATH]",
}

cmp.setup({
  -- completion = {
  --   autocomplete = false,
  -- },
  -- window = {
  --   completion = {
  --     border = "rounded",
  --     winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
  --   },
  --   documentation = {
  --     border = "rounded",
  --     winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
  --   },
  -- },
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      { "i", "c" }
    ),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<tab>"] = cmp.config.disable,
  },
  formatting = {
    format = function(entry, vim_item)
      -- vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.kind = ""
      local menu = source_mapping[entry.source.name]
      vim_item.menu = menu
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer",  keyword_length = 6 },
    { name = "path" },
    -- { name = "vim-dadbod-completion" },
    -- { name = "luasnip" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = false,
  },
})

-- luasnip.config.set_config({
--   -- This tells LuaSnip to remember to keep around the last snippet.
--   -- You can jump back into it even if you move outside of the selection
--   history = true,
--   -- This one is cool cause if you have dynamic snippets, it updates as you type!
--   updateevents = "TextChanged,TextChangedI",
--   -- Autosnippets:
--   enable_autosnippets = true,
-- })

-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
--   if luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   end
-- end, { silent = true })
--
-- -- <c-j> is my jump backwards key.
-- -- this always moves to the previous item within the snippet
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
--   if luasnip.jumpable(-1) then
--     luasnip.jump(-1)
--   end
-- end, { silent = true })
--
-- -- <c-l> is selecting within a list of options
-- -- useful for choice nodes
-- vim.keymap.set({ "i" }, "<C-l>", function()
--   if luasnip.choice_active() then
--     luasnip.change_choice(1)
--   end
-- end, { silent = true })

-- vim.keymap.set("n", "<leader>ss", "<cmd>source ~/.config/nvim/lua/rick/snippets/init.lua<CR>")

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 20,
--   sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = "..",
-- })
