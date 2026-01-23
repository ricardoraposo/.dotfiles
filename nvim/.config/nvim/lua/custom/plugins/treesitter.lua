return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'master',
  lazy = false,
  dependencies = {
    {
      'windwp/nvim-ts-autotag',
      opts = {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      },
    },
  },
  opts = {
    ensure_installed = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'html', 'css', 'scss', 'json', 'graphql', 'elixir' },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
