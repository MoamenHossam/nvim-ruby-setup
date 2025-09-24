return {
  'github/copilot.vim',
  config = function()
    -- Optional: disable Copilot in some filetypes
    vim.g.copilot_filetypes = {
      ['*'] = true, -- enable everywhere
      ['TelescopePrompt'] = false,
      ['gitcommit'] = true,
      ['markdown'] = true,
    }
    -- Optional: Map <C-l> to accept Copilot suggestion
    vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
  end,
}
