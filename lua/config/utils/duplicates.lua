--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Utility file: $HOME/.config/nvim/lua/config/utils/duplicates.lua
-- Borrowed with modifications from xero harrison's dotfiles:
-- Source: https://github.com/xero/dotfiles/
-- Source license: CC0-1.0
-- Last Modified: 2024-10-10 00:40
-------------------------------------------------------------------------------


local functions = require("utils.functions")

local M = {}

local duplicates_n = {}
local duplicates_v = {}
local duplicates_i = {}
local duplicates_s = {}
local duplicates_x = {}

local function check_and_set_duplicates(input, description, check, table)
   if check then
      local found = table[input]

      if found ~= nil then
         if found ~= description then
            print(input .. " already mapped (" .. found .. " so we cannot re-map (" .. description .. ")")
         end
      end

      table[input] = description
   end
end

M.check_duplicates = function(type, input, description)
   local check_n = false
   local check_v = false
   local check_i = false
   local check_s = false
   local check_x = false

   if functions.is_table(type) then
      if type["n"] then
         check_n = true
      end
      if type["v"] then
         check_v = true
      end
      if type["i"] then
         check_i = true
      end
      if type["s"] then
         check_s = true
      end
      if type["x"] then
         check_x = true
      end
   else
      if type == "n" then
         check_n = true
      end
      if type == "v" then
         check_v = true
      end
      if type == "i" then
         check_i = true
      end
      if type == "s" then
         check_s = true
      end
      if type == "x" then
         check_x = true
      end
   end

   check_and_set_duplicates(input, description, check_n, duplicates_n)
   check_and_set_duplicates(input, description, check_v, duplicates_v)
   check_and_set_duplicates(input, description, check_i, duplicates_i)
   check_and_set_duplicates(input, description, check_s, duplicates_s)
   check_and_set_duplicates(input, description, check_x, duplicates_x)
end

return M
