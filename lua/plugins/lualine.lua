-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 17:30
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

-- vim: set sts=3 sw=3 ts=3 tw=79:

