-------------------------------------------------------------------------------
--                    PLUGIN: init.lua (multiple plugins)                    --
--                      Last Modified: 2024-09-09 18:13
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
      'akinsho/toggleterm.nvim',
      version = "*",
      config = true
   },
   'wesleimp/stylua.nvim',
   'kkharji/sqlite.lua',
   'nvim-lua/plenary.nvim',
   {
      'nvim-tree/nvim-web-devicons',
      lazy = true
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
   {
      'rcarriga/nvim-notify',
      lazy = false
   },
   'smolck/command-completion.nvim',
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

