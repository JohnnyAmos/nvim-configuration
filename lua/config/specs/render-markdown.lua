--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/render-markdown.lua
-- Plugin source: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-29 11:48
-------------------------------------------------------------------------------


return {
   {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons"
      },
      opts = {
         opts = {
            file_types = { "md", "markdown" },
            render_modes = { "n", "v", "i", "c" },
            heading = {
               position = "inline"
            },
            icons = { '󰎥 ', '󰎨 ', '󰎫 ', '󰎲 ', '󰎯 ', '󰎴 ' },
            dash = { width = 79 }
         }
      }
   }
}

