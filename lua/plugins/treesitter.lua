-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 17:30
-------------------------------------------------------------------------------

return {
   {
      'nvim-treesitter/nvim-treesitter',
      build = function()
         require('nvim-treesitter.install').update({ with_sync = true })()
      end
   },
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

