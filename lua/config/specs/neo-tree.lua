--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/neo-tree.lua
-- Plugin source: https://github.com/nvim-neo-tree/neo-tree.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim"
      },
      opts = {
         add_blank_line_at_top = true,
         auto_clean_after_session_restore = true,
         -- "trace", "debug", "info", "warn", "error", "fatal"
         log_level = "info",
         -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
         log_to_file = '$HOME/.config/nvim/.logs/neotree.log',
         -- "double", "none", "rounded", "shadow", "single" or "solid"
         popup_border_style = "single",
         -- used when sorting files and directories in the tree
         sort_case_insensitive = false,
         use_default_mappings = false,
         window = {
            -- left, right, top, bottom, float, current
            position = "left",
            -- applies to left and right positions
            width = 40,
            auto_expand_width = true,
            insert_as = "child",
         },
         filesystem = {
            async_directory_scan = "auto",
            scan_mode = "shallow",
            bind_to_cwd = true,
            filtered_items = {
               visible = true,
               force_visible_in_empty_folder = true,
               hide_dotfiles = false,
            },
            hijack_netrw_behavior = "open_default",
         },
      }
   }
}

