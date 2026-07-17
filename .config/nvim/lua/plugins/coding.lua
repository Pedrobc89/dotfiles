return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        pyright = function(_, opts)
          opts.settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          }
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- linters = {
      --   mypy = {
      --     cmd = vim.fn.stdpath("data") .. "/lsp_servers/mypy/mypy" ,
      --     stdin = false,
      --     args = { "--show-column-numbers" },
      --     ignore_exitcode = true,
      --     parser = require("lint.parser").from_pattern(
      --       [[%f[%w](%d+):(%d+): (%w+): (.+)]],
      --       { "lnum", "col", "type", "text" }
      --     ),
      --     cwd = function()
      --       return vim.fn.getcwd()
      --     end,
      --   },
      -- },
      linters_by_ft = {
        python = { "mypy" },
      },
    },
  },
}
