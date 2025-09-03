return {
  layout = {
    preset = function()
      return vim.o.columns >= 120 and "telescope" or "vertical"
    end,
  },
  sources = {
    files = {
      cmd = "find",
      hidden = true,
      exclude = { "*/venv/*", "*/.venv/*" },
      truncate = 1000,
    },
    grep = {
      truncate = 1000,
    },
    lsp_references = {
      format = "filename",
      truncate = 1000,
    },
    explorer = {
      follow_file = false,
      hidden = true,
      auto_close = false,
      win = {
        input = {
          keys = {
            ["<ESC>"] = "nop",
          },
        },
        list = {
          keys = {
            ["<ESC>"] = "nop",
            ["s"] = "edit_vsplit",
            ["<C-J>"] = { "<cmd>q<cr><cmd>TmuxNavigateDown<cr>", expr = true, desc = "NavigateDown" },
            ["<C-K>"] = { "<cmd>q<cr><cmd>TmuxNavigateUp<cr>", expr = true, desc = "NavigateUp" },
            ["<C-H>"] = { "<cmd>q<cr><cmd>TmuxNavigateLeft<cr>", expr = true, desc = "NavigateLeft" },
            ["<C-L>"] = { "<cmd>q<cr><cmd>TmuxNavigateRight<cr>", expr = true, desc = "NavigateRight" },
          },
        },
        preview = {
          wo = {},
          keys = {
            ["<ESC>"] = "close",
          },
        },
      },
    },
  },
}
