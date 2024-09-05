-- nvim options configuration file
-- Last Modified: 2024-09-04 17:21

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
opt.textwidth = 79 -- Yes, I'm old fashioned.
opt.breakindent = on
opt.colorcolumn = '79'
opt.cursorline = true
opt.cursorlineopt = 'number' -- 'line' & 'screenline' are the other options

-- make room for purdy pictures
opt.signcolumn = 'yes:4'

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
opt.indentexpr = ''

-- folding
opt.foldmethod = indent
-- opt.foldmarker = ''
opt.foldlevel = 99

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

--[[ IDEA: This is an interesting alternative to todo-comments.nvim.
Much simpler, but at the loss of flexibility and customization.
The space after the first letter in each keyword is to stop
todo-comments.nvim from highlighting them. ]]--
-- vim.fn.matchadd("DiagnosticInfo", "\\(T ODO :\\)")
-- vim.fn.matchadd("DiagnosticWarn", "\\(H ACK:\\)")
-- vim.fn.matchadd("DiagnosticWarn", "\\(W ARN:\\)")
-- vim.fn.matchadd("DiagnosticWarn", "\\(W ARNING:\\)")
-- vim.fn.matchadd("DiagnosticWarn", "\\(X XX:\\)")
-- vim.fn.matchadd("Identifier", "\\(P ERF:\\)")
-- vim.fn.matchadd("Identifier", "\\(P ERFORMANCE:\\)")
-- vim.fn.matchadd("Identifier", "\\(O PTIM:\\)")
-- vim.fn.matchadd("Identifier", "\\(O PTIMIZE:\\)")
-- vim.fn.matchadd("DiagnosticHint", "\\(N OTE:\\)")
-- vim.fn.matchadd("Identifier", "\\(T EST:\\)")
-- vim.fn.matchadd("Identifier", "\\(T ESTING:\\)")
-- vim.fn.matchadd("Identifier", "\\(P ASSED:\\)")
-- vim.fn.matchadd("Identifier", "\\(F AILED:\\)")


-- vim: set sts=3 sw=3 ts=3 tw=79:

