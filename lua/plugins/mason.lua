-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/mason.lua                ║ --
-- ║  Source: https://github.com/williamboman/mason.nvim                   ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: LSP                        Last modified: 2025-04-29 23:23

local ok, icons = pcall(require, "assets.icons")
if not ok then
   print("Error: " .. icons)
end

local M = {
   "williamboman/mason.nvim",
}

function M.config()
   local ok, mason = pcall(require, "mason")
   if not ok then
      print("Error: " .. mason)
   end

   mason.setup({
      PATH = "skip",
      border = "single",
      ui = {
         icons = icons._mason(),
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
