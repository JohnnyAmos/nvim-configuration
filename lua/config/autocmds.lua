--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- File: $HOME/.config/nvim/lua/config/autocmds.lua
-- Last modified: 2024-09-29 11:28
-------------------------------------------------------------------------------


local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup

-- Save/load fold info with mkview & loadview
aucmd({ "BufWritePre" }, {
   desc = "Save folds",
   pattern = "*.*",
   callback = function()
      vim.cmd("mkview 1")
   end
})
aucmd({ "BufEnter", "BufWinEnter" }, {
   desc = "Restore folds",
   pattern = "*.*",
   callback = function()
      vim.cmd("silent! loadview 1")
   end
})

-- Reload files changed outside of Vim not currently modified in Vim
aucmd({ "FocusGained", "BufEnter", "WinEnter" }, {
   group = augrp("General autoread", {}),
   callback = function()
      if vim.api.nvim_get_option_value("buftype", {}) ~= "" then return end
      vim.api.nvim_command("silent! checktime")
   end,
   desc = "perform a read when entering a new buffer",
})

-- Don't auto-comment new lines.
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- highlight text on yank
aucmd(
   "TextYankPost", {
      group = augrp("highlight_yank", {}),
      desc = "Hightlight selection on yank",
      pattern = "*",
      callback = function()
         vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
      end,
   }
)

-- Make nvim stop loading files in insert mode.
aucmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

