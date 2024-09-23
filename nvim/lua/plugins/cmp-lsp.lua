return {
  {
    "hrsh7th/cmp-nvim-lsp",
    enable=false,
    cond = function()
      return require("lazyvim.util").has("nvim-cmp")
    end,
  },
}
