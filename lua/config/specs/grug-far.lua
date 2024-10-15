--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/grug-far.lua
-- Plugin source: https://github.com/MagicDuck/grug-far.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'MagicDuck/grug-far.nvim',
      config = function()
         require('grug-far').setup()
      end
   }
}

