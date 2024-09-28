--JMJ----------------------------------✝︎---------------------------------AMDG--
--                 nvim keymaps configuration: trouble.nvim                  --
--                      Last modified: 2024-09-26 21:36                      --
-------------------------------------------------------------------------------


return {
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
}

