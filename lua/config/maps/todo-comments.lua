--JMJ----------------------------------✝︎---------------------------------AMDG--
--              nvim keymaps configuration: todo-comments.nvim               --
--                      Last modified: 2024-09-26 22:39                      --
-------------------------------------------------------------------------------


return {
   {
      "<leader>ct",
      group = "Todo-Comments"
   },
   {
      "<leader>ctn",
      function()
         require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment"
   },
   {
      "<leader>ctp",
      function()
         require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment"
   },
   {
      "<leader>ctr",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Todo (Trouble)"
   },
   {
      "<leader>cta",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
      desc = "Todo/Fix/Fixme (Trouble)"
   },
   {
      "<leader>ctt",
      "<cmd>TodoTelescope<cr>",
      desc = "Todo"
   },
   {
      "<leader>ctb",
      "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
      desc = "Todo/Fix/Fixme"
   },
}

