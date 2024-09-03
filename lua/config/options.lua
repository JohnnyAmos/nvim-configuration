-- nvim options configuration file
-- Last Modified: 2024-09-01 18:24

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

-- TODO: uncomment the following lines when base16-vim is installed
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

  -- I think that this is what causes the colors to change on refocus.
  -- Let's test it.
--   vim.api.nvim_create_autocmd("FocusGained", {
--     callback = handle_focus_gained,
--   })
end

-- set text width and show helpful quides 
opt.textwidth = 79 -- Yes, I'm old fashioned.
opt.colorcolumn = '79'
opt.cursorline = true
opt.cursorlineopt = 'number' -- 'line' & 'screenline' are the other options

-- make room for purdy pictures
opt.signcolumn = 'yes'

-- Show helper symbols
opt.list = true
opt.listchars = {
  tab = '->',
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
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.showmatch = true
opt.smartindent = true

-- backip and undo
opt.backup = true
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

-- TODO: delete nodline when nvim is finally set up
-- vim: set ts=2 sts=2 sw=2: --

