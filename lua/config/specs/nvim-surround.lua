--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/nvim-surround.lua
-- Plugin source: https://github.com/kylechui/nvim-surround
-- Plugin license: MIT
-- Last modified: 2024-09-96 11:32
-------------------------------------------------------------------------------


return {
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup()
      end
   }
}

