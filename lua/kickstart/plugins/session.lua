return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },
  opts = {
    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
}
