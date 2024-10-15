--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/lualine.nvim
-- Plugin source: https://github.com/nvim-lualine/lualine.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
         require("lualine").setup({
            opts = {
               theme = "base16",
               globalstatus = true
            },
            sections = {
               lualine_a = { "mode" },
               lualine_b = { "branch", "diff", "diagnostics" },
               lualine_c = {
                  {
                     "filename",
                     path = 1
                  }
               },
               lualine_x = {
                  "encoding",
                  {
                     "fileformat",
                     symbols = {
                        unix = ' ',
                        dos = ' ',
                        mac = ' '
                     }
                  },
                  "filetype",
                  "filesize"
               },
               lualine_z = {
                  "location",
                  "tabs" ,
                  {
                     "windows",
                     mode = 1,
                     show_modified_status = true
                  }
               }
            },
            tabline = {
               lualine_a = {
                  {
                     "buffers",
                     mode = 4,
                     max_length = vim.o.columns * 3 / 4,
                     -- Shows specific buffer name for that filetype
                     -- ( { `filetype` = `buffer_name`, ... } )
                     filetype_names = {}
                  }
               },
               lualine_b = {},
               lualine_c = {},
               lualine_x = {},
               lualine_y = {},
               lualine_z = {
                  {
                     "tabs",
                     max_length = vim.o.columns / 4,
                     mode = 0
                  }
               }
            }
         })
      end
   }
}

