return {
  'saghen/blink.cmp',
  version = 'v0.*',

  opts = {
    keymap = { preset = 'default' },
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
