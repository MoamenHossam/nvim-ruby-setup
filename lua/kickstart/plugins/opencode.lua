return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.opt.autoread = true

    vim.keymap.set({ 'n', 'x' }, '<leader>p', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'Ask opencode' })

    vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
      require('opencode').select()
    end, { desc = 'Execute opencode action…' })

    local function focus_or_toggle_opencode()
      local curr = vim.api.nvim_get_current_win()
      local opencode_win = nil
      for _, w in ipairs(vim.api.nvim_list_wins()) do
        local b = vim.api.nvim_win_get_buf(w)
        local name = vim.api.nvim_buf_get_name(b) or ''
        local ok, ft = pcall(vim.api.nvim_buf_get_option, b, 'filetype')
        ft = ok and ft or ''
        if ft == 'opencode' or name:match 'opencode' then
          opencode_win = w
          break
        end
      end

      if opencode_win then
        if curr == opencode_win then
          vim.cmd 'wincmd p'
        else
          vim.api.nvim_set_current_win(opencode_win)
        end
      else
        require('opencode').toggle()
      end
    end

    vim.keymap.set({ 'n', 't' }, '<C-Space>', focus_or_toggle_opencode, { desc = 'Toggle/focus opencode' })
    vim.api.nvim_create_user_command('OpencodeToggle', focus_or_toggle_opencode, { desc = 'Toggle/focus opencode' })

    vim.keymap.set({ 'n', 'x' }, 'go', function()
      return require('opencode').operator '@this '
    end, { expr = true, desc = 'Add range to opencode' })

    vim.keymap.set('n', 'goo', function()
      return require('opencode').operator '@this ' .. '_'
    end, { expr = true, desc = 'Add line to opencode' })

    vim.keymap.set('n', '<S-C-u>', function()
      require('opencode').command 'session.half.page.up'
    end, { desc = 'opencode half page up' })

    vim.keymap.set('n', '<S-C-d>', function()
      require('opencode').command 'session.half.page.down'
    end, { desc = 'opencode half page down' })
  end,
}
