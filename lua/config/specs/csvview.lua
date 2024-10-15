--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/csvview.lua
-- Plugin source: https://github.com/hat0uma/csvview.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'hat0uma/csvview.nvim',
      config = function()
         require('csvview').setup()
      end
   }
}

