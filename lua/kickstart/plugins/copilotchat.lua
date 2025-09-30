return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {},
    keys = {
      -- Key mappings for CopilotChat plugin:
      -- Normal mode:
      { '<leader>zc', '<cmd>CopilotChat<cr>', mode = 'n', desc = 'Chat with Copilot' }, -- Open Copilot chat
      { '<leader>zm', '<cmd>CopilotChatCommit<cr>', mode = 'n', desc = 'Generate Commit Message' }, -- Generate commit message

      -- Visual mode:
      { '<leader>ze', '<cmd>CopilotChatExplain<cr>', mode = 'v', desc = 'Explain Code' }, -- Explain selected code
      { '<leader>zr', '<cmd>CopilotChatReview<cr>', mode = 'v', desc = 'Review selected code' }, -- Review selected code
      { '<leader>zf', '<cmd>CopilotChatFix<cr>', mode = 'v', desc = 'Fix Code Issues' }, -- Fix issues in selection
      { '<leader>zo', '<cmd>CopilotChatOptimize<cr>', mode = 'v', desc = 'Optimize Code' }, -- Optimize selected code
      { '<leader>zd', '<cmd>CopilotChatDocs<cr>', mode = 'v', desc = 'Generate Docs' }, -- Generate documentation for selection
      { '<leader>zt', '<cmd>CopilotChatTests<cr>', mode = 'v', desc = 'Generate Tests' }, -- Generate tests for selection
      { '<leader>zs', '<cmd>CopilotChatCommit<cr>', mode = 'v', desc = 'Generate Commit for Selection' }, -- Generate commit message for selection
      { '<leader>zq', ":'<,'>CopilotChat<cr>", mode = 'v', desc = 'Chat about selection' }, -- Fixed visual selection chat
    },
  },
}
