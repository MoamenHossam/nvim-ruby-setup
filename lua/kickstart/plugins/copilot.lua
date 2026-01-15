return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_filetypes = {
      ['*'] = true,
      ['TelescopePrompt'] = false,
      ['gitcommit'] = true,
      ['markdown'] = true,
    }
    vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
  end,
}
