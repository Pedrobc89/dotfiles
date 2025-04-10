return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html",
          "css", "latex", "norg", "scss", "svelte", "tsx", "typst", "vue"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- build = ":MasonUpdate",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    -- opts = {
    -- },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Lua
          "lua_ls",
          -- Python
          "ruff",
          "pyright",
          -- Javascript
          "eslint",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      { "K",          vim.lsp.buf.hover,                                  desc = "Lsp Hover" },
      -- { "gd",         vim.lsp.buf.definition,                             desc = "Go to definition" },
      -- { "gD",         vim.lsp.buf.declaration,                            desc = "Go to declaration" },
      -- { "gr",         vim.lsp.buf.declaration,                            desc = "Go to References" },
      { "<leader>ch", vim.lsp.buf.signature_help,                         desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action,                            desc = "Code Actions" },
      { "<leader>cf", function() vim.lsp.buf.format { async = true } end, desc = "Format" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})

      lspconfig.pyright.setup({})
      lspconfig.ruff.setup({})

      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
    end,
  },
}
