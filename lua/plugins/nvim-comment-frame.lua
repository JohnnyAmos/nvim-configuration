--JMJ--------------------------------------------------------------------AMDG--
--                       PLUGIN: nvim-comment-frame.lua                      --
--                      Last Modified: 2024-09-10 17:33
-------------------------------------------------------------------------------

return {
   {
      's1n7ax/nvim-comment-frame',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      opts = {
         disable_default_keymap = true,
         frame_width = 79,
         line_wrap_len = 60,
      }
   }
}

