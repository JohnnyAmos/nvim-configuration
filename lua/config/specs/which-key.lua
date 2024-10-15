--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/which-key.lua
-- Plugin source: https://github.com/folke/which-key.nvim
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      -- "folke/which-key.nvim",
      dir = "~/dev/which-key.nvim",
      branch = "marks",
      event = "VeryLazy",
      opts = {
         preset = "modern",
         notify = true,
         triggers = {
            { "<auto>", mode = "nixsotc" },
            { "<leader>", mode = { "n", "v" } }
         },
         keys = {
            scroll_down = "<A-DOWN>",
            scroll_up = "<A-UP>"
         },
         sort = { "alphanum" },
         plugins = {
            marks = true, -- Edited to use "<leader>m" for marks.
            registers = true  -- Edited to use <leader>r in normal mode,
                              -- <c-r> still works in insert mode.
         },
         debug = true -- Enable wk.log in the current directory.
      }
   }
}

