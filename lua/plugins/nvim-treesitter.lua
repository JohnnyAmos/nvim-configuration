-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/nvim-treesitter.lua      ║ --
-- ║  Source: https://github.com/nvim-treesitter/nvim-treesitter           ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Coding: Syntax                         Last modified: 2025-05-01 22:25

local M = {
   "nvim-treesitter/nvim-treesitter",
   version = false,
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
   },
   build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
   end,
   vim.treesitter.language.register("markdown", "octo"),
}

function M.config()
   local ok, treesitter = pcall(require, "nvim-treesitter")
   if not ok then
      print("Error: " .. treesitter)
   end
   treesitter.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
         "arduino",
         "astro",
         "bash",
         "css",
         "csv",
         "diff",
         "dtd",
         "editorconfig",
         "git_config",
         "git_rebase",
         "gitattributes",
         "gitcommit",
         "gitigniore",
         "html",
         "http",
         "javascript",
         "jsdoc",
         "json",
         "json5",
         "ledger",
         "lua",
         "luadocs",
         "luap",
         "markdown",
         "perl",
         "pod",
         "printf",
         "python",
         "query",
         "regex",
         "robots",
         "scss",
         "sql",
         "ssh_config",
         "styled",
         "tmux",
         "toml",
         "yaml",
      },
      textobjects = {
         select = {
            enable = true,
            lookahead = true,
         },
         swap = {
            enable = true,
         },
         move = {
            enable = true,
            set_jumps = true,
         },
         lsp_interop = {
            enable = true,
            border = "none",
         },
      },
      endwise = {
         enable = true,
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
