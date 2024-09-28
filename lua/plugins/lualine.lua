--JMJ--------------------------------------------------------------------AMDG--
--                            PLUGIN: lualine.nvim                           --
--                      Last Modified: 2024-09-23 19:22
-------------------------------------------------------------------------------

return {
   {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
         require("lualine").setup({
            options = {
               theme = "material",
               globalstatus = true,
            },
         })
      end,
   },
}

