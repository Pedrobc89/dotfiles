local is_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil

return {
  layout = {
    preset = function()
      return vim.o.columns >= 120 and "telescope" or "vertical"
    end,
    preview = not is_ssh,
  },
  sources = {
    grep = {
      hidden = true,
      exclude = { "*/venv/*", "*/.venv/*" },
      truncate = 1000,

    },
    files = {
      cmd = "fd",
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
      enabled = false,
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
