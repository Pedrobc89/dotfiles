return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        -- Format path as "file.txt (path\to\file\)"
        -- path_display = function(opts, path)
        --   local tail = require("telescope.utils").path_tail(path)
        --   return string.format("%s | %s", tail, path)
        -- end,
        hidden = true,
        path_display = { "truncate" },
        border = true,
      },
    },
  },
}
