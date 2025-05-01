-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/which-key.lua            ║ --
-- ║  Source: https://github.com/folke/which-key.nvim                      ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Editor: Keymaps                        Last modified: 2025-04-28 17:45

local M = {
   "folke/which-key.nvim",
   event = "VeryLazy",
}

function M.config()
   local ok, which_key = pcall(require, "which-key")
   if not ok then
      print("Error: " .. which_key)
   end

   which_key.setup({
      preset = "modern",
      delay = 1000,
      notify = true,
      triggers = {
         { "<auto>", mode = "nixsotc" },
         { "<leader>", mode = { "n", "v" } },
      },
      keys = {
         scroll_down = "<c-d>",
         scroll_up = "<c-u>",
      },
      sort = { "alphanum" },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
