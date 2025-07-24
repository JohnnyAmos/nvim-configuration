-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/conform.lua              ║ --
-- ║  Source: https://github.com/stevearc/conform.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: Formatting                     Last modified: 2025-07-11 18:08

local M = {
   "stevearc/conform.nvim",
   event = { "BufWritePre" },
   cmd = { "ConformInfo" },
}

function M.config()
   local ok, conform = pcall(require, "conform")
   if not ok then
      print("Error: " .. conform)
   end
   conform.setup({
      formatters_by_ft = {
         -- css = {
         --    "stylelint",
         --    "prettierd",
         -- },
         html = {
            "prettierd",
         },
         javascript = {
            "prettierd",
         },
         json = { "prettierd" },
         lua = { "stylua" },
         markdown = {
            "doctoc",
         },
         python = { "black" },
         scss = {
            "stylelint",
            "prettierd",
         },
         sql = { "sqlfmt" },
         tex = { "tex-fmt" },
         vue = { "prettierd" },
         yaml = { "yamlfmt" },
      },
      lang_to_ext = {
         javascript = "js",
         latex = "tex",
         markdown = "md",
         python = "py",
      },
      ft_parsers = {
         javascript = "babel",
         vue = "vue",
         css = "css",
         scss = "scss",
         html = "html",
         json = "json",
         jsonc = "json",
         yaml = "yaml",
         markdown = "markdown",
         ["markdown.mdx"] = "mdx",
         graphql = "graphql",
      },
      default_format_opts = {
         lsp_format = "fallback",
      },
      format_on_save = {
         lsp_format = "fallback",
         timeout_ms = 250,
      },
      log_level = vim.log.levels.ERROR,
      notify_on_error = true,
      notify_no_formatters = true,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
