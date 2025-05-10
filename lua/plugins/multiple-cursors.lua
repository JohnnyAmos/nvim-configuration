-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/multiple-cursors.lua     ║ --
-- ║  Source: https://github.com/brenton-leighton/multiple-cursors.nvim    ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] Editor: Multicursor                    Last modified: 2025-05-10 10:37

local M = {
   "brenton-leighton/multiple-cursors.nvim",
   version = "*", -- Use the latest tagged version
}

function M.config()
   local ok, multiple_cursors = pcall(require, "multiple-cursors")
   if not ok then
      print("Error: " .. multiple_cursors)
   end

   multiple_cursors.setup({
      opts = {
         pre_hook = function()
            vim.cmd("Lazy load mini.move")
            vim.g.minipairs_disable = true
            require("cmp").setup({ enabled = false })
            vim.cmd("NoMatchParen")
         end,
         post_hook = function()
            vim.g.minipairs_disable = false
            require("cmp").setup({ enabled = true })
            vim.cmd("DoMatchParen")
         end,
      },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
