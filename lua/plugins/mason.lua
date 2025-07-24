-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/mason.lua                ║ --
-- ║  Source: https://github.com/williamboman/mason.nvim                   ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: LSP                        Last modified: 2025-05-17 16:30

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
         icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
         },
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
