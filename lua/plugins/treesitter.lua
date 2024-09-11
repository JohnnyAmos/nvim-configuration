--JMJ--------------------------------------------------------------------AMDG--
--                           PLUGIN: nvim-treesitter                         --
--                      Last Modified: 2024-09-10 17:26
-------------------------------------------------------------------------------

return {
   {
      'nvim-treesitter/nvim-treesitter',
      build = function()
         require('nvim-treesitter.install').update({ with_sync = true })()
      end
   },
}

