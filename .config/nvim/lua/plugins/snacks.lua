local is_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil

return {
  "folke/snacks.nvim",
  opts = {
    picker = require("plugins.snacks_config.picker"),
    dashboard = require("plugins.snacks_config.dashboard"),
    scroll = { enabled = false },
    statuscolumn = { enabled = not is_ssh },
    explorer = { enabled = false },
  },
  keys = require("plugins.snacks_config.keymaps"),
}
