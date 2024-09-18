--JMJ--------------------------------------------------------------------AMDG--
--                          PLUGIN: mason.nvim et al                         --
--                      Last Modified: 2024-09-12 17:55
-------------------------------------------------------------------------------

return {
   {
      "williamboman/mason.nvim",
      opts = {
         PATH = 'skip',
         border = 'single',
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗",
            },
         },
      }
   },
    "neovim/nvim-lspconfig",
}




--    {
--       "williamboman/mason-lspconfig.nvim",
--       require('mason-lspconfig').setup()
--    },
--    'mfussenegger/nvim-dap',
--    "nvim-neotest/nvim-nio",
--    'nvimtools/none-ls.nvim',
--    {
--       "rcarriga/nvim-dap-ui",
--       dependencies = {
--          "mfussenegger/nvim-dap",
--          "nvim-neotest/nvim-nio",
--       },
--    },



