-- options.lua
-- nvim options configuration file
-- Last Modified: 2024-09-09 22:20

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.fileencoding = 'UTF-8'

-- because sometimes I need to use a mouse
-- even if I would rather not use one
opt.mouse = "a"

-- leaders must be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--[[ SECTION: Themes & Schemes ]]--

g.have_nerd_font = true
g.base16_colorspace = 256

opt.termguicolors = true

local theme_script_path = vim.fn.expand(
   "~/Library/Application Support/tinted-theming/tinty/base16-vim-colors-file.vim"
)

local function file_exists(file_path)
   return vim.fn.filereadable(file_path) == 1 and true or false
end

local function handle_focus_gained()
   if file_exists(theme_script_path) then
      cmd("source " .. theme_script_path)
   end
end

if file_exists(theme_script_path) then
   g.tinted_colorspace = 256
   cmd("source " .. theme_script_path)
end

-- set text width and show helpful quides 
-- opt.textwidth = 79 -- Yes, I'm old fashioned. Turned off because I don't like hard wrap and I prefer to decide how my code gets formatted.
opt.linebreak = on
opt.breakindent = on
opt.colorcolumn = '80'
opt.cursorline = true
opt.cursorlineopt = 'number' -- 'line' & 'screenline' are the other options

-- make room for purdy pictures
opt.signcolumn = 'yes:2'

-- Show helper symbols
opt.list = true
opt.listchars = {
   tab = '>-',
   trail = '#',
   nbsp = '␣',
   extends = '»',
   precedes = '«',
--  eol = '¦' -- use sparingly, it's really annoying
}
opt.showbreak = '¤ '

-- make with the line numbers
opt.number = true
opt.numberwidth = 2

-- only show status line on last window
opt.laststatus = 3

-- wildcard expansion settings for the command line
-- opt.wildmode = 'list,longest' -- default: 'full'
opt.wildignorecase = on

--[[ SECTION: editing ]]--

opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3
opt.softtabstop = 3
opt.showmatch = true
opt.smartindent = true
opt.indentexpr = ''
opt.formatoptions = 'cqt'
opt.formatexpr = ''

-- folding
opt.foldmethod = indent
-- opt.foldmarker = ''
-- opt.foldlevel = 99

-- backip and undo
opt.backup = false -- tried it, didn't like it. may try it again
opt.undofile = true

-- use system clipboard
opt.clipboard = 'unnamed'

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.tagcase = 'smart'
opt.inccommand = 'split'

-- screen splitting
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'topline'

-- scrolling
opt.smoothscroll = true
opt.scrolloff = 10

-- vim: set sts=3 sw=3 ts=3 tw=79:

