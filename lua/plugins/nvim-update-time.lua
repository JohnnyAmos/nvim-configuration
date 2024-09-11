--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: nvim-update-time                         --
--                      Last Modified: 2024-09-10 17:33
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

