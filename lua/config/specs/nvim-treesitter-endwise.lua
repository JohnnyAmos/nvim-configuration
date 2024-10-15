--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/nvim-treesitter-endwise
-- Plugin source: https://github.com/RRethy/nvim-treesitter-endwise
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "RRethy/nvim-treesitter-endwise",
      dependencies = { "nvim-treesitter/nvim-treesitter"},
      config = function()
         require("nvim-treesitter.configs").setup({
            endwise = {
               enable = true
            }
         })
      end
   }
}

