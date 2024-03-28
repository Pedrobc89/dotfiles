return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("neo-tree.command").execute({ reveal = true })
        end,
        desc = "Reveal File",
        remap = true,
      },
    },
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = false,
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["/"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
}
