--[[ TODO: place comment header ]]--

local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup

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
  'TextYankPost', {
    group = augrp('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
  }
)

-- TODO: delete modline when nvim is set up
-- vim: set ts=2 sts=2 sw=2: --

