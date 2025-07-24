-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/init.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-07-02 19:33

--[[

   FIX: edgy.nvim needs work. Soonish.

   List of plugins that need to be set up.

   cmp-buffer
   cmp-nvim-lsp
   cmp-path
   command-completion.nvim
   fortune.nvim  <== needs mini.startup footer to be altered
   icon-picker.nvim
   lazydev.nvim
   mason-lspconfig.nvim
   nvim-cmp
   nvim-dap
   nvim-dap-ui
   nvim-lspconfig

--]]

return {

   -- [***] PLUGIN: Comment.nvim                         Coding: Comments --
   -- https://github.com/numToStr/Comment.nvim                        MIT --

   { "numToStr/Comment.nvim" },

   -- [*  ] PLUGIN: cmp-buffer                         Coding: Completion --
   -- https://github.com/hrsh7th/cmp-buffer                           MIT --

   --   { "hrsh7th/cmp-buffer" },

   -- [*  ] PLUGIN: cmp-nvim-lsp                Coding: Completion (LSP?) --
   -- https://github.com/hrsh7th/cmp-nvim-lsp                         MIT --

   --   { "hrsh7th/cmp-nvim-lsp" },

   -- [*  ] PLUGIN: cmp-path                           Coding: Completion --
   -- https://github.com/hrsh7th/cmp-path                             MIT --

   --   { "hrsh7th/cmp-path" },

   -- [***] PLUGIN: csvview.nvim                      Languages: CSV, TSV --
   -- https://github.com/hat0uma/csvview.nvim                         MIT --

   {
      "hat0uma/csvview.nvim",
      opts = {
         display_mode = "border",
      },
   },

   -- [***] PLUGIN: dressing.nvim                         UI: Enhancement --
   -- https://github.com/stevearc/dressing.nvim                       MIT --

   { "stevearc/dressing.nvim" },

   -- [*  ] PLUGIN: fortune.nvim                             Utility: Fun --
   -- https://github.com/fecet/fortune.nvim                          None --

   --   { "fecet/fortune.nvim" },

   -- [***] PLUGIN: friendly-snippets                  Coding: Completion --
   -- https://github.com/rafamadriz/friendly-snippets                 MIT --

   { "rafamadriz/friendly-snippets" },

   -- [** ] PLUGIN: garbage-day.nvim                 Utility: LSP Cleanup --
   -- https://github.com/Zeioth/garbage-day.nvim                  GPL-3.0 --

   {
      "zeioth/garbage-day.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
      event = "VeryLazy",
   },

   -- [*  ] PLUGIN: grug-far.nvim                          Editor: Search --
   -- https://github.com/MagicDuck/grug-far.nvim                      MIT --

   --    { "MagicDuck/grug-far.nvim" },

   -- [*  ] PLUGIN: hardtime.nvim                                 Utility --
   -- https://github.com/m4xshen/hardtime.nvim                        MIT --

   -- {
   --    "m4xshen/hardtime.nvim",
   --    dependencies = { "MunifTanjim/nui.nvim" },
   --    opts = {},
   -- },

   -- [*  ] PLUGIN: key-analyzer.nvim                Utility: Mapping Aid --
   -- https://github.com/meznaric/key-analyzer.nvim                   MIT --

   {
      "meznaric/key-analyzer.nvim",
      opts = {},
   },

   -- [*  ] PLUGIN: nerdy.nvim                                  UI: Icons --
   -- https://github.com/2KAbhishek/nerdy.nvim                    GPL-3.0 --

   {
      "2kabhishek/nerdy.nvim",
      dependencies = {
         "folke/snacks.nvim",
      },
      cmd = "Nerdy",
   },

   -- [*  ] PLUGIN: nui.nvim                                           UI --
   -- https://github.com/MunifTanjim/nui.nvim                         MIT --

   { "MunifTanjim/nui.nvim" },

   -- [*  ] PLUGIN: nvim-cmp                          Coding: Completions --
   -- https://github.com/hrsh7th/nvim-cmp                             MIT --

   -- { "hrsh7th/nvim-cmp" },

   -- [***] PLUGIN: nvim-comment-frame                   Coding: Comments --
   -- https://github.com/s1n7ax/nvim-comment-frame                    MIT --

   { "s1n7ax/nvim-comment-frame" },

   -- [*  ] PLUGIN: nvim-dap                                  Coding: DAP --
   -- https://github.com/mfussenegger/nvim-dap                    GPL-3.0 --

   --    { "mfussenegger/nvim-dap" },

   -- [*  ] PLUGIN: nvim-dap-ui                               Coding: DAP --
   -- https://github.com/rcarriga/nvim-dap-ui                         MIT --

   --    { "rcarriga/nvim-dap-ui" },

   -- [*  ] PLUGIN: nvim-lspconfig                            Coding: LSP --
   -- https://github.com/neovim/nvim-lspconfig                 Apache-2.0 --

   --    { "neovim/nvim-lspconfig" },

   -- [*  ] PLUGIN: nvim-nio                                      API: IO --
   -- https://github.com/nvim-neotest/nvim-nio                        MIT --

   { "nvim-neotest/nvim-nio" },

   -- [*  ] PLUGIN: nvim-surround                         Coding: Quoting --
   -- https://github.com/kylechui/nvim-surround                       MIT --

   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
   },

   -- [***] PLUGIN: nvim-web-devicons                           UI: Icons --
   -- https://github.com/nvim-tree/nvim-web-devicons                  MIT --

   { "kyazdani42/nvim-web-devicons" },

   -- [*  ] PLUGIN: sqlite.lua                          Utility: Database --
   -- https://github.com/kkharji/sqlite.lua                           MIT --

   { "kkharji/sqlite.lua" },

   -- [*  ] PLUGIN: stylua-nvim                        Coding: Formatting --
   -- https://github.com/wesleimp/stylua.nvim                         MIT --

   { "ckipp01/stylua-nvim" },

   -- [*  ] PLUGIN: virtcolumn.nvim                       UI: Colorcolumn --
   -- https://github.com/lukas-reineke/virt-column.nvim               MIT --

   {
      "lukas-reineke/virt-column.nvim",
      opts = {
         virtcolumn = "80",
      },
   },

   -- [** ] PLUGIN: yanky.nvim                  Coding: Text Manipulation --
   -- https://github.com/gbprod/yanky.nvim                          WTFPL --

   {
      "gbprod/yanky.nvim",
      config = true,
   },
}

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
