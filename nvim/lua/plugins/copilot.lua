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
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").lsp.on_attach(function(client)

        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
}
