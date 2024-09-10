-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 17:30
-------------------------------------------------------------------------------

return {
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         }
      }
   },
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

