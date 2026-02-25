return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open Lazygit' },
    { '<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', desc = 'Lazygit file history' },
    {
      '<leader>gl',
      function()
        local startline = vim.fn.line 'v'
        local endline = vim.fn.line '.'
        if startline > endline then
          startline, endline = endline, startline
        end
        local file = vim.fn.expand '%'
        local range = startline .. ',' .. endline .. ':' .. file
        vim.cmd('terminal git log -L ' .. vim.fn.shellescape(range))
      end,
      mode = 'v',
      desc = 'Git log for selection',
    },
    {
      '<leader>gl',
      function()
        local line = vim.fn.line '.'
        local file = vim.fn.expand '%'
        local range = line .. ',' .. line .. ':' .. file
        vim.cmd('terminal git log -L ' .. vim.fn.shellescape(range))
      end,
      desc = 'Git log for current line',
    },
  },
}
