return {
  "folke/snacks.nvim",
  opts = {
    picker = require("plugins.snacks_config.picker"),
    dashboard = require("plugins.snacks_config.dashboard"),
    scroll = { enabled = false },
  },
  keys = require("plugins.snacks_config.keymaps"),
}
