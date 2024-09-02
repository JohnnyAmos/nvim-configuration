-------------------------------------------------------------------------------
--                      plugin configuration: flash.nvim                     --
--                      Last Modified: 2024-09-01 17:58
-------------------------------------------------------------------------------

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
      require('flash').setup()
    end
  }
}

-- vim: set ts=2 sts=2 sw=2: --

