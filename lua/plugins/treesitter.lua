-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                                                                       ║ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ║                                                                       ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║                                                                       ║ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/treesitter.lua           ║ --
-- ║                                                                       ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-18 15:28


return {
   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
         "RRethy/nvim-treesitter-endwise"
      },
      build = function()
         require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      vim.treesitter.language.register('markdown', 'octo'),
      opts = {
         auto_install = true,
         highlight = { enable = true },
         indent = { enable = true },
         ensure_installed = {
            "arduino",
            "astro",
            "authzed",
            "bash",
            "c",
            "cpp",
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
            "glimmer",
            "glimmer_javascript",
            "html",
            "http",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "ledger",
            "lua",
            "luadocs",
            "luap",
            "markdown",
            "mermaid",
            "perl",
            "pod",
            "printf",
            "python",
            "query",
            "regex",
            "robots",
            "ron",
            "ruby",
            "rust",
            "scss",
            "sql",
            "ssh_config",
            "styled",
            "swift",
            "tmux",
            "toml",
            "yaml"
         },
         textobjects = {
            select = {
               enable = true,
               lookahead = true
            },
            swap = {
               enable = true
            },
            move = {
               enable = true,
               set_jumps = true
            },
            lsp_interop = {
               enable = true,
               border = "none"
            }
         },
         endwise = {
            enable = true
         }
      }
   }
}


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

