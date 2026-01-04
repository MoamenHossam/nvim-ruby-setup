return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {

    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },
  opts = {
    git_use_branch_name = true, -- Include git branch name in session name, can also be a function that takes an optional path and returns the name of the branch
    git_auto_restore_on_branch_change = false, -- Should we auto-restore the session when the git branch changes. Requires git_use_branch_name
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
