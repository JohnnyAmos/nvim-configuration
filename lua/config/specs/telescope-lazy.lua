--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/telescope-lazy.lua
-- Plugin source: https://github.com/tsakirist/telescope-lazy.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "tsakirist/telescope-lazy.nvim",
      config = function()
         require("telescope").setup({
            extensions = {
               lazy = {
                  -- The below configuration options are the defaults
                  mappings = {
                     open_in_browser = "",
                     open_in_file_browser = "",
                     open_in_find_files = "",
                     open_in_live_grep = "",
                     open_in_terminal = "",
                     open_plugins_picker = "",
                     open_lazy_root_find_files = "",
                     open_lazy_root_live_grep = "",
                     change_cwd_to_plugin = "",
                  },
               }
            }
         })
      end
   }
}

