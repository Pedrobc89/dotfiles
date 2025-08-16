return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = true,
    enable = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n", desc = "Navigate right" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n", desc = "Navigate left" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n", desc = "Navigate up" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n", desc = "Navigate down" },
    },
  },
}
