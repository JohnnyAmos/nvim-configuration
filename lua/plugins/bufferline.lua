-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 20:56
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

-- vim: set sts=3 sw=3 ts=3 tw=79:

