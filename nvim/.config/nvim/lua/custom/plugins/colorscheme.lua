return {
  { 'felipeagc/fleet-theme-nvim' },
  {
    'anAcc22/sakura.nvim',
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
  {
    '2nthony/vitesse.nvim',
    dependencies = {
      'tjdevries/colorbuddy.nvim',
    },
  },
  { 'mhartington/oceanic-next' },
  { 'sainnhe/sonokai' },
  { 'bluz71/vim-moonfly-colors' },
  {
    'doums/dark.nvim',
    init = function()
      vim.g.sononai_style = 'andromeda'

      local today = os.date '%A'
      if today == 'Sunday' then
        vim.cmd.colorscheme 'OceanicNext'
      elseif today == 'Monday' then
        vim.cmd.colorscheme 'fleet'
      elseif today == 'Tuesday' then
        vim.cmd.colorscheme 'dark'
      elseif today == 'Wednesday' then
        vim.cmd.colorscheme 'sakura'
      elseif today == 'Thursday' then
        vim.cmd.colorscheme 'moonfly'
      elseif today == 'Friday' then
        vim.cmd.colorscheme 'sonokai'
      elseif today == 'Saturday' then
        vim.cmd.colorscheme 'vitesse'
      end
    end,
  },
}
