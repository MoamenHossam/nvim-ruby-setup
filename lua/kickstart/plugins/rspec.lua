return {
  "h3pei/rspec.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local rspec = require("rspec")
    rspec.setup({
      rspec_cmd = function(path)
        -- Replace `web` with the service name in docker-compose.yml
        return { "docker-compose", "exec", "-T", "web", "bundle", "exec", "rspec", path }
      end,
      viewer = {
        height = 20,
        width = 120,
      },
    })

    vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", { desc = "Run nearest spec", silent = false })
    vim.keymap.set("n", "<leader>rf", ":RSpecCurrentFile<CR>", { desc = "Run current file specs", silent = true })
    vim.keymap.set("n", "<leader>ra", ":RSpecAll<CR>", { desc = "Run all specs", silent = true })
    vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", { desc = "Rerun last spec", silent = true })
  end,
}
