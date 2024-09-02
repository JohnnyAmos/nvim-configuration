-------------------------------------------------------------------------------
--                      plugin configuration: octo.nvim                      --
--                      Last Modified: 2024-08-31 17:15                      --
-------------------------------------------------------------------------------

return {
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
  }
}

-- vim: set ts=2 sts=2 sw=2: --

