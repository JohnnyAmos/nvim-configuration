--JMJ--------------------------------------------------------------------AMDG--
--                       PLUGIN: nvim-comment-frame.lua                      --
--                      Last Modified: 2024-09-08 20:30
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

-- vim: set sts=3 sw=3 ts=3 tw=79:

