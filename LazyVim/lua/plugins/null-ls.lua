return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- [[ Lua ]]
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,

          -- [[ Python ]]
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.mypy,
          nls.builtins.diagnostics.pylint,

          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
        },
      }
    end,
  },
}
