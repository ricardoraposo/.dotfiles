return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate to left in a tmux session' },
    { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate downwards in a tmux session' },
    { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate upwards in a tmux session' },
    { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate to right in a tmux session' },
  },
}
