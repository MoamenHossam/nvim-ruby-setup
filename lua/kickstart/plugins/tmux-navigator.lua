return {
  'christoomey/vim-tmux-navigator',
  event = 'VeryLazy',
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Move to left window/pane' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Move to lower window/pane' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Move to upper window/pane' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Move to right window/pane' },
  },
}
