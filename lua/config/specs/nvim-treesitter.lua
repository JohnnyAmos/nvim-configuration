--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/nvim-treesitter.lua
-- Plugin source: https://github.com/nvim-treesitter/nvim-treesitter
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-29 11:48
-------------------------------------------------------------------------------


return {
   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = function()
         require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         vim.treesitter.language.register('markdown', 'octo')
         require("nvim-treesitter.configs").setup({
            opts = {
               auto_install = true,
               highlight = { enable = true },
               indent = { enable = true },
               ensure_installed = {
                  "arduino",        "astro",          "authzed",
                  "bash",           "c",              "cpp",
                  "css",            "csv",            "diff",
                  "dtd",            "editorconfig",   "git_config",
                  "git_rebase",     "gitattributes",  "gitcommit",
                  "gitigniore",     "glimmer",        "glimmer_javascript",
                  "gpg",            "html",           "http",
                  "java",           "javascript",     "jsdoc",
                  "json",           "json5",          "ledger",
                  "lua",            "luadocs",        "luap",
                  "markdown",       "mermaid",        "meson",
                  "muttrc",         "ninja",          "perl",
                  "pod",            "printf",         "properties",
                  "python",         "query",          "r",
                  "regex",          "robots",         "ron",
                  "ruby",           "rust",           "scss",
                  "sql",            "ssh_config",     "styled",
                  "swift",          "tmux",           "todotxt",
                  "toml",           "vim",            "vimdoc",
                  "xml",            "yaml"
               }
            }
         })
      end
   }
}

