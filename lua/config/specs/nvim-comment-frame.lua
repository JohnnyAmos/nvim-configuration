--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/nvim-comment-frame.lua
-- Plugin source: https://github.com/s1n7ax/nvim-comment-frame
-- Plugin license: MIT
-- Last modified: 2024-09-29 11:39
-------------------------------------------------------------------------------

return {
   {
      's1n7ax/nvim-comment-frame',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      opts = {
         disable_default_keymap = true,
         frame_width = 79,
         line_wrap_len = 60
      }
   }
}

