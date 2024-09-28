--JMJ----------------------------------✝︎---------------------------------AMDG--
--                   nvim keymaps configuration: mini.nvim                   --
--                      Last Modified: 2024-09-27 20:55
-------------------------------------------------------------------------------


return {
   { "<leader>s", desc = "Surround" },
   {
      "<leader>sa",
      function()
         require("mini.surround").add()
      end,
      desc = "Add surround"
   },
   {
      "<leader>sd",
      function()
         require("mini.surround").delete()
      end,
      desc = "Delete surround"
   },
   { "<leader>sf", desc = "Find surrounding" },
   {
      "<leader>sfr",
      function()
         require("mini.surround").find()
      end,
      desc = "Find surrounding to right"
   },
   {
      "<leader>sfl",
      function()
         require("mini.surround").find_left()
      end,
      desc = "Find surrounding to left"
   },
   {
      "<leader>sh",
      function()
         require("mini.surround").highlight()
      end,
      desc = "Highlight surrounding"
   },
   {
      "<leader>sr",
      function()
         require("mini.surround").replace()
      end,
      desc = "Replace surrounding"
   },
   {
      "<leader>sn",
      function()
         require("mini.surround").update_n_lines()
      end,
      desc = "Update `n` lines"
   },
}

