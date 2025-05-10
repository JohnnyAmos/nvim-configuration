-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/mason-lspconfig.lua      ║ --
-- ║  Source: https://github.com/williamboman/mason-lspconfig.nvim         ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Coding: LSP                            Last modified: 2025-05-09 20:12

local M = {
   "williamboman/mason-lspconfig.nvim",
}

function M.config()
   local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
   if not ok then
      print("Error: " .. mason_lspconfig)
   end

   mason_lspconfig.setup()
   ensure_installed = {
      "arduino_language_server",
      "ast_grep",
      "astro",
      "basedpyright",
      "bashls",
      "css_variables",
      "cssls",
      "cssmodules_ls",
      "denols",
      "eslint",
      "htmx",
      "jsonls",
      "ltex",
      "lua_ls",
      "markdown_oxide",
      "perlnavigator",
      "ruff",
      "sqlls",
      "tailwindcss",
      "taplo",
   }
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
