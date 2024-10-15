--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/conform.lua
-- Plugin source: https://github.com/stevearc/conform.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'stevearc/conform.nvim',
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      opts = {}
   }
}

