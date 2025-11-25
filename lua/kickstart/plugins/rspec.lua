return {
  'h3pei/rspec.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local rspec = require 'rspec'
    rspec.setup {
      rspec_cmd = function(path)
        -- Replace `web` with the service name in docker-compose.yml
        return { 'docker-compose', 'exec', '-T', 'web', 'bundle', 'exec', 'rspec', path }
      end,
      viewer = {
        type = 'float',
        height = 30,
        width = 160,
        border = 'rounded',
      },
    }
    vim.keymap.set('n', '<leader>rn', ':RSpecNearest<CR>', { desc = 'Run nearest spec', silent = false })
    vim.keymap.set('n', '<leader>rf', ':RSpecCurrentFile<CR>', { desc = 'Run current file specs', silent = true })
    vim.keymap.set('n', '<leader>ra', ':RSpecAll<CR>', { desc = 'Run all specs', silent = true })
    vim.keymap.set('n', '<leader>rr', ':RSpecRerun<CR>', { desc = 'Rerun last spec', silent = true })
    vim.keymap.set('n', '<leader>rF', function()
      local file = vim.fn.expand '%'
      vim.cmd('vsplit | terminal RAILS_ENV=test rspec ' .. file)
    end, { desc = 'Run spec file in side terminal', silent = true })
    vim.keymap.set('n', '<leader>rN', function()
      local file = vim.fn.expand '%'
      local line = vim.fn.line '.'
      vim.cmd('vsplit | terminal unset SILENT_TEST SILENT_TEST_STDOUT TEST_DISABLE_LOGS; RAILS_ENV=test rspec ' .. file .. ':' .. line)
    end, { desc = 'Run individual spec in side terminal', silent = true })
  end,
}
