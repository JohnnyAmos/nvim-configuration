-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/marks.lua                ║ --
-- ║  Source: https://github.com/chentoast/marks.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] UI: Navigation                        Last modified: 2025-05-09 17:33

local M = {
   "chentoast/marks.nvim",
   event = "VeryLazy",
}

function M.config()
   local ok, marks = pcall(require, "marks")
   if not ok then
      print("Error: " .. marks)
   end

   marks.setup({
      default_mappings = false,
      force_write_shada = true,
      sign_priority = 10,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
