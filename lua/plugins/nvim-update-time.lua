--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: nvim-update-time                         --
--                      Last Modified: 2024-09-14 20:30
-------------------------------------------------------------------------------

return {
   {
      'StonyBoy/nvim-update-time',
      config = function()
         require('nvim-update-time').setup({
            last = 8,
            format = '%Y-%m-%d %H:%M',
            pattern = 'Last Modified: '
         })
      end,
   },
}

