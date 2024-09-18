--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: which-key.nvim                           --
--                      Last Modified: 2024-09-11 16:25
-------------------------------------------------------------------------------

return {
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
         preset = "modern",
         -- add mappings here in spec or use `require('which-key').add()` later
         spec = {},
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
         replace = {
            key = {
               function(key)
                  return require("which-key.view").format(key)
               end,
               -- { "<Space>", "SPC" },
            },
            desc = {
               { "<Plug>%(?(.*)%)?", "%1" },
               { "^%+", "" },
               { "<[cC]md>", "" },
               { "<[cC][rR]>", "" },
               { "<[sS]ilent>", "" },
               { "^lua%s+", "" },
               { "^call%s+", "" },
               { "^:%s*", "" },
            },
         },
         -- disable WhichKey for certain buf types and file types.
         disable = {
            ft = {},
            bt = {},
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

