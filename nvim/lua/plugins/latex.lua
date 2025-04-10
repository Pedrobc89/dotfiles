return {
  "lervag/vimtex",
  tag = "v2.16",
  ft = "tex",
  init = function ()
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}

