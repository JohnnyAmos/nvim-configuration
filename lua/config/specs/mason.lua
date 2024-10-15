--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/mason.lua
-- Plugin source: https://github.com/williamboman/mason.nvim
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "williamboman/mason.nvim",
      opts = {
         PATH = 'skip',
         border = 'single',
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗",
            },
         },
      }
   }
}


