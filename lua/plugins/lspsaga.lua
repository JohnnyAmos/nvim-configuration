-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/lspsaga.lua              ║ --
-- ║  Source: https://github.com/nvimdev/lspsaga.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Coding: LSP                            Last modified: 2025-05-09 20:17

local M = {
   "nvimdev/lspsaga.nvim",
   dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
   },
}

function M.config()
   local ok, lspsaga = pcall(require, "lspsaga")
   if not ok then
      print("Error: " .. lspsaga)
   end

   lspsaga.setup({})
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
