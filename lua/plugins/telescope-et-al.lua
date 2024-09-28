-------------------------------------------------------------------------------
--                           PLUGIN: telescope.nvim                          --
--                      Last Modified: 2024-09-09 17:56
-------------------------------------------------------------------------------

return {
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
   {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
   },
   "nvim-telescope/telescope-frecency.nvim",
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
   'cljoly/telescope-repo.nvim',
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
}

