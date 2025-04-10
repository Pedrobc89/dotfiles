return {
  prompt = " ",
  enabled = true,
  layout = {
    cycle = true,
    preset = function()
      return vim.o.columns >= 120 and "telescope" or "vertical"
    end,
  },
  ui_select = true, -- replace 'vim.ui.select'
  icons = {
    git = {
      enabled   = false, -- show git icons
      commit    = "󰜘 ", -- used by git log
      staged    = "●", -- staged changes. always overrides the type icons
      added     = "",
      deleted   = "",
      ignored   = " ",
      modified  = "○",
      renamed   = "",
      unmerged  = " ",
      untracked = "?",
    },
  },
  sources = {
    explorer = {
      finder = "explorer",
      sort = { fields = { "sort"} },
      supports_live = true,
      tree = true,
      watch = true,
      diagnostics_open = true,
      diagnostics = true,
      git_status = true,
      git_status_open = true,
      git_untracked = true,
      follow_file = false,
      focus = "list",
      auto_close = false,
      jump = { close = false },
      win = {
        input = {
          keys = {
            ["<ESC>"] = "nop",
          },
        },
        list = {
          keys = {
            ["<ESC>"] = "nop",
          },
        },
        preview = {
          keys = {
            ["<ESC>"] = "close",
          },
        },
      },
    },
  },
}
