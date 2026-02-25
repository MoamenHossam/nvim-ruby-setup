return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'main',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        -- hide_dotfiles = false,
        hide_gitignored = false, -- now gitignored files will be visible
      },
      hijack_netrw_behavior = 'disabled', -- don’t auto-open on startup
      window = {
        mappings = {
          ['<leader>\\'] = 'close_window',
        },
      },
    },
  },
}
