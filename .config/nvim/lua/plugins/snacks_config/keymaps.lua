-- stylua: ignore
return {
  -- Find
  {"<leader><space>", function() Snacks.picker.files() end, desc = "Find files",},
  {"<leader>fb",      function() Snacks.picker.buffers() end, desc = "Find Buffers",},
  {"<leader>,",       function() Snacks.picker.buffers() end, desc = "Find Buffers",},
  {"<leader>ff",      function() Snacks.picker.files() end, desc = "Find files",},
  {"<leader>fF",      function() Snacks.picker.files() end, desc = "Find files (cwd)",}, -- TODO: add root as param
  -- {"<leader>fm",      function() Snacks.picker.marks() end, desc = "Find Marks",},
  -- Search
  {'<leader>s"',      function() Snacks.picker.registers() end, desc = "Search registers",},
  {'<leader>s/',      function() Snacks.picker.search_history() end, desc = "Search history",},
  {"<leader>sR",      function() Snacks.picker.resume() end, desc = "Resume Search",},
  {"<leader>sh",      function() Snacks.picker.help() end, desc = "Search help",},
  {"<leader>sk",      function() Snacks.picker.keymaps() end, desc = "Search keymaps",},
  {"<leader>st",      function() Snacks.picker.treesitter() end, desc = "Search treesiter symbols",},

  {"<leader>sg",      function() Snacks.picker.grep() end, desc = "Grep files",},
  {"<leader>sG",      function() Snacks.picker.grep() end, desc = "Grep files root",}, -- TODO: add root as param
  -- Lsp
  { "<leader>cw",     function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace symbols" },
  { "<leader>cD",     function() Snacks.picker.lsp_type_definitions() end, desc = "LSP Type definitions" },
  { "<leader>cs",     function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
  { "<leader>ci",     function() Snacks.picker.lsp_implementations() end, desc = "LSP Implementations" },

  { "gd",             function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
  { "gD",             function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
  { "gr",             function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  { "gi",             function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
  { "gy",             function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  { "<leader>cs",     function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
  { "<leader>cS",     function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

  -- Trouble
  { "<leader>cd",     function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  { "<leader>cD",     function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  { "<leader>xx",     function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  { "<leader>xX",     function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },

  -- Commands
  {"<leader>s:",      function() Snacks.picker.commands() end, desc = "Search command",},
  {"<leader>:",       function() Snacks.picker.command_history() end, desc = "Command history",},
  -- Explorer
  { "<leader>e",      function() Snacks.explorer() end, desc = "File Explorer" },
  { "<leader>r",      function() Snacks.explorer.reveal() end, desc = "File Explorer" },
  -- Notifications
  { "<leader>n",      "", desc = "Notifications" },
  { "<leader>nl",     function() Snacks.picker.notifications() end, desc = "Notifications list" },
  { "<leader>nn",     function() Snacks.notifier.show_history() end, desc = "Notification History" },
  { "<leader>nh",     function() Snacks.notifier.hide() end, desc = "Hide Notifications" },
  -- git
  { "<leader>gg",     function() Snacks.lazygit() end, desc = "Open lazygit" },
  { "<leader>gb",     function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  { "<leader>gl",     function() Snacks.picker.git_log() end, desc = "Git Log" },
  { "<leader>gL",     function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
  { "<leader>gs",     function() Snacks.picker.git_status() end, desc = "Git Status" },
  { "<leader>gS",     function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  { "<leader>gd",     function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
  { "<leader>gf",     function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
}
