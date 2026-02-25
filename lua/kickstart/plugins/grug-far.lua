return {
  'MagicDuck/grug-far.nvim',
  opts = {},
  cmd = 'GrugFar',
  keys = {
    { '<leader>sR', function() require('grug-far').open() end, desc = '[S]earch and [R]eplace' },
    { '<leader>sR', function() require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } } end, mode = 'v', desc = '[S]earch and [R]eplace word' },
  },
}
