return {
  'kdheepak/glab.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    require('glab').setup()
  end,
}
