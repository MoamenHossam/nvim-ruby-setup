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
        local cmd = 'git log --color=always -p -L ' .. vim.fn.shellescape(range)
        local buf = vim.api.nvim_create_buf(false, true)
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        vim.api.nvim_open_win(buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          col = math.floor((vim.o.columns - width) / 2),
          row = math.floor((vim.o.lines - height) / 2),
          style = 'minimal',
          border = 'rounded',
          title = ' Git Line Log ',
          title_pos = 'center',
        })
        vim.fn.termopen(cmd)
        vim.cmd 'startinsert'
        vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true })
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
        local cmd = 'git log --color=always -p -L ' .. vim.fn.shellescape(range)
        local buf = vim.api.nvim_create_buf(false, true)
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        vim.api.nvim_open_win(buf, true, {
          relative = 'editor',
          width = width,
          height = height,
          col = math.floor((vim.o.columns - width) / 2),
          row = math.floor((vim.o.lines - height) / 2),
          style = 'minimal',
          border = 'rounded',
          title = ' Git Line Log ',
          title_pos = 'center',
        })
        vim.fn.termopen(cmd)
        vim.cmd 'startinsert'
        vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true })
      end,
      desc = 'Git log for current line',
    },
  },
}
