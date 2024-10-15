--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/comment-box.lua
-- Plugin source: https://github.com/LudoPinelli/comment-box.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "LudoPinelli/comment-box.nvim",
      opts = {
         comment_style = "auto", -- also "line" and "block"
         doc_width = 79,
         box_width = 73,
         line_width = 79,
         outer_blank_lines_above = true,
         outer_blank_lines_below = true,
         inner_blank_lines = true,
         line_blank_line_above = true,
         line_blank_line_below = true,
      }
   },
}

