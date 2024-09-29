--JMJ----------------------------------✝︎---------------------------------AMDG--
--                   nvim keymaps configuration: edgy.nvim                   --
--                      Last modified: 2024-09-27 20:52                      --
-------------------------------------------------------------------------------


return {
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
}

