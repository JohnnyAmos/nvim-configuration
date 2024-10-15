--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file:
--    $HOME/.config/nvim/lua/config/specs/nvim-treesitter-textobjects.lua
-- Plugin source:
--    https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-29 11:44
-------------------------------------------------------------------------------


return {
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = { "nvim-treesitter/nvim-treesitter"},
      config = function()
         require("nvim-treesitter").setup({
            opts = {
               textobjects = {
                  select = {
                     enable = true,
                     lookahead = true
                  },
                  swap = { enable = true, },
                  move = { enable = true, set_jumps = true, },
                  lsp_interop = {
                     enable = true,
                     border = "none"
                  }
               }
            }
         })
      end
   }
}

