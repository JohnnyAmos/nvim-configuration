--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/flash.lua
-- Plugin source: https://github.com/folke/flash.nvim
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'folke/flash.nvim',
      event = 'VeryLazy',
      config = function()
         require('flash').setup()
      end
   }
}
