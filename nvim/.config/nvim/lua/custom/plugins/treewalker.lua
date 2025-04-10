return {
  'aaronik/treewalker.nvim',
  opts = {},
  keys = {
    { '{', '<CMD>Treewalker Down<CR>' },
    { '}', '<CMD>Treewalker Up<CR>' },
    { '>', '<CMD>Treewalker Right<CR>', mode = 'n' },
    { '=', '<CMD>Treewalker Left<CR>', mode = 'n' },
  },
}
