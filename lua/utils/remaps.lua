--JMJ----------------------------------✝︎---------------------------------AMDG--
--                             utils/remapslua                               --
--            With thanks to xero. For the original files, go to:            --
-- https://github.com/xero/dotfiles/tree/main/neovim/.config/nvim/lua/utils  --
--                      Last Modified: 2024-09-12 23:12
-------------------------------------------------------------------------------



local keymap = vim.keymap
local check_duplicates = require("utils.duplicates").check_duplicates
local M = {}
local wk_lazy = {}

local function lazy_register_wk(input)
   table.insert(wk_lazy, input)
end

local function add_wk(input)
   local wk_ready, wk = pcall(require, "which-key")
   if wk_ready and wk.did_setup then
      if wk_lazy ~= {} then
         lazy_register_wk(input)
         wk.add(wk_lazy)
         wk_lazy = {}
      end
   else
      lazy_register_wk(input)
   end
end

function M.map(type, input, output, description, additional_options)
   local options = { remap = true, desc = description }
   if additional_options then
      options = vim.tbl_deep_extend("force", options, additional_options)
   end
   keymap.set(type, input, output, options)
   check_duplicates(type, input, description)
end

function M.noremap(type, input, output, description, additional_options)
   local options = { remap = false }
   if additional_options then
      options = vim.tbl_deep_extend("force", options, additional_options)
   end
   M.map(type, input, output, description, options)
end

function M.map_virtual(input)
   add_wk(input)
end

return M

