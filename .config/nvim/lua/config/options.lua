-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Detect SSH connection
_G.is_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil

-- Alias for W
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})

vim.o.exrc = true
vim.g.autoformat = false

-- Performance & Clipboard Optimizations for Remote SSH Sessions
if not _G.is_ssh then
  vim.o.clipboard = "unnamedplus" -- Use system clipboard locally
else
  vim.o.clipboard = "" -- Disable unnamedplus over SSH to prevent editing/typing lag
  
  -- Fallback to OSC 52 explicitly via + and * registers
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = function(lines, regtype)
        require("vim.ui.clipboard.osc52").copy("+")(lines, regtype)
      end,
      ["*"] = function(lines, regtype)
        require("vim.ui.clipboard.osc52").copy("*")(lines, regtype)
      end,
    },
    paste = {
      ["+"] = function()
        return require("vim.ui.clipboard.osc52").paste("+")()
      end,
      ["*"] = function()
        return require("vim.ui.clipboard.osc52").paste("*")()
      end,
    },
  }

  -- Disable cursorline/cursorcolumn to reduce terminal redraw traffic
  vim.opt.cursorline = false
  vim.opt.cursorcolumn = false

  -- Disable foldexpr recalculation on every keystroke (huge lag source)
  vim.opt.foldmethod = "manual"
  vim.opt.foldexpr = ""

  -- Tweak diagnostics to prevent excessive text updates & layout shifting
  vim.diagnostic.config({
    virtual_text = false,      -- Turn off inline virtual text (inspect with Hover / Line Diagnostics)
    underline = true,          -- Keep syntax underlining
    signs = true,              -- Keep signs in gutter
    update_in_insert = false,  -- Do not update diagnostics in Insert mode
  })
end

