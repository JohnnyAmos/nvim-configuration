-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/treesj.lua               ║ --
-- ║  Source: https://github.com/Wansmer/treesj                            ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Coding                                 Last modified: 2025-05-10 12:56

local M = {
   "Wansmer/treesj",
}

function M.config()
   local ok, treesj = pcall(require, "treesj")
   if not ok then
      print("Error: " .. treesj)
   end

   treesj.setup({
      use_default_keymaps = false,
      max_join_length = 79,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
