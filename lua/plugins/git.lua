-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/git.lua                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-18 15:29


return {

-- ╞═╡ PLUGIN: gitsigns.nvim ╞═════════════════════════════════════════════╡ --

   {
      "lewis6991/gitsigns.nvim",
      opts = {
         signs = icons_gitsigns,
         signs_staged = icons_gitsigns_staged,
         signs_staged_enable = true,
         word_diff = true,
         watch_gitdir = {
            follow_files = true
         },
         attach_to_untracked = true,
      }
   },

-- ╞═╡ PLUGIN: octo.nvim ╞═════════════════════════════════════════════════╡ --

   {
      "pwntester/octo.nvim",
      opts = {
         enable_builtin = true,
         default_remote = {"origin", "upstream"},
         picker = "telescope",
         default_to_projects_v2 = false,
         suppress_missing_scope = {
            projects_v2 = true
         },
         ui = {
            -- show "modified" marks on the sign column
            use_signcolumn = false,
            -- show "modified" marks on the status column
            use_signstatus = true,
         },
         mappings_disable_default = true,
      }
   }

}


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

