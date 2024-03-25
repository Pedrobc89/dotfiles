return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        --python dependencies
        "autopep8",
        "black",
        "docformatter",
        "flake8",
        "isort",
        "mypy",
        "pylint",
        -- LSP
        "pyright",
      },
    },
  },
}
