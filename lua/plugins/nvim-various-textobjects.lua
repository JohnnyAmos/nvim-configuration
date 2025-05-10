-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file:                                                         ║ --
-- ║     $HOME/.config/nvim/lua/plugins/nvim-various-textobjects.lua       ║ --
-- ║  Source: https://github.com/chrisgrieser/nvim-various-textobjs        ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] Coding: Object Manipulation            Last modified: 2025-05-10 15:41

local M = {
   "chrisgrieser/nvim-various-textobjs",
   event = "VeryLazy",
}

function M.config()
   local ok, various_textobjs = pcall(require, "various-textobjs")
   if not ok then
      print("Error: " .. various_textobjs)
   end

   various_textobjs.setup({
      keymaps = {
         useDefaults = false,
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
