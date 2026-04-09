return {
  'saghen/blink.cmp',
  version = 'v0.*',

  opts = {
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      -- add vim-dadbod-completion to your completion providers
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
      },
    },
    keymap = {
      preset = 'default',
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },

    -- experimental signature help support
    signature = { enabled = true },
  },
}
