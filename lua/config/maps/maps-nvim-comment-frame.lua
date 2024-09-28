--JMJ----------------------------------✝︎---------------------------------AMDG--
--              nvim keymaps configuration: nvim-comment-frame               --
--                      Last modified: 2024-09-26 22:54                      --
-------------------------------------------------------------------------------


return {
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
}

