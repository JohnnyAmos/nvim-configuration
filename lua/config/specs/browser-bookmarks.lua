--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/browser-bookmarks.lua
-- Plugin source: https://github.com/dhruvmanila/browser-bookmarks.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'dhruvmanila/browser-bookmarks.nvim',
      version = '*',
      dependencies = {
         'nvim-telescope/telescope.nvim'
      },
      opts = {
         selected_browser = 'vivaldi'
      }
   }
}

