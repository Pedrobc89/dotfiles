return {
  {
    "polarmutex/git-worktree.nvim",
    version = '^2',
    lazy = true,
    cmd = { "GitWorktreeList", "GitWorktreeCreate" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"},
    init = function ()
      require("telescope").load_extension("git_worktree")
      vim.api.nvim_create_user_command("GitWorktreeList", function()
        require("telescope").extensions.git_worktree.git_worktree()
      end, {})

      vim.api.nvim_create_user_command("GitWorktreeCreate", function()
        require("telescope").extensions.git_worktree.create_git_worktree()
      end, {})
      local wk = require("which-key")
      local keys = {
        {
          mode = {"n"},
          { "<leader>gw", "",  group = "Worktree", desc = "Something" },
          { "<leader>gwl", "<cmd>GitWorktreeList<cr>", desc = "GitWorktreeList" },
          { "<leader>gwc", "<cmd>GitWorktreeCreate<cr>", desc = "GitWorktreeCreate" },
        }
      }
      wk.add(keys)
    end,
  },
}
