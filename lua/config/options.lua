-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Config file: $HOME/.config/nvim/lua/config/options.lua               ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-05-26 11:24

vim.opt.fileencoding = "UTF-8"

vim.opt.mouse = "a"

-- The leaders must be loaded prior to loading lazy.nvim.

vim.g.mapleader = " "
vim.g.maplocalleader = ""

-- These need to be set prior to loading colorscheme.
vim.g.have_nerd_font = true
vim.g.base16_colorspace = 256
vim.opt.termguicolors = true

-- Helpful guides
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Make room for helpful icons.
vim.opt.signcolumn = "yes:4"

-- Show helper symbols.
vim.opt.list = true
vim.opt.listchars = {
   tab = ">-",
   trail = "#",
   nbsp = "␣",
   extends = "»",
   precedes = "«",
   --  eol = "¦" -- Use sparingly, it"s truly annoying.
}
vim.opt.showbreak = "¤ "

-- Make with the line numbers
vim.opt.number = true
vim.opt.numberwidth = 2

-- Only show status line on last window
vim.opt.laststatus = 3

-- Wildcard expansion settings for the command line
-- opt.wildmode = "list,longest" -- default: "full"
vim.opt.wildignorecase = true
vim.opt.wildignore = {
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
   ".zip",
}

-- We'll have spaces in our indents.
vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.smartindent = true

-- Show the matched paren, brace, or bracket.
vim.opt.showmatch = true

-- Folding
vim.opt.foldenable = true
vim.opt.foldcolumn = "auto"
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{{{,}}}"
vim.opt.foldlevel = 99

-- Use system clipboard
vim.opt.clipboard = "unnamed" -- works better than unnamedplus for me

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tagcase = "smart"
vim.opt.inccommand = "split"

-- Screen splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "topline"

-- Scrolling
vim.opt.smoothscroll = true
vim.opt.scrolloff = 6

-- Undoing
vim.opt.undofile = true

-- No wrapping, thank you anyway
vim.opt.wrap = false

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
