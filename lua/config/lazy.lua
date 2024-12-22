-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                                                                       ║ --
-- ║                   Neovim configuration for Mac/unix                   ║ --
-- ║                         (Mac now, unix soon.)                         ║ --
-- ║                                                                       ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║                                                                       ║ --
-- ║   Config file: $HOME/.config/nvim/lua/config/lazy.lua                 ║ --
-- ║                                                                       ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-10 21:21

-- require(assets.icons)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazyrepo,
      lazypath
   })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   checker = {
      enabled = true,
      notify = true
   },
   install = {
      colorscheme = { "murphy" }
   },
   performance = {
      rtp = {
         disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "zipPlugin"
         }
      }
   },
   profiling = {
      loader = true,
      require = true
   },
   spec = {
      { import = "plugins" },
   },
   ui = {
      border = "single",
      backdrop = 0,
      icons = icons_lazy
   },
})

-- ╞════════════════════════╡   ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

