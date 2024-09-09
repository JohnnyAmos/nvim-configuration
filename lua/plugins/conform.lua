-------------------------------------------------------------------------------
--                           plugin configuration:                           --
--                      Last Modified: 2024-09-08 20:34
-------------------------------------------------------------------------------

return {
   {
      'stevearc/conform.nvim',
      opts = {
         event = { "BufWritePre" },
         cmd = { "ConformInfo" },
         keys = {
            {
               -- Customize or remove this keymap to your liking
               "<leader>f",
               function()
                  require("conform").format({ async = true })
               end,
               mode = "",
               desc = "Format buffer",
            },
         },
         -- This will provide type hinting with LuaLS
         ---@module "conform"
         ---@type conform.setupOpts
         opts = {
            -- Define your formatters
            formatters_by_ft = {
               lua = { "stylua" },
               python = { "isort", "black" },
               javascript = {
                  "prettierd",
                  "prettier",
                  stop_after_first = true
               },
            },
            -- Set default options
            default_format_opts = {
               lsp_format = "fallback",
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500 },
            -- Customize formatters
            formatters = {
               shfmt = {
                  prepend_args = { "-i", "2" },
               },
            },
         },
--          init = function()
--             -- If you want the formatexpr, here is the place to set it
--             vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--          end,
      }
   }
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

