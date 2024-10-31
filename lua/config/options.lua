--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- File: $HOME/.config/nvim/lua/config/options.lua
-- Last modified: 2024-10-30 22:15
-------------------------------------------------------------------------------

local bo = vim.bo
local g = vim.g
local opt = vim.opt

opt.fileencoding = "UTF-8"

opt.mouse = "a"

-- The leaders must be loaded prior to loading lazy.nvim.
g.mapleader = "`"
g.maplocalleader = ""

-- These need to be set prior to loading colorscheme.
g.have_nerd_font = true
g.base16_colorspace = 256
opt.termguicolors = true

-- Helpful guides
opt.linebreak = true
opt.breakindent = true
opt.colorcolumn = "80"
opt.cursorline = true
opt.cursorlineopt = "number"

-- Make room for helpful icons.
opt.signcolumn = "yes:2"

-- Show helper symbols.
opt.list = true
opt.listchars = {
   tab = ">-",
   trail = "#",
   nbsp = "␣",
   extends = "»",
   precedes = "«",
--  eol = "¦" -- Use sparingly, it"s truly annoying.
}
opt.showbreak = "¤ "

-- Make with the line numbers
opt.number = true
opt.numberwidth = 2

-- Only show status line on last window
opt.laststatus = 3

-- Wildcard expansion settings for the command line
-- opt.wildmode = "list,longest" -- default: "full"
opt.wildignorecase = on

opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3
opt.softtabstop = 3
opt.showmatch = true
opt.smartindent = true

-- Folding
if bo.filetype ~= "help" then
   opt.foldenable = off
elseif bo.filetype ~= "terminal" then
   opt.foldenable = off
end
opt.foldenable = on
opt.foldcolumn = "auto"
opt.foldmethod = indent
-- opt.foldmarker = ""
opt.foldlevel = 99

-- Use system clipboard
opt.clipboard = "unnamed" -- works better than unnamedplus for me

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.tagcase = "smart"
opt.inccommand = "split"

-- Screen splitting
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "topline"

-- Scrolling
opt.smoothscroll = true
opt.scrolloff = 6

