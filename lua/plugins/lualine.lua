-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/lualine.lua              ║ --
-- ║  Source: https://github.com/nvim-lualine/lualine.nvim                 ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] UI: Statusline & Tabline               Last modified: 2025-05-17 16:47

local M = {
   "nvim-lualine/lualine.nvim",
}

function M.config()
   local ok, lualine = pcall(require, "lualine")
   if not ok then
      print("Error: " .. lualine)
   end

   lualine.setup({
      options = {
         theme = "auto",
         globalstatus = true,
      },
      sections = {
         lualine_a = { "mode" },
         lualine_b = { "branch", "diff", "diagnostics" },
         lualine_c = {
            {
               "filename",
               path = 1,
            },
         },
         lualine_x = {
            "encoding",
            {
               "fileformat",
               symbols = {
                  unix = " ",
                  dos = " ",
                  mac = " ",
               },
            },
            "filetype",
            "filesize",
         },
         lualine_y = {
            "progress",
         },
         lualine_z = {
            "location",
            "tabs",
            {
               "windows",
               mode = 1,
               show_modified_status = true,
            },
         },
      },
      tabline = {
         lualine_a = {
            {
               "buffers",
               max_length = vim.o.columns * 4 / 5,
               mode = 4,
            },
         },
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {
            {
               "tabs",
               max_length = vim.o.columns / 5,
               mode = 0,
            },
         },
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
