--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/nvim-commetn-frame.lua
--    Plugin source: https://github.com/s1n7ax/nvim-comment-frame
--    Last modified: 2024-09-29 11:39
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

   wk.add({

      {
         "<leader>cs",
         "<cmd>lua require('nvim-comment-frame').add_comment()<cr>",
         mode = "n",
         desc = "Add single-line comment frame"
      },
      {
         "<leader>cm",
         "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<cr>",
         mode = "n",
         desc = "Add multiple-line comment frame"
      },

   })

end

return M

