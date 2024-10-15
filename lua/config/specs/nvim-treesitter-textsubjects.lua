--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file:
--    $HOME/.config/nvim/lua/config/specs/nvim-treesitter-textsubjects.lua
-- Plugin source: https://github.com/RRethy/nvim-treesitter-textsubjects
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-29 11:44
-------------------------------------------------------------------------------


return {
   {
      "RRethy/nvim-treesitter-textsubjects",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      lazy = false,
      config = function()
         require("nvim-treesitter.configs").setup({
            textsubjects = {
               keymaps = {
                  ["<leader>tss"] = {
                     "textsubjects-smart",
                     desc = "Smart select"
                  },
                  ["<leader>tso"] = {
                     "textsubjects-container-outer",
                     desc = "Select outside containers"
                  },
                  ["<leader>tsi"] = {
                     "textsubjects-container-inner",
                     desc = "Select inside containers"
                  }
               }
            }
         })
      end
   }
}

