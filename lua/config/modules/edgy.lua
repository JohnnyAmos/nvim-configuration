--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/edgy.lua
--    Plugin source: https://github.com/folke/edgy.nvim
--    Last modified: 2024-09-96 11:32
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

   wk.add({

      { "<localleader>e", desc = "edgy.nvim" },
      {
         "<localleader>et",
         function()
            require("edgy").toggle()
         end,
         desc = "Edgy Toggle",
      },
      {
         "<localleader>ew",
         function() require("edgy").select() end,
         desc = "Edgy Select Window"
      },

   })

end

return M

