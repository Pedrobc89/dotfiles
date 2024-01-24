local function path_to_config(arg_name, filename)
  local python_techlabs_3rdparty = "/home/pedro/Documents/Development/IBM/repos/techlabs/3rdparty/python/configs/"
  local cfg_path = python_techlabs_3rdparty .. filename
  if vim.fn.filereadable(cfg_path) == 1 then
    return { arg_name, filename }
  else
    print("Not Found " .. cfg_path)("coverage.toml")("flake8.ini")("mypy.ini")("pylint.toml")("pytest.toml")
  end
  return {}
end

local pants_file = "/home/pedro/Documents/IBM/Development/repos/techlabs/pants.toml"

return {
  {
    "nvimtools/none-ls",
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
          nls.builtins.diagnostics.flake8.with({
            extra_args = path_to_config("--config", "flake8.ini"),
          }),
          nls.builtins.diagnostics.mypy.with({
            extra_args = { "--config-file", "pants.toml" },
          }),
          nls.builtins.diagnostics.pylint.with({
            -- extra_args = {
            --   "--rcfile",
            --   "/home/pedro/Documents/Development/IBM/repos/techlabs/3rdparty/python/configs/pylint.toml",
            -- },
            extra_args = { "--rcfile", "pants.toml" },
          }),

          nls.builtins.formatting.isort.with({
            extra_args = path_to_config("--settings-file", "isort.toml"),
          }),
          nls.builtins.formatting.black.with({
            extra_args = { "--config", "pants.toml" },
          }),
        },
      }
    end,
  },
}
