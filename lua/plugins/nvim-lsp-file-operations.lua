-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/nvim-lsp-file-ops.lua    ║ --
-- ║  Source: https://github.com/antosha417/nvim-lsp-file-operations       ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] Coding: LSP                            Last modified: 2025-05-10 15:38

local M = {
   "antosha417/nvim-lsp-file-operations",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
   },
}

function M.config()
   local ok, lsp_file_ops = pcall(require, "lsp-file-operations")
   if not ok then
      print("Error: " .. lsp_file_ops)
   end

   lsp_file_ops.setup()
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
