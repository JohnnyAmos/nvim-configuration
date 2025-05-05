-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/init.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-05-04 22:13

--[[

   FIX: edgy.nvim needs work. Soonish.

   List of plugins that need to be set up.

   cmp-buffer
   cmp-nvim-lsp
   cmp-path
   command-completion.nvim
   fortune.nvim  <== needs mini.startup footer to be altered
   icon-picker.nvim
   illustro.nvim
   lazydev.nvim
   mason-lspconfig.nvim
   nvim-cmp
   nvim-dap
   nvim-dap-ui
   nvim-lsp-file-operations
   nvim-lspconfig
   nvim-nio

--]]

return {

   -- [***] Comment.nvim                                 Coding: Comments --
   -- https://github.com/numToStr/Comment.nvim                        MIT --

   { "numToStr/Comment.nvim" },

   -- [*  ] cmp-buffer                                 Coding: Completion --
   -- https://github.com/hrsh7th/cmp-buffer                           MIT --

   --   { "hrsh7th/cmp-buffer" },

   -- [*  ] cmp-nvim-lsp                        Coding: Completion (LSP?) --
   -- https://github.com/hrsh7th/cmp-nvim-lsp                         MIT --

   --   { "hrsh7th/cmp-nvim-lsp" },

   -- [*  ] cmp-path                                   Coding: Completion --
   -- https://github.com/hrsh7th/cmp-path                             MIT --

   --   { "hrsh7th/cmp-path" },

   -- [***] csvview.nvim                              Languages: CSV, TSV --
   -- https://github.com/hat0uma/csvview.nvim                         MIT --

   { "hat0uma/csvview.nvim", opts = { display_mode = "border" } },

   -- [***] dressing.nvim                                 UI: Enhancement --
   -- https://github.com/stevearc/dressing.nvim                       MIT --

   { "stevearc/dressing.nvim" },

   -- [*  ] fortune.nvim                                     Utility: Fun --
   -- https://github.com/fecet/fortune.nvim                          None --

   --   { "fecet/fortune.nvim" },

   -- [***] friendly-snippets                          Coding: Completion --
   -- https://github.com/rafamadriz/friendly-snippets                 MIT --

   { "rafamadriz/friendly-snippets" },

   -- [** ] garbage-day.nvim                         Utility: LSP Cleanup --
   -- https://github.com/Zeioth/garbage-day.nvim                  GPL-3.0 --

   {
      "zeioth/garbage-day.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
      event = "VeryLazy",
   },

   -- [*  ] glow.nvim                                  Language: Markdown --
   -- https://github.com/ellisonleao/glow.nvim                        MIT --

   { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

   -- [*  ] grug-far.nvim                                  Editor: Search --
   -- https://github.com/MagicDuck/grug-far.nvim                      MIT --

   { "MagicDuck/grug-far.nvim" },

   -- [*  ] hardtime.nvim                                         Utility --
   -- https://github.com/m4xshen/hardtime.nvim                        MIT --

   --    {
   --       "m4xshen/hardtime.nvim",
   --       dependencies = { "MunifTanjim/nui.nvim" },
   --       opts = {},
   --    },

   -- [*  ] key-analyzer.nvim                        Utility: Mapping Aid --
   -- https://github.com/meznaric/key-analyzer.nvim                   MIT --

   { "meznaric/key-analyzer.nvim", opts = {} },

   -- ╔═╡ PLUGIN: lsp_lines.nvim ╞════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://git.sr.ht/~whynothugo/lsp_lines.nvim           ║ --
   -- ║  License: ISC                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
         require("lsp_lines").setup()
      end,
      vim.diagnostic.config({
         virtual_text = false,
         virtual_lines = {
            only_current_line = true,
            highlight_whole_line = false,
         },
      }),
   },

   -- ╔═╡ PLUGIN: lspsaga.nvim ╞══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/nvimdev/lspsaga.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   {
      "nvimdev/lspsaga.nvim",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("lspsaga").setup()
      end,
   },

   -- ╔═╡ PLUGIN: marks.nvim ╞════════════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/chentoast/marks.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════╡ UI: Navigation ╞═╝ --

   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {
         default_mappings = false,
         force_write_shada = true,
         sign_priority = 10,
      },
   },

   -- ╔═╡ PLUGIN: mason-lspconfig.nvim ╞══════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/williamboman/mason-lspconfig.nvim   ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   --    {
   --       "williamboman/mason-lspconfig.nvim",
   --       config = function()
   --          require("mason-lspconfig").setup({
   --             ensure_installed = {
   --                "arduino_language_server",
   --                "ast_grep",
   --                "astro",
   --                "basedpyright",
   --                "bashls",
   --                "css_variables",
   --                "cssls",
   --                "cssmodules_ls",
   --                "denols",
   --                "eslint",
   --                "htmx",
   --                "jsonls",
   --                "ltex",
   --                "lua_ls",
   --                "markdown_oxide",
   --                "perlnavigator",
   --                "ruff",
   --                "sqlls",
   --                "tailwindcss",
   --                "taplo",
   --             }
   --          })
   --       end
   --    },

   -- ╔═╡ PLUGIN: multiple-cursors.nvim ╞═════════════════════╡ [***] ╞═╗ --
   -- ║  Source:                                                        ║ --
   -- ║     https://github.com/brenton-leighton/multiple-cursors.nvim   ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════╡ Editor: Multicursor ╞═╝ --

   {
      "brenton-leighton/multiple-cursors.nvim",
      version = "*", -- Use the latest tagged version
      opts = {
         pre_hook = function()
            vim.cmd("Lazy load mini.move")
            vim.g.minipairs_disable = true
            require("cmp").setup({ enabled = false })
            vim.cmd("NoMatchParen")
         end,
         post_hook = function()
            vim.g.minipairs_disable = false
            require("cmp").setup({ enabled = true })
            vim.cmd("DoMatchParen")
         end,
      },
   },

   -- ╔═╡ PLUGIN: nerdy.nvim ╞════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/2KAbhishek/nerdy.nvim               ║ --
   -- ║  License: GPL-3.0                                               ║ --
   -- ╚═══════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   {
      "2kabhishek/nerdy.nvim",
      dependencies = {
         "stevearc/dressing.nvim",
         "nvim-telescope/telescope.nvim",
      },
      cmd = "Nerdy",
   },

   -- [*  ] nui.nvim                                                   UI --
   -- https://github.com/MunifTanjim/nui.nvim                         MIT --

   { "MunifTanjim/nui.nvim" },

   -- [*  ] nvim-cmp                                  Coding: Completions --
   -- https://github.com/hrsh7th/nvim-cmp                             MIT --

   --    { "hrsh7th/nvim-cmp" },

   -- [***] nvim-comment-frame                           Coding: Comments --
   -- https://github.com/s1n7ax/nvim-comment-frame                    MIT --

   { "s1n7ax/nvim-comment-frame" },

   -- [*  ] nvim-dap                                          Coding: DAP --
   -- https://github.com/mfussenegger/nvim-dap                    GPL-3.0 --

   --    { "mfussenegger/nvim-dap" },

   -- ╔═╡ PLUGIN: nvim-dap-ui ╞═══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/rcarriga/nvim-dap-ui                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: DAP ╞═╝ --

   --    { "rcarriga/nvim-dap-ui" },

   -- ╔═╡ PLUGIN: nvim-lsp-file-operations ╞══════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/antosha417/nvim-lsp-file-operations ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   --    {
   --       "antosha417/nvim-lsp-file-operations",
   --       dependencies = {
   --          "nvim-lua/plenary.nvim",
   --          "nvim-neo-tree/neo-tree.nvim",
   --       },
   --       config = function()
   --          require("lsp-file-operations").setup()
   --       end
   --    },

   -- ╔═╡ PLUGIN: nvim-lspconfig ╞════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/neovim/nvim-lspconfig               ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   --    { "neovim/nvim-lspconfig" },

   -- ╔═╡ PLUGIN: nvim-nio ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/nvim-neotest/nvim-nio               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════════╡ API: IO ╞═╝ --

   --    { "nvim-neotest/nvim-nio" },

   -- ╔═╡ PLUGIN: nvim-surround ╞═════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/kylechui/nvim-surround              ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════════════╡ Coding:  ╞═╝ --

   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
   },

   -- ╔═╡ PLUGIN: nvim-update-time ╞══════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/StonyBoy/nvim-update-time           ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════╡ Utilities: Timestamp ╞═╝ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 15,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: ",
      },
   },

   -- ╔═╡ PLUGIN: nvim-various-textobjects ╞══════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/chrisgrieser/nvim-various-textobjs  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════╡ Coding: Object Manipulation ╞═╝ --

   {
      "chrisgrieser/nvim-various-textobjs",
      event = "VeryLazy",
      opts = {
         keymaps = {
            useDefaults = false,
         },
      },
   },

   -- ╔═╡ PLUGIN: nvim-web-devicons ╞═════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/nvim-tree/nvim-web-devicons         ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═══════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   { "kyazdani42/nvim-web-devicons" },

   -- ╔═╡ PLUGIN: octo.nvim ╞═════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/pwntester/octo.nvim                 ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Editor: Git ╞═╝ --

   {
      "pwntester/octo.nvim",
      opts = {
         enable_builtin = true,
         default_remote = { "origin", "upstream" },
         picker = "telescope",
         default_to_projects_v2 = false,
         suppress_missing_scope = {
            projects_v2 = true,
         },
         ui = {
            -- show "modified" marks on the sign column
            use_signcolumn = false,
            -- show "modified" marks on the status column
            use_signstatus = true,
         },
         mappings_disable_default = true,
      },
   },

   -- ╔═╡ PLUGIN: sqlite.lua ╞════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/kkharji/sqlite.lua                  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═══════════════════════════════════════════╡ Utility: Database ╞═╝ --

   { "kkharji/sqlite.lua" },

   -- ╔═╡ PLUGIN: stylua-nvim ╞═══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/wesleimp/stylua.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Formatting ╞═╝ --

   { "ckipp01/stylua-nvim" },

   -- ╔═╡ PLUGIN: treesj ╞════════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/Wansmer/treesj                      ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════════════╡ Coding ╞═╝ --

   {
      "Wansmer/treesj",
      opts = {
         use_default_keymaps = false,
         max_join_length = 79,
      },
   },

   -- [*  ] virtcolumn.nvim                               UI: Colorcolumn --
   -- https://github.com/lukas-reineke/virt-column.nvim               MIT --

   { "lukas-reineke/virt-column.nvim", opts = { virtcolumn = "80" } },

   -- [** ] yanky.nvim                          Coding: Text Manipulation --
   -- https://github.com/gbprod/yanky.nvim                          WTFPL --

   { "gbprod/yanky.nvim", config = true },
}

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
