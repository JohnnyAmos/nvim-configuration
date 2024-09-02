-------------------------------------------------------------------------------
--                   plugin configuration: nvim-treesitter                   --
--                      Last Modified: 2024-08-31 17:15                      --
-------------------------------------------------------------------------------

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end
  }
}

-- vim: set ts=2 sts=2 sw=2: --

