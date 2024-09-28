--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: which-key.nvim                           --
--                      Last Modified: 2024-09-24 23:18
-------------------------------------------------------------------------------

return {
   {
--      "folke/which-key.nvim",
      dir = "~/dev/which-key.nvim",
      branch = "marks",
      event = "VeryLazy",
      opts = {
         preset = "modern",
         notify = true,
         triggers = {
            { "<auto>", mode = "nixsotc" },
            { "a", mode = { "n", "v" } },
            { "<leader>", mode = { "n", "v" } },
         },
         keys = { -- binding to scroll down/up inside the popup
            scroll_down = "<A-DOWN>", -- default: <C-d>
            scroll_up = "<A-UP>", -- default: <C-u>
         },
         sort = { "alphanum" },

      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      },
         debug = false, -- enable wk.log in the current directory
      },
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         }
      }
   }
}

