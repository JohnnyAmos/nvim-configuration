--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/trouble.lua
--    Plugin source: https://github.com/folke/trouble.nvim
--    Last modified: 2024-09-29 11:54
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

   wk.add({

      { "<localleader>t", desc = "trouble.nvim" },
      {
         "<localleader>td",
         "<cmd>Trouble diagnostics toggle<cr>",
         mode = "n",
         desc = "Diagnostics (Trouble)"
      },
      {
         "<localleader>tb",
         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
         mode = "n",
         desc = "Buffer Diagnostics (Trouble)"
      },
      {
         "<localleader>ts",
         "<cmd>Trouble symbols toggle focus=false<cr>",
         mode = "n",
         desc = "Symbols (Trouble)"
      },
      { "<localleader>tl", desc = "lsp toggle/loclist toggle" },
      {
         "<localleader>tls",
         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
         mode = "n",
         desc = "LSP Defs / refs / … (Trouble)"
      },
      {
         "<localleader>tll",
         "<cmd>Trouble loclist toggle<cr>",
         mode = "n",
         desc = "Location List (Trouble)"
      },
      {
         "<localleader>tq",
         "<cmd>Trouble qflist toggle<cr>",
         mode = "n",
         desc = "Quickfix List (Trouble)"
      },

   })

end

return M

