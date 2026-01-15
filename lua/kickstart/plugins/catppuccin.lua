return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'frappe',
      transparent_background = false,
      integrations = {
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
      },
    }
    vim.cmd.colorscheme 'solarized-osaka'
  end,
}
