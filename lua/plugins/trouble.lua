-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/trouble.lua              ║ --
-- ║  Source: https://github.com/folke/trouble.nvim                        ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Coding: Diagnostics                    Last modified: 2025-05-01 16:00

local ok, icons = pcall(required, "assets.icons")
if not ok then
   print("Error: " .. icons)
end

local M = {
   "folke/trouble.nvim",
   cmd = "Trouble",
}

function M.config()
   local ok, trouble = pcall(require, "trouble")
   if not ok then
      print("Error: " .. trouble)
   end

   trouble.setup({
      keys = { -- trouble window-specific keys need not be added to maps.lua
         ["?"] = "help",
         r = "refresh",
         R = "toggle_refresh",
         q = "close",
         o = "jump_close",
         ["<esc>"] = "cancel",
         ["<cr>"] = "jump",
         ["<2-leftmouse>"] = "jump",
         ["<c-s>"] = "jump_split",
         ["<c-v>"] = "jump_vsplit",
         -- go down to next item (accepts count)
         -- j = "next",
         ["}"] = "next",
         ["]]"] = "next",
         -- go up to prev item (accepts count)
         -- k = "prev",
         ["{"] = "prev",
         ["[["] = "prev",
         dd = "delete",
         d = { action = "delete", mode = "v" },
         i = "inspect",
         p = "preview",
         P = "toggle_preview",
         zo = "fold_open",
         zO = "fold_open_recursive",
         zc = "fold_close",
         zC = "fold_close_recursive",
         za = "fold_toggle",
         zA = "fold_toggle_recursive",
         zm = "fold_more",
         zM = "fold_close_all",
         zr = "fold_reduce",
         zR = "fold_open_all",
         zx = "fold_update",
         zX = "fold_update_all",
         zn = "fold_disable",
         zN = "fold_enable",
         zi = "fold_toggle_enable",
      },
      icons = icons._trouble(),
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
