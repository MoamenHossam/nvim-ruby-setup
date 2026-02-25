return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = true,
  opts = {
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.40,
    },
  },
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>cf', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>cr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>cC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection to Claude' },
    { '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add buffer to Claude' },
    { '<leader>ca', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>cd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
