-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/command-completion.lua   ║ --
-- ║  Source: https://github.com/smolck/command-completion                 ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*!!] Editor: Command Completion             Last modified: 2025-05-04 12:51

-- FIX: Getting odd error when entering command: Invalid buffer number.

local M = {
   "smolck/command-completion.nvim",
}

function M.config()
   local ok, command_completion = pcall(require, "command-completion")
   if not ok then
      print("Error: " .. command_completion)
   end

   command_completion.setup({
      max_col_num = 5,
      min_col_width = 25,
      use_matchfuzzy = false,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
