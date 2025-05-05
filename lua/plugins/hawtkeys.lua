-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/hawtkeys.lua             ║ --
-- ║  Source: https://github.com/tris203/hawtkeys.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Utility: Keymaps                       Last modified: 2025-05-04 21:55

local M = {
   "tris203/hawtkeys.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
   },
}

function M.config()
   local ok, hawtkeys = pcall(require, "hawtkeys")
   if not ok then
      print("Error: " .. hawtkeys)
   end

   hawtkeys.setup({
      customMaps = {
         ["wk.register"] = {
            method = "which_key",
         },
         ["lazy"] = {
            method = "lazy",
         },
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
