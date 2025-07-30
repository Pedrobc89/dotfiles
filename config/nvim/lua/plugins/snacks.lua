return {
  "folke/snacks.nvim",
  opts = {
    picker = require("plugins.snacks_config.picker"),
    dashboard = require("plugins.snacks_config.dashboard"),
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
  },
  keys = require("plugins.snacks_config.keymaps"),
}
