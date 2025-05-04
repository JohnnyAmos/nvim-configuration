-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/neo-tree.lua             ║ --
-- ║  Source: https://github.com/nvim-neo-tree/neo-tree.nvim               ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Editor: File Manager                        Last modified: 2025-05-01 22:25

local M = {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
   },
}

function M.config()
   local ok, neo_tree = pcall(require, "neo-tree")
   if not ok then
      print("Error: " .. neo_tree)
   end

   neo_tree.setup({
      popup_border_style = "single",
      add_blank_line_at_top = true,
      auto_clean_after_session_restore = true,
      -- "trace", "debug", "info", "warn", "error", "fatal"
      log_level = "info",
      -- true, false, "/path/to/file.log"
      log_to_file = "$HOME/.config/nvim/.logs/neotree.log",
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
   })
   vim.fn.sign_define("DiagnosticSignError", {
      text = " ",
      texthl = "DiagnosticSignError",
   })
   vim.fn.sign_define("DiagnosticSignWarn", {
      text = " ",
      texthl = "DiagnosticSignWarn",
   })
   vim.fn.sign_define("DiagnosticSignInfo", {
      text = " ",
      texthl = "DiagnosticSignInfo",
   })
   vim.fn.sign_define("DiagnosticSignHint", {
      text = "󰌵",
      texthl = "DiagnosticSignHint",
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
