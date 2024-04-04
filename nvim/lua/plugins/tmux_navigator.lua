return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n", desc = "Navigate right" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n", desc = "Navigate left" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n", desc = "Navigate up" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>}", mode = "n", desc = "Navigate down" },
    },
  },
}
