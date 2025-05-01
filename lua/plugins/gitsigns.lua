-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/gitsigns.lua             ║ --
-- ║  Source: https://github.com/lewis6991/gitsigns.nvim                   ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: Git                        Last modified: 2025-04-29 23:22

local ok, icons = pcall(require, "assets.icons")
if not ok then
   print("Error: " .. icons)
end

local M = {
   "lewis6991/gitsigns.nvim",
}

function M.config()
   local ok, gitsigns = pcall(require, "gitsigns")
   if not ok then
      print("Error: " .. gitsigns)
   end

   gitsigns.setup({
      signs = icons._gitsigns(),
      signs_staged = icons._gitsigns_staged(),
      signs_staged_enable = true,
      word_diff = true,
      watch_gitdir = {
         follow_files = true,
      },
      attach_to_untracked = true,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
