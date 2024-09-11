--JMJ--------------------------------------------------------------------AMDG--
--                            PLUGIN: lualine.nvim                           --
--                      Last Modified: 2024-09-10 17:29
-------------------------------------------------------------------------------

return {
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
         require('lualine').setup()
      end,
      options = { theme = 'base16-isotope' }
   },
}

