--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/maps.lua
--    Last modified: 2024-09-29 11:28
-------------------------------------------------------------------------------


-- HACK: This was the biggest pain in the ass bit of code wrangling I have had
-- to deal with in a long time. It might have to do with my inexperience with
-- Lua, or some of Neovim's shenanigans. I tried vim.api.nvim_get_runtime_file;
-- vim.uv.fs_opendir, vim.uv.fs_readdir, etc; io.open, io.popen, etc;
-- plenary.nvim scan_dir. You get the idea. Also, the Lua patterns are no pcre.
-- This would have been so much easier in perl.
-- I recently saw a Neovim variant with configuration in another language
-- (Scheme maybe?) and I had the briefest thought about a Neovim variant with
-- configuration in perl. It's absurd, I know.
-- I do have the lrexlib-PCRE2 luarocks module installed, but I don't know how
-- to use it in Neovim, if it's even possible.

local paths = vim.split(vim.fn.glob(
   '~/.config/nvim/lua/config/modules/*lua'),
   '\n'
)
for _, filename in pairs(paths) do
   filename = string.gsub(
      filename,
      "/[^/]*/[^/]*/[^/]*/[^/]*/[^/]*/[^/]*/[^/]*/([%a%-]+).lua",
      "%1"
   )
   require("config.modules." .. filename).keys()
end

