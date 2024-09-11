--JMJ--------------------------------------------------------------------AMDG--
--                              PLUGIN: edgy.nvim                            --
--                      Last Modified: 2024-09-10 17:33
-------------------------------------------------------------------------------

return {
   {
      'folke/edgy.nvim',
      event = "VeryLazy",
      keys = {
         {
            "<leader>ue",
            function()
               require("edgy").toggle()
            end,
            desc = "Edgy Toggle",
         },
         {
            "<leader>uE",
            function() require("edgy").select() end,
            desc = "Edgy Select Window"
         },
      },
      opts = function()
         local opts = {
            bottom = {
               {
                  ft = "toggleterm",
                  size = { height = 0.4 },
                  filter = function(buf, win)
                     return vim.api.nvim_win_get_config(win).relative == ""
                  end,
               },
               "Trouble",
               { ft = "qf", title = "QuickFix" },
            },
            left = {
               -- Neo-tree filesystem always takes half the screen height
               {
                  title = "Files",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "filesystem"
                  end,
                  size = { height = 0.5 },
               },
               {
                  title = "Git",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "git_status"
                  end,
                  pinned = true,
                  collapsed = true, -- show window as collapsed on start
                  open = "Neotree position=right git_status",
               },
               {
                  title = "Buffers",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "buffers" end,
                  pinned = true,
                  collapsed = true, -- show window as collapsed on start
                  open = "Neotree position=top buffers",
               },
               {
                  title = function()
                     local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
                     return vim.fn.fnamemodify(buf_name, ":t")
                  end,
                  ft = "Outline",
                  pinned = true,
                  open = "SymbolsOutlineOpen",
               },
               -- any other neo-tree windows
               "neo-tree",
            },
            right = {
               {
                  ft = "help",
                  filter = function(buf)
                     return vim.bo[buf].buftype == "help"
                  end,
               },
            },
         }
      end,
   },
}

