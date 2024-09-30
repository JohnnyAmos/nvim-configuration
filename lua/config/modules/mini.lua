--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/mini.lua
--    Plugin source: https://github.com/echasnovski/mini.nvim
--    Last modified: 2024-09-29 11:34
-------------------------------------------------------------------------------

local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

   wk.add({

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

   })

end

return M

