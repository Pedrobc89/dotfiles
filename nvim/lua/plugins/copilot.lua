return {
  {
    "zbirenbaum/copilot.lua",
    keys = {},
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
        python = true,
        typescript = true,
        typescriptreact = true,
        javascript = true,
        javascriptreact = true,
        vue = true,
        html = true,
        go = true,
        rust = true,
        lua = true,
        yaml = true,
        json = true,
        toml = true,
        dockerfile = true,
        txt = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end
          return true
        end,
      },
    },
  },
}
