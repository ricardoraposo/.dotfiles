return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  main = 'nvim-treesitter',
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
  opts = {},
  config = function()
    require('nvim-treesitter').setup({})

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
