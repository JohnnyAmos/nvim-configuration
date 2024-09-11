--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: bufferline.nvim                          --
--                      Last Modified: 2024-09-10 17:28
-------------------------------------------------------------------------------

return {
   {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      opts = {
         options = {
            themable = true,
            numbers = 'buffer_id',
            diagnostice = false, -- 'nvim_lsp', see docs for more info
            offsets = {
               {
                  filetype = "neo-tree",
                  text = function()
                     return vim.fn.getcwd()
                  end,
                  highlight = "Directory",
                  separator = true, -- or use own character
               }
            },
            show_tab_indicators = true,
         }
      }
   }
}

