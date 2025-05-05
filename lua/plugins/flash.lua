-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/flash.lua                ║ --
-- ║  Source: https://github.com/folke/flash.nvim                          ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] UI: Navigation                         Last modified: 2025-05-04 21:50

local M = {
   "folke/flash.nvim",
   event = "VeryLazy",
}

function M.config()
   local ok, flash = pcall(require, "flash")
   if not ok then
      print("Error: " .. flash)
   end

   flash.setup({
      -- Ordered thusly because it places the home row keys first, with the
      -- top second and the bottom third.
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
         mode = "search",
         incremental = true,
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
