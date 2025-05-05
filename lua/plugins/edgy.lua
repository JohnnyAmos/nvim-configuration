-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/edgy.lua                 ║ --
-- ║  Source: https://github.com/folke/edgy.nvim                           ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*!!] UI: Layouts                            Last modified: 2025-05-04 21:18

local M = {
   "folke/edgy.nvim",
   event = "VeryLazy",
}

function M.config()
   local ok, edgy = pcall(require, "edgy")
   if not ok then
      print("Error: " .. edgy)
   end

   edgy.setup({
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
               return vim.b[buf].neo_tree_source == "buffers"
            end,
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
            open = "Lspsaga outline",
         },
         -- any other neo-tree windows
         "neo-tree",
      },
      right = {
         ft = "help",
         filter = function(buf)
            return vim.bo[buf].buftype == "help"
         end,
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
