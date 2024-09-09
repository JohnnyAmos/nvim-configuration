-------------------------------------------------------------------------------
--                    PLUGIN: init.lua (multiple plugins)                    --
--                      Last Modified: 2024-09-08 20:59
-------------------------------------------------------------------------------

return {
   {
      'tinted-theming/base16-vim',
      priority = 1000
   },
   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {}
   },
   -- 'fecet/fortune.nvim',
   'tpope/vim-surround',
   'tpope/vim-repeat',
   {
      'folke/trouble.nvim',
      cmd = 'Trouble',
      opts = {}
   },
   {
      'nvim-treesitter/nvim-treesitter',
      build = function()
         require('nvim-treesitter.install').update({ with_sync = true })()
      end
   },
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         }
      }
   },
   {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = true
   },
   {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
         require('telescope').load_extension('bookmarks')
         require("telescope").load_extension("frecency")
         require('telescope').load_extension('fzf')
         require('telescope').load_extension('repo')
      end
   },
   'wesleimp/stylua.nvim',
   'kkharji/sqlite.lua',
   'nvim-lua/plenary.nvim',
   'cljoly/telescope-repo.nvim',
   {
      'nvim-tree/nvim-web-devicons',
      lazy = true
   },
   {
      'StonyBoy/nvim-update-time',
      config = function()
         require('nvim-update-time').setup({
            last = 5,
            format = '%Y-%m-%d %H:%M',
            pattern = 'Last Modified: '
         })
      end,
   },
   {
      'MunifTanjim/nui.nvim',
      lazy = false
   },
   {
      'folke/neoconf.nvim',
      cmd = 'Neoconf'
   },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
         require('lualine').setup()
      end,
      options = { theme = 'base16-isotope' }
   },
   {
      'MagicDuck/grug-far.nvim',
      config = function()
         require('grug-far').setup()
      end
   },
   {
      'lewis6991/gitsigns.nvim',
      opts = {}
   },
   {
      'folke/flash.nvim',
      event = 'VeryLazy',
      config = function()
         require('flash').setup()
      end
   },
   {
      'stevearc/dressing.nvim',
      opts = {}
   },
   'nvim-telescope/telescope-github.nvim',
   {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = {
         'nvim-telescope/telescope.nvim',
         'nvim-lua/plenary.nvim'
      }
   },
   {
      'pwntester/octo.nvim',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-telescope/telescope.nvim',
         'nvim-tree/nvim-web-devicons',
         'nvim-treesitter/nvim-treesitter'
      },
      config = function()
         require'octo'.setup {
            suppress_missing_scope = {
               projects_v2 = true,
            }
         }
         vim.treesitter.language.register('markdown', 'octo')
      end
   },
   {
      'rcarriga/nvim-notify',
      lazy = false
   },
   {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
   },
   "nvim-telescope/telescope-frecency.nvim",
   {
      "lukas-reineke/headlines.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = true,
   },
   'smolck/command-completion.nvim',
   {
      'dhruvmanila/browser-bookmarks.nvim',
      version = '*',
      opts = {
         selected_browser = 'vivaldi'
      },
      dependencies = {
         'nvim-telescope/telescope.nvim'
      }
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = 'v3.x',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-tree/nvim-web-devicons',
         'MunifTanjim/nui.nvim'
      }
   },
   install = { colorscheme = { "base16-isotope" } },
   checker = { enabled = true },
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

