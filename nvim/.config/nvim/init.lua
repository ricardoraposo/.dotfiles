vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base46_cache/'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  {
    import = 'custom.plugins',
  },
  {
    import = 'rick.plugins.gitsigns',
  },
  rocks = {
    enable = false,
  }
}, {
  change_detection = {
    notify = false,
  },
})
-- dofile(vim.g.base46_cache .. 'defaults')
--
-- dofile(vim.g.base46_cache .. 'treesitter')
-- dofile(vim.g.base46_cache .. 'colors')
-- dofile(vim.g.base46_cache .. 'syntax')
