-- ╔═JMJ══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞═══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- ║ Neovim configuration for Mac/Unix
-- ║ File: $HOME/.config/nvim/lua/config/lazy.lua
-- ║ Plugin source: https://github.com/folke/lazy.nvim
-- ║ Plugin license: Apache-2.0
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-10-23 23:26

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
   spec = {
      { import = "config.plugins" },
   },
   install = {
      colorscheme = { "base16-bright" }
   },
   checker = {
      enabled = true,
      notify = false
   },
   ui = {
      border = "single",
      backdrop = 0,
      icons = require("config.assets.icons").lazy()
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
   }
})

