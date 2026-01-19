return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'frappe',
    transparent_background = false,
    integrations = {
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = true,
    },
  },
}
