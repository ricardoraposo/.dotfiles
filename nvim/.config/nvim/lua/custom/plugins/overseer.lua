return {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    {
      '<leader>or',
      '<CMD>OverseerRun<CR>',
      desc = 'Run async commands',
      silent = true,
    },
    {
      '<leader>ot',
      '<CMD>OverseerToggle<CR>',
      desc = 'Toggle overseer results',
      silent = true,
    },
  },
}
