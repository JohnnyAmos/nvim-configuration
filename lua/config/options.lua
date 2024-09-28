--JMJ----------------------------------✝︎---------------------------------AMDG--
--                      nvim options configuration file                      --
--                      Last Modified: 2024-09-26 18:06
-------------------------------------------------------------------------------

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.fileencoding = "UTF-8"

-- because sometimes I need to use a mouse
-- even if I would rather not use one
opt.mouse = "a"

-- leaders must be set before loading plugins
g.mapleader = " "
g.maplocalleader = ","

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

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

--[[  TODO: function update_hl should be in utils ]]--
local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( "force", old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( "Comment", { italic = false } )


-- helpful guides
opt.linebreak = on
opt.breakindent = on
opt.colorcolumn = "80"
opt.cursorline = true
opt.cursorlineopt = "number" -- "line" & "screenline" are the other options

-- make room for purdy pictures
opt.signcolumn = "yes:2"

-- Show helper symbols
opt.list = true
opt.listchars = {
   tab = ">-",
   trail = "#",
   nbsp = "␣",
   extends = "»",
   precedes = "«",
--  eol = "¦" -- use sparingly, it"s really annoying
}
opt.showbreak = "¤ "

-- make with the line numbers
opt.number = true
opt.numberwidth = 2

-- only show status line on last window
opt.laststatus = 3

-- wildcard expansion settings for the command line
-- opt.wildmode = "list,longest" -- default: "full"
opt.wildignorecase = on

--[[ SECTION: editing ]]--

opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3
opt.softtabstop = 3
opt.showmatch = true
opt.smartindent = true
opt.indentexpr = ""
opt.formatoptions = "cqt"
opt.formatexpr = ""

-- folding
opt.foldmethod = indent
-- opt.foldmarker = ""
-- opt.foldlevel = 99

-- backip and undo
opt.backup = false -- tried it, didn"t like it. may try it again
opt.undofile = true

-- use system clipboard
opt.clipboard = "unnamed"

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.tagcase = "smart"
opt.inccommand = "split"

-- screen splitting
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "topline"

-- scrolling
opt.smoothscroll = true
opt.scrolloff = 10

