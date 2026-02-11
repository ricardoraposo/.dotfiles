return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'master',
  main = 'nvim-treesitter.configs',
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
    {
      'nvim-treesitter/nvim-treesitter-context',
    },
  },
  opts = {
    ensure_installed = { 'typescript', 'javascript', 'html', 'css', 'scss', 'json', 'graphql', 'elixir' },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
