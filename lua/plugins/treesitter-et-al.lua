--JMJ----------------------------------✝︎---------------------------------AMDG--
--                Plugin configuration: nvim-treesitter et al.               --
--                      Last Modified: 2024-09-26 11:34
-------------------------------------------------------------------------------


return {


   --[[ PLUGIN: nvim-treesitter ]]--

   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = function()
         require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         auto_install = true,
         highlight = { enable = true, },
         indent = { enable = true, },
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
            "gpg",
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
            "meson",
            "muttrc",
            "ninja",
            "perl",
            "pod",
            "printf",
            "properties",
            "python",
            "query",
            "r",
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
            "todotxt",
            "toml",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
         }
      }
   },


   --[[ PLUGIN: nvim-treesitter-endwise ]]--

   {
      "RRethy/nvim-treesitter-endwise",
      dependencies = { "nvim-treesitter/nvim-treesitter"},
      config = function()
         require("nvim-treesitter.configs").setup({
            endwise = {
               enable = true,
            }
         })
      end
   },

   --[[ PLUGIN: nvim-treesitter-textobjects ]]--

   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
         require("nvim-treesitter.configs").setup({
            textobjects = {
               select = {
                  enable = true,
                  lookahead = true,
               },
               swap = { enable = true, },
               move = { enable = true, set_jumps = true, },
               lsp_interop = {
                  enable = true,
                  border = "none",
               },
            },
         })
      end
   },


   --[[ PLUGIN: nvim-treesitter-textsubjects ]]--

   {
      "RRethy/nvim-treesitter-textsubjects",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      lazy = false,
      config = function()
         require("nvim-treesitter").define_modules({
            textsubjects = {
               keymaps = {
                  ["<leader>tss"] = {
                     "textsubjects-smart",
                     desc = "Smart select"
                  },
                  ["<leader>tso"] = {
                     "textsubjects-container-outer",
                     desc = "Select outside containers"
                  },
                  ["<leader>tsi"] = {
                     "textsubjects-container-inner",
                     desc = "Select inside containers"
                  },
               },
             }
         })
      end
   },


   --[[ PLUGIN: render-markdown.nvim ]]--

   {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons"
      },
      opts = {
         file_types = { "md", "markdown" },
         render_modes = { "n", "v", "i", "c" },
         heading = {
            position = "inline",
         },
         icons = { '󰎥 ', '󰎨 ', '󰎫 ', '󰎲 ', '󰎯 ', '󰎴 ' },
         dash = { width = 79 },






      },
   },


}

