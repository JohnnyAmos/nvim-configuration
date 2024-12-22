-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Config file: $HOME/.config/nvim/lua/config/options.lua               ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-13 13:57


local bo = vim.bo
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt


opt.fileencoding = "UTF-8"

opt.mouse = "a"

-- The leaders must be loaded prior to loading lazy.nvim.

g.mapleader = "/"
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
opt.signcolumn = "yes:4"

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
opt.wildignorecase = true
opt.wildignore = {
   "*.bmp",
   "*.cbr",
   "*.cbz",
   "*.class",
   "*.divx",
   "*.dll",
   "*.exe",
   "*.flac",
   "*.gif",
   "*.ico",
   "*.jpeg",
   "*.jpg",
   "*.kgb",
   "*.m2ts",
   "*.mkv",
   "*.mov",
   "*.mp4",
   "*.mpeg",
   "*.mpg",
   "*.obj",
   "*.oga",
   "*.ogg",
   "*.otf",
   "*.out",
   "*.pdf",
   "*.png",
   "*.psd",
   "*.rar",
   "*.rbc",
   "*.tar.bz2",
   "*.tar.gz",
   "*.tar.xz",
   "*.toc",
   "*.ttf",
   "*.vob",
   "*.wav",
   "*.webm",
   "*.webp",
   "*.woff",
   ".",
   "..",
   ".DS_Store",
   "._*",
   ".ai",
   ".aux",
   ".avi",
   ".doc",
   ".eot",
   ".git",
   ".hg",
   ".lock",
   ".mp3",
   ".o",
   ".svn",
   ".swp",
   ".zip"
}

-- We'll have spaces in our indents.
opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3
opt.softtabstop = 3
opt.smartindent = true

-- Show the matched paren, brace, or bracket.
opt.showmatch = true

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

-- Undoing
opt.undofile = on
opt.undodir = "$XDG_STATE_HOME/nvim/undo"


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

