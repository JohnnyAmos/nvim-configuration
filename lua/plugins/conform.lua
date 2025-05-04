-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/conform.lua              ║ --
-- ║  Source: https://github.com/stevearc/conform.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: Formatting                     Last modified: 2025-05-04 12:02

local M = {
   "stevearc/conform.nvim",
}

function M.config()
   local ok, conform = pcall(require, "conform")
   if not ok then
      print("Error: " .. conform)
   end
   conform.setup({
      formatters_by_ft = {
         css = {
            "stylelint",
            "prettierd",
         },
         html = {
            "ast-grep",
            "prettierd",
         },
         javascript = {
            "ast-grep",
            "prettierd",
         },
         json = { "prettierd" },
         lua = { "stylua" },
         markdown = {
            "cbfmt",
            "doctoc",
         },
         python = { "ruff" },
         scss = {
            "stylelint",
            "prettierd",
         },
         sql = { "sqlfmt" },
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
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
