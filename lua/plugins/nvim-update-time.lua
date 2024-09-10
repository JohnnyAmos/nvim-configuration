-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 17:30
-------------------------------------------------------------------------------

return {
   {
      'StonyBoy/nvim-update-time',
      config = function()
         require('nvim-update-time').setup({
            last = 5,
            format = '%Y-%m-%d %H:%M',
            pattern = 'Last Modified: '
         })
      end,
   },
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

