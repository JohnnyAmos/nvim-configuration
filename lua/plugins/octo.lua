-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/octo.lua                 ║ --
-- ║  Source: https://github.com/pwntester/octo.nvim                       ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Editor: Git                            Last modified: 2025-05-10 12:52

local M = {
   "pwntester/octo.nvim",
}

function M.config()
   local ok, octo = pcall(require, "octo")
   if not ok then
      print("Error: " .. octo)
   end

   octo.setup({
      enable_builtin = true,
      default_remote = { "origin", "upstream" },
      picker = "telescope",
      default_to_projects_v2 = false,
      suppress_missing_scope = {
         projects_v2 = true,
      },
      ui = {
         -- show "modified" marks on the sign column
         use_signcolumn = false,
         -- show "modified" marks on the status column
         use_signstatus = true,
      },
      mappings_disable_default = true,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
