-- ╔═JMJ══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞═══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-11-26 22:53

--[[

   WARN: This is a complete mess of several incomplete implementations being
   melded together to make an efficient and extensive nvim configuration
   that works for my particular and peculiar needs. The cheese is being
   moved on the regular. The maze walls are want to dissappear, which is a
   good thing, but so are the floors, so watch your step.

--]]

--[[ ══════════════════════════════════════════════════════════════════════════

      TODO: Continue configuration of nvim.

      FIX: Undo is not working at all. Why?

      Keymaps:

         -  Arrange core maps as close to asciibetical (or utf-8) order as
            possible.
         -  Get all the keymaps out of specs and with the rest of the maps if
            it means modifying source code and submitting pull requests.

      Plugins in need of configuration:

         -  conform.nvim
         -  edgy.nvim:
            -  Change config to new terminal plugin.
         -  gitsigns.nvim:
            -  Set proper keymaps.
            -  Current keymaps are temporary.
         -  telescope.nvim:
            -  Move border icons to icon section.
            -  Consider furthur configuration options.
            -  Explore other extensions.
            -  Determine the best possible options for the extensions.
         -  todo-comments.nvim:
            -  Multiline needs fixed.
            -  Needs better patterns - pcre2?
         -  toggleterm.nvim:
            -  change, or not
         -  yanky.nvim:
            -  There are eleven yanky `put` keymap commands set. There are a
               total of eighty-four commands available. Determine if there is a
               need for any of the others, or if any of the currently set maps
               are unnecessary. Although, writing eighty-four keymaps that may
               never be used could be lots of fun (for somebody).

      Make with the abbreviations:

         -  https://github.com/tpope/vim-abolish
         -  https://github.com/0styx0/abbreinder.nvim
         -  https://github.com/0styx0/abbremand.nvim
         -  Consider other plugins/solutions.

══════════════════════════════════════════════════════════════════════════ --]]


vim.loader.enable()

local api = vim.api
local aucmd = api.nvim_create_autocmd
local augrp = api.nvim_create_augroup
local bo = vim.bo
local cmd = vim.cmd
local bo = vim.bo
local fn = vim.fn
local g = vim.g
local lsp = vim.lsp
local opt = vim.opt



-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION: OPTIONS                                                     ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --

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
undofile = on
undodir = "$XDG_STATE_HOME/nvim/undo"


-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION:  AUTOCOMMANDS                                               ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --

-- Save/load folds with mkview & loadview.
augrp("Folds", { clear = true })
aucmd({ "BufWritePre" }, {
   group = "Folds",
   desc = "Save folds",
   pattern = "*.*",
   callback = function()
      cmd("mkview 1")
   end
})
aucmd({ "BufEnter", "BufWinEnter" }, {
   group = "Folds",
   desc = "Restore folds",
   pattern = "*.*",
   callback = function()
      cmd("silent! loadview 1")
   end
})

augrp("Help", { clear = true })
aucmd('FileType', {
  pattern = {'help', 'man'},
  group = "Help",
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- Set cwd to the buffer directory. This means that the filename that is
-- displayed in the statusline doesn't include any of the path.
-- I wonder how long it will take before this becomes a problem.
augrp("WorkingDirectory", { clear = true })
aucmd({ "BufEnter" }, {
  group = "WorkingDirectory",
  pattern = { "*.*" },
  callback = function()
    local path = fn.expand('%:h')..'/'
    path = "cd "..path
    api.nvim_command(path)
  end
})

-- Reload files changed outside of nvim not currently modified in nvim.
augrp( "General autoread", {})
aucmd({ "FocusGained", "BufEnter", "WinEnter" }, {
   group = "General autoread",
   callback = function()
      if api.nvim_get_option_value("buftype", {}) ~= "" then return end
      api.nvim_command("silent! checktime")
   end,
   desc = "perform a read when entering a new buffer"
})

-- Don't auto-comment new lines. This may cause problems. Is the convenience
-- worth the potential hassle.
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Highlight text on yank.
augrp( "highlight_yank", {})
aucmd({ "TextYankPost" }, {
      group = "highlight_yank",
      pattern = "*",
      callback = function()
         vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
      end,
      desc = "Hightlight selection on yank"
})

-- Make nvim stop loading files in insert mode.
aucmd("WinLeave", {
   callback = function()
      if bo.ft == "TelescopePrompt" and fn.mode() == "i" then
         api.nvim_feedkeys(
            api.nvim_replace_termcodes(
               "<Esc>",
               true,
               false,
               true
            ),
            "i", false
         )
      end
   end,
})

---@param on_attach fun(client, buffer)
function on_attach(on_attach)
   api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
         local buffer = args.buf
         local client = lsp.get_client_by_id(args.data.client_id)
         on_attach(client, buffer)
      end
   })
end

-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION:                                                             ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --




-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION: ICONS                                                       ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Borrowed with modifications from xero harrison's dotfiles:           ║ --
-- ║  Source: https://github.com/xero/dotfiles/                            ║ --
-- ║  Source license: CC0-1.0                                              ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --



-- ╞═╡  SUBSECTION: icons_gitsigns (for gitsigns.nvim) ╞═══════════════════╡ --

icons_gitsigns = {
   add = { text = '┃' },
   change = { text = '┃' },
   delete = { text = '_' },
   topdelete = { text = '‾' },
   changedelete = { text = '~' },
   untracked = { text = '┆' }
}

-- ╞═╡  SUBSECTION: icons_gitsigns_staged (for gitsigns.nvim) ╞════════════╡ --

icons_gitsigns_staged = {
   add = { text = '┃' },
   change = { text = '┃' },
   delete = { text = '_' },
   topdelete = { text = '‾' },
   changedelete = { text = '~' },
   untracked = { text = '┆' }
}

-- ╞═╡  SUBSECTION: icons_lualine_ff_symbols (for lualine.nvim) ╞══════════╡ --

icons_lualine_ff_symbols = {
   unix = ' ',
   dos = ' ',
   mac = ' '
}

-- ╞═╡  SUBSECTION: icons_mason_ui (for mason.nvim) ╞══════════════════════╡ --

icons_mason_ui = {
   package_installed = "✓",   -- ⎧ "󱄲" ⎫  xero's icons: preserved here
   package_pending = "➜",     -- ⎨ "󱄰" ⎬  because I may choose to use
   package_uninstalled = "✗"  -- ⎩ "󱄯" ⎭  them.
}

-- ╞═╡  SUBSECTION: icons_diagnostics ╞════════════════════════════════════╡ --

-- icons_diagnostics = {
--    error = " ",
--    hint = " ",
--    information = " ",
--    other = " ",
--    warning = " "
-- }

-- ╞═╡  SUBSECTION: icons_git ╞════════════════════════════════════════════╡ --

-- icons_git = {
--    Added = " ",
--    Modified = " ",
--    Removed = " "
-- }

-- ╞═╡  SUBSECTION: icons_dap ╞════════════════════════════════════════════╡ --

-- icons_dap = {
--    breakpoint = " ",
--    breakpoint_condition = " ",
--    log_point = " ",
--    stopped = " ",
--    breakpoint_rejected = " ",
--    pause = " ",
--    play = " ",
--    step_into = " ",
--    step_over = " ",
--    step_out = " ",
--    step_back = " ",
--    run_last = " ",
--    terminate = " "
-- }

-- ╞═╡  SUBSECTION: icons_lazy (for lazy.nvim) ╞═══════════════════════════╡ --

icons_lazy = {
   cmd = " ",
   config = "",
   event = "",
   ft = " ",
   init = " ",
   import = " ",
   keys = " ",
   lazy = "󰒲 ",
   loaded = "󱄲",
   not_loaded = "󱄯",
   plugin = " ",
   runtime = " ",
   source = " ",
   start = "",
   task = "✔ ",
   list = {
      "󱄰",
      "➜",
      "★",
      "‒"
   }
}

-- ╞═╡  SUBSECTION:  icons_trouble (for trouble.nvim) ╞════════════════════╡ --

-- icons_trouble = {
--    indent = {
--       top = "┊ ",
--       middle = "├╴",
--       last = "└╴",
--       fold_open = " ",
--       fold_closed = " ",
--       ws = "  "
--    },
--    folder_closed = " ",
--    folder_open = " ",
--    kinds = {
--       Array = " ",
--       Boolean = "󰨙 ",
--       Class = " ",
--       Constant = "󰏿 ",
--       Constructor = " ",
--       Enum = " ",
--       EnumMember = " ",
--       Event = " ",
--       Field = " ",
--       File = " ",
--       Function = "󰊕 ",
--       Interface = " ",
--       Key = " ",
--       Method = "󰊕 ",
--       Module = " ",
--       Namespace = "󰦮 ",
--       Null = " ",
--       Number = "󰎠 ",
--       Object = " ",
--       Operator = " ",
--       Package = " ",
--       Property = " ",
--       String = " ",
--       Struct = "󰆼 ",
--       TypeParameter = " ",
--       Variable = "󰀫 "
--    }
-- }

-- ╞═╡  FUNCTION: borders() ╞══════════════════════════════════════════════╡ --

-- icons_borders = {
--    dashed = { "┄", "┊", "┄", "┊", "╭", "╮", "╯", "╰", },
--    double = { "═", "║", "═", "║", "╔", "╗", "╝", "╚", },
--    single = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    blocks = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
--    blocky = { "▀", "▐", "▄", "▌", "▄", "▄", "▓", "▀", }
-- }

-- ╞═╡  SUBSECTION:  icons_telescope (for telescope.nvim) ╞════════════════╡ --

-- icons_telescope = {
--    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    results = { "─", " ", "─", "│", "╭", "─", "─", "╰", },
--    preview = { "─", "│", "─", "│", "─", "╮", "╯", "╰", }
-- }

-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION: PLUGINS                                                     ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --


local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
   install = {
      colorscheme = { "base16-bright" }
   },
   checker = {
      enabled = true,
      notify = false
   },
   ui = {
      border = "single",
      backdrop = 0,
      icons = icons_lazy
   },
   performance = {
      rtp = {
         disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "zipPlugin"
         }
      }
   },
   profiling = {
      loader = true,
      require = true
   }

}

lazy.setup({


   -- ╞═╡ PLUGIN: base16-nvim ╞════════════════════════════════════════╡ --

   {
      "RRethy/base16-nvim",
      config = function()
         vim.cmd("colorscheme base16-bright")
      end
   },

   -- ╞═╡ PLUGIN: Comment.nvim ╞════════════════════════════════════════╡ --

   { "numToStr/Comment.nvim" },

   -- ╞═╡ PLUGIN: browser-bokmarks.nvim ╞═══════════════════════════════╡ --

   {
      "dhruvmanila/browser-bookmarks.nvim",
      version = "*",
      dependencies = { "nvim-telescope/telescope.nvim" },
      opts = {
         selected_browser = 'vivaldi'
      }
   },

   -- ╞═╡ PLUGIN: cmp-buffer ╞══════════════════════════════════════════╡ --

   { "hrsh7th/cmp-buffer" },

   -- ╞═╡ PLUGIN: cmp-nvim-lsp ╞════════════════════════════════════════╡ --

   { "hrsh7th/cmp-nvim-lsp" },

   -- ╞═╡ PLUGIN: cmp-path ╞════════════════════════════════════════════╡ --

   { "hrsh7th/cmp-path" },



   -- ╞═╡ PLUGIN: command-completion.nvim ╞═════════════════════════════╡ --

   {
      "smolck/command-completion.nvim",
      opts = {
         border = single,
         max_col_num = 3,
         min_col_width = 25,
         use_matchfuzzy = false
      }
   },

   -- ╞═╡ PLUGIN: conform.nvim ╞════════════════════════════════════════╡ --

   {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      cmd = "ConformInfo",
      opts = {
         formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true }
         },
         default_format_opts = {
            lsp_format = "fallback"
         },
      },
      init = function()
         vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
      end
   },

   -- ╞═╡ PLUGIN: csvvview.nvim ╞═══════════════════════════════════════╡ --

   { "hat0uma/csvview.nvim" },

   -- ╞═╡ PLUGIN: custom-theme.nvim ╞═══════════════════════════════════╡ --

   {
      "Djancyp/custom-theme.nvim",
      config = function()
         require("custom-theme").setup()
      end
   },

   -- ╞═╡ PLUGIN: dressing.nvim ╞═══════════════════════════════════════╡ --

   { "stevearc/dressing.nvim" },

   -- ╞═╡ PLUGIN: edgy.nvim ╞═══════════════════════════════════════════╡ --

   {
      "folke/edgy.nvim",
      event = "VeryLazy",
      opts = {
         bottom = {
            {
               ft = "toggleterm",
               size = { height = 0.4 },
               filter = function(buf, win)
                  return vim.api.nvim_win_get_config(win).relative == ""
               end
            },
            "Trouble",
            { ft = "qf", title = "QuickFix" }
         },
         left = {
            {
               title = "Files",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "filesystem"
               end,
               size = { height = 0.5 }
            },
            {
               title = "Git",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "git_status"
               end,
               pinned = true,
               collapsed = true, -- show window as collapsed on start
               open = "Neotree position=right git_status"
            },
            {
               title = "Buffers",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "buffers"
               end,
               pinned = true,
               collapsed = true, -- show window as collapsed on start
               open = "Neotree position=top buffers"
            },
            {
               title = function()
                  local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
                  return vim.fn.fnamemodify(buf_name, ":t")
               end,
               ft = "Outline",
               pinned = true,
               open = "SymbolsOutlineOpen"
            },
            -- any other neo-tree windows
            "neo-tree"
         },
         right = {
            {
               ft = "help",
               filter = function(buf)
                  return vim.bo[buf].buftype == "help"
               end
            }
         }
      }
   },

   -- ╞═╡ PLUGIN: flash.nvim ╞══════════════════════════════════════════╡ --

   {
      "folke/flash.nvim",
      event = 'VeryLazy',
      opts = {
         -- Ordered thusly because it places the home row keys first, with the
         -- top second and the bottom third.
         labels = "asdfghjklqwertyuiopzxcvbnm",
         search = {
            mode = "search",
            incremental = true
         },
      }
   },

   -- ╞═╡ PLUGIN: fortune.nvim ╞════════════════════════════════════════╡ --

   { "fecet/fortune.nvim" },

   -- ╞═╡ PLUGIN: friendly-snippets ╞═══════════════════════════════════╡ --

   { "rafamadriz/friendly-snippets"},

   -- ╞═╡ PLUGIN: gitsigns.nvim ╞═══════════════════════════════════════╡ --

   {
      "lewis6991/gitsigns.nvim",
      opts = {
         signs = icons_gitsigns,
         signs_staged = icons_gitsigns_staged,
         signs_staged_enable = true,
         word_diff = true,
         watch_gitdir = {
            follow_files = true
         },
         attach_to_untracked = true,
      }
   },

   -- ╞═╡ PLUGIN: grug-far.nvim ╞═══════════════════════════════════════╡ --

   { "MagicDuck/grug-far.nvim" },

   -- ╞═╡ PLUGIN: lazydev.nvim ╞════════════════════════════════════════╡ --

   {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
         library = {
            {
               path = "luvit-meta/library",
               words = { "vim%.uv" }
            }
         },
         integrations = {
            lspconfig = true,
            cmp = true,
         }

      }
   },

   -- ╞═╡ PLUGIN: lualine.nvim ╞════════════════════════════════════════╡ --

   {
      "nvim-lualine/lualine.nvim",
      opts = {
         theme = "base16",
         globalstatus = true
      },
      sections = {
         lualine_a = { "mode" },
         lualine_b = { "branch", "diff", "diagnostics" },
         lualine_c = {
            {
               "filename",
               path = 1
            }
         },
         lualine_x = {
            "encoding",
            {
               "fileformat",
               symbols = icons_lualine_ff_symbols
            },
            "filetype",
            "filesize"
         },
         lualine_z = {
            "location",
            "tabs" ,
            {
               "windows",
               mode = 1,
               show_modified_status = true
            }
         }
      },
      tabline = {
         lualine_a = {
            {
               "buffers",
               max_length = vim.o.columns * 3 / 4,
               mode = 4
            }
         },
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {
            {
               "tabs",
               max_length = vim.o.columns / 4,
               mode = 0
            }
         }
      }
   },

   -- ╞═╡ PLUGIN: luvit-meta ╞══════════════════════════════════════════╡ --

   { "Bilal2453/luvit-meta", lazy = true },

   -- ╞═╡ PLUGIN: marks.nvim ╞══════════════════════════════════════════╡ --

   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {
         default_mappings = false,
         force_write_shada = true,
         sign_priority = 10
      }
   },

   -- ╞═╡ PLUGIN: mason-lspconfig.nvim ╞════════════════════════════════╡ --

   { "williamboman/mason-lspconfig.nvim", },

   -- ╞═╡ PLUGIN: mason.nvim ╞══════════════════════════════════════════╡ --

   {
      "williamboman/mason.nvim",
      opts = {
         PATH = 'skip',
         border = 'single',
         ui = {
            icons = icons_mason_ui,
         }
      }
   },

   -- ╞═╡ PLUGIN: mini.nvim ╞═══════════════════════════════════════════╡ --

   {
      "echasnovski/mini.nvim",
      version = false,
      config = function()

         -- mini.align
         require("mini.align").setup()

         -- mini.bracketed
         require("mini.bracketed").setup()

         -- mini.cursorword
         -- I'm of two minds about this one. It can be useful, and it can be
         -- very annoying. The trait it exhibits most wins.
         require("mini.cursorword").setup()

         -- mini.icons
         require("mini.icons").setup()

         -- mini.jump
         require("mini.jump").setup()

         -- mini.junp2d
         require("mini.jump2d").setup({
            mappings = {
               start_jumping = "\\",
            },
         })

         -- mini.misc
         -- I know it's just a box, but it's a nice box and I might need it
         -- someday. I just hope I can remember where I put it when I need it.
         require("mini.misc").setup()

         -- mini.move
         require("mini.move").setup({
            mappings = {
               -- Move visual selection in Visual mode.
               -- Defaults are Alt (Meta) + hjkl.
               left = '<ca-h>',
               right = '<ca-l>',
               down = '<ca-j>',
               up = '<ca-k>',
               -- Move current line in Normal mode
               line_left = '<a-h>',
               line_right = '<a-l>',
               line_down = '<a-j>',
               line_up = '<a-k>',
            },
         })

         -- mini.pairs
         require("mini.pairs").setup({
            mappings = {
               -- Prevent the addition of the closing symbol when opening
               -- symbol is to the left of any non-space character or to the
               -- immediate right of "\".
               ["("] = {
                  action = "open",
                  pair = "()",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               ["["] = {
                  action = "open",
                  pair = "[]",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               ["{"] = {
                  action = "open",
                  pair = "{}",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               -- This is default (prevents the action if the cursor is just
               -- next to a "\").
               [")"] = {
                  action = "close",
                  pair = "()",
                  neigh_pattern = "[^\\]."
               },
               ["]"] = {
                  action = "close",
                  pair = "[]",
                  neigh_pattern = "[^\\]."
               },
               ["}"] = {
                  action = "close",
                  pair = "{}",
                  neigh_pattern = "[^\\]."
               },
               -- Prevents the action if the cursor is just before or next to
               -- any character.
               ['"'] = {
                  action = "closeopen",
                  pair = '""',
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
               ["'"] = {
                  action = "closeopen",
                  pair = "''",
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
               ["`"] = {
                  action = "closeopen",
                  pair = "``",
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
            },
         })

         -- mini.sessions
         -- TODO: See if there are any keymaps that can be used, or make some
         require("mini.sessions").setup()

         -- mini.starter
         local logo = table.concat({
            [[,----------------------------------------------------,]],
            [[| [][][][][]  [][][][][]  [][][][]  [][__]  [][][][] |]],
            [[|                                                    |]],
            [[|  [][][][][][][][][][][][][][_]    [][][]  [][][][] |]],
            [[|  [_][][][][][][][][][][][][][ |   [][][]  [][][][] |]],
            [[| [][_][][][][][][][][][][][][]||     []    [][][][] |]],
            [[| [__][][][][][][][][][][][][__]    [][][]  [][][]|| |]],
            [[|   [__][________________][__]              [__][]|| |]],
            [[`----------------------------------------------------"]],
         }, "\n")
         local pad = string.rep(" ", 1)
         local new_section = function(name, action, section)
            return {
               name = name,
               action = action,
               section = pad .. section
            }
         end

         -- TODO: Add fortune and stats to footer and put the cow back
         -- in the header.
         local starter = require("mini.starter")
         starter.setup({
            evaluating_single = true,
            header = logo,
            items = {
               {
                  action = "ene | startinsert",
                  name = "New File",
                  section = "Files"
               },
               {
                  action = "Telescope oldfiles",
                  name = "Recent Files",
                  section = "Files"
               },
               {
                  action = "Telescope find_files",
                  name = "Find Files",
                  section = "Files"
               },
               {
                  action = "Telescope file_browser",
                  name = "Browser",
                  section = "Files"
               },
               {
                  action = "Telescope live_grep",
                  name = "Live Grep",
                  section = "Search"
               },
               {
                  action = "Telescope command_history",
                  name = "Command History",
                  section = "Search"
               },
               {
                  action = "Telescope repo list",
                  name = "Git Repos",
                  section = "Projects"
               },
               starter.sections.sessions(5, true),
               {
                  action = "Telescope man_pages",
                  name = "Man Pages",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope help_tags",
                  name = "Help tags",
                  section = "Reference/Config"
               },
               {
                  action = "Lazy",
                  name = "Plugins",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope colorscheme",
                  name = "Schémas de Couleurs",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope bookmarks",
                  name = "Vivaldi Bookmarks",
                  section = "Internet Resources"
               },
               {
                  action = "qa",
                  name = "Quit",
                  section = "Exit"
               },
            },
            -- footer = footer,
            content_hooks = {
               starter.gen_hook.adding_bullet("░ ☞  "),
               starter.gen_hook.aligning("center", "center"),
               starter.gen_hook.indexing("all", {
                  "Files",
                  "Search",
                  "Projects",
                  "Reference/Config",
                  "Internet Resources",
                  "Exit"
               })
            }
         })

         -- mini.visits
         require("mini.visits").setup()

      end

   },

   --[[

      NOTE: The unused mini.nvim modules.

      TODO: I haven't tried these modules yet:

         mini.hues      mini.test      mini.colors    mini.trailspace

      If I get around to writing a plugin or two I might need mini.doc.

      I don't have a need for these modules:

         mini.basics      mini.extra       mini.map         mini.operators

      I am using other plugins for these purposes:

         instead of:      I'm using:

         mini.ai          nvim-treesitter-textobject

         mini.base16      tinty  TODO: tinty's out. Time to reconsider mini.base16

         mini.clu         which-key.nvim

         mini.completion  nvim-cmp

         mini.deps        lazy.nvim

         mini.diff        gitsigns.nvim

         mini.files       neo-tree.nvim

         mini.fuzzy       telescope-fzf-native.nvim

         mini.git         gitsigns.nvim

         mini.hipatterns  todo-comments.nvim

         mini.notify      nvim-notify (I'm using neither at the moment.)

         mini.pick        telescope.nvim

         mini.splitjoin   treesj

         mini.statusline  lualine.nvim

         mini.surround    nvim-surround

         mini.tabline     lualine.nvim

      As regards mini.comment: It does one thing at a time. It does it very
      well. And then… It moves on. I, however, needed more than one thing.
      So I moved on.

      As for mini.bufremove: it's been a long time since I used vim, and I
      am new to nvim, and I don't get the point of this one. Maybe in time.
      ¯\_(ツ)_/¯

      And Finally, firmly in the no-thank-you category:

         mini.animate: ʕ ͡° ʖ̯ ͡°ʔノ Eww, apparantly I am not a fan of flying
        cursors.

         mini.indentscope: This is even worse than the animated cursor. It
         is terribly annoying. (ಠ_ಠ)

   --]]

   -- ╞═╡ PLUGIN: neo-tree.nvim ╞═══════════════════════════════════════╡ --

   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      opts = {
         add_blank_line_at_top = true,
         auto_clean_after_session_restore = true,
         -- "trace", "debug", "info", "warn", "error", "fatal"
         log_level = "info",
         -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
         log_to_file = '$HOME/.config/nvim/.logs/neotree.log',
         -- "double", "none", "rounded", "shadow", "single" or "solid"
         popup_border_style = "single",
         -- used when sorting files and directories in the tree
         sort_case_insensitive = false,
         use_default_mappings = false,
         window = {
            -- left, right, top, bottom, float, current
            position = "left",
            -- applies to left and right positions
            width = 40,
            auto_expand_width = true,
            insert_as = "child",
         },
         filesystem = {
            async_directory_scan = "auto",
            scan_mode = "shallow",
            bind_to_cwd = true,
            filtered_items = {
               visible = true,
               force_visible_in_empty_folder = true,
               hide_dotfiles = false,
            },
            hijack_netrw_behavior = "open_default",
         },
      }
   },

   -- ╞═╡ PLUGIN: neoconf.nvim ╞════════════════════════════════════════╡ --

   { "folke/neoconf.nvim", cmd = 'Neoconf' },

   -- ╞═╡ PLUGIN: none-ls.nvim ╞════════════════════════════════════════╡ --

   { "nvimtools/none-ls.nvim" },

   -- ╞═╡ PLUGIN: nui.nvim ╞════════════════════════════════════════════╡ --

   { "MunifTanjim/nui.nvim" },

   -- ╞═╡ PLUGIN: nvim-cmp ╞════════════════════════════════════════════╡ --

   { "hrsh7th/nvim-cmp" },

   -- ╞═╡ PLUGIN: nvim-colorizer ╞══════════════════════════════════════╡ --

   { "norcalli/nvim-colorizer.lua" },

   -- ╞═╡ PLUGIN: nvim-comment-frame ╞══════════════════════════════════╡ --

   { "s1n7ax/nvim-comment-frame" },

   -- ╞═╡ PLUGIN: nvim-dap ╞════════════════════════════════════════════╡ --

   { "mfussenegger/nvim-dap" },

   -- ╞═╡ PLUGIN: nvim-dap-ui ╞═════════════════════════════════════════╡ --

   { "rcarriga/nvim-dap-ui" },

   -- ╞═╡ PLUGIN: nvim-lspconfig ╞══════════════════════════════════════╡ --

   { "neovim/nvim-lspconfig" },

   -- ╞═╡ PLUGIN: nvim-nio ╞════════════════════════════════════════════╡ --

   { "nvim-neotest/nvim-nio" },

   -- ╞═╡ PLUGIN: nvim-surround ╞═══════════════════════════════════════╡ --

   { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },

   -- ╞═╡ PLUGIN: nvim-treesitter ╞═════════════════════════════════════╡ --

   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
         "RRethy/nvim-treesitter-endwise"
      },
      build = function()
         require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      vim.treesitter.language.register('markdown', 'octo'),
      opts = {
         auto_install = true,
         highlight = { enable = true },
         indent = { enable = true },
         ensure_installed = {
            "arduino",
            "astro",
            "authzed",
            "bash",
            "c",
            "cpp",
            "css",
            "csv",
            "diff",
            "dtd",
            "editorconfig",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitigniore",
            "glimmer",
            "glimmer_javascript",
            "html",
            "http",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "ledger",
            "lua",
            "luadocs",
            "luap",
            "markdown",
            "mermaid",
            "perl",
            "pod",
            "printf",
            "python",
            "query",
            "regex",
            "robots",
            "ron",
            "ruby",
            "rust",
            "scss",
            "sql",
            "ssh_config",
            "styled",
            "swift",
            "tmux",
            "toml",
            "yaml"
         },
         textobjects = {
            select = {
               enable = true,
               lookahead = true
            },
            swap = {
               enable = true
            },
            move = {
               enable = true,
               set_jumps = true
            },
            lsp_interop = {
               enable = true,
               border = "none"
            }
         },
         endwise = {
            enable = true
         }
      }
   },

   -- ╞═╡ PLUGIN: nvim-treesitter-endwise ╞═════════════════════════════╡ --

   {
      "RRethy/nvim-treesitter-endwise"
   },

   -- ╞═╡ PLUGIN: nvim-treesitter-endwise ╞═════════════════════════════╡ --

   -- These specs live in nvim-treesitter.

   -- ╞═╡ PLUGIN: nvim-treesitter-textobjects ╞═════════════════════════╡ --

   -- These specs live in nvim-treesitter.

   -- ╞═╡ PLUGIN: nvim-update-time ╞════════════════════════════════════╡ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 8,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: "
      }
   },

   -- ╞═╡ PLUGIN: nvim-web-devicons ╞═══════════════════════════════════╡ --

   { "kyazdani42/nvim-web-devicons" },

   -- ╞═╡ PLUGIN: octo.nvim ╞═══════════════════════════════════════════╡ --

   {
      "pwntester/octo.nvim",
      opts = {
         enable_builtin = true,
         default_remote = {"origin", "upstream"},
         picker = "telescope",
         default_to_projects_v2 = false,
         suppress_missing_scope = {
            projects_v2 = true
         },
         ui = {
            -- show "modified" marks on the sign column
            use_signcolumn = false,
            -- show "modified" marks on the status column
            use_signstatus = true,
         },
         mappings_disable_default = true,
      }
   },

   -- ╞═╡ PLUGIN: plenary.nvim ╞════════════════════════════════════════╡ --

   { "nvim-lua/plenary.nvim" },

   -- ╞═╡ PLUGIN: sqlite.lua ╞══════════════════════════════════════════╡ --

   { "kkharji/sqlite.lua" },

   -- ╞═╡ PLUGIN: stylua-nvim ╞═════════════════════════════════════════╡ --

   { "ckipp01/stylua-nvim" },

   -- ╞═╡ PLUGIN: telescope-lazy.nvim ╞═════════════════════════════════╡ --

-- Moved to telescope dependencies and opts.

   -- ╞═╡ PLUGIN: telescope.nvim ╞══════════════════════════════════════╡ --


   {
      "nvim-telescope/telescope.nvim",
      dependencies = {
         { "nvim-lua/plenary.nvim" },
         { "MunifTanjim/nui.nvim" },
         { "nvim-telescope/telescope-file-browser.nvim" },
         { "nvim-telescope/telescope-frecency.nvim" },
         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
         { "nvim-telescope/telescope-github.nvim" },
         { "tsakirist/telescope-lazy.nvim" },
         { "cljoly/telescope-repo.nvim" },
         { "nvim-telescope/telescope-symbols.nvim" }
      },
      config = function()
         local Layout = require("nui.layout")
         local Popup = require("nui.popup")

         local telescope = require("telescope")
         local TSLayout = require("telescope.pickers.layout")

         local function make_popup(options)
            local popup = Popup(options)
            function popup.border:change_title(title)
               popup.border.set_text(popup.border, "top", title)
            end
            return TSLayout.Window(popup)
         end

         telescope.setup({
            defaults = {
               layout_strategy = "flex",
               layout_config = {
                  horizontal = {
                     size = {
                        width = "90%",
                        height = "60%"
                     }
                  },
                  vertical = {
                     size = {
                        width = "90%",
                        height = "90%"
                     }
                  }
               },
               extensions = {
                  ---@module "telescope._extensions.lazy"
                  ---@type TelescopeLazy.Config
                  lazy = {
                     mappings = {
                        open_in_browser = "<c-o>",
                        open_in_file_browser = "<m-b>",
                        open_in_find_files = "<c-f>",
                        open_in_live_grep = "<c-g>",
                        open_in_terminal = "<c-t>",
                        open_plugins_picker = "<c-b>",
                        open_lazy_root_find_files = "<c-r>f",
                        open_lazy_root_live_grep = "<c-r>g",
                        change_cwd_to_plugin = "<c-c>d"
                     }
                  }
               },
               create_layout = function(picker)
                  local border = {
                     results = {
                        top_left = "┌",
                        top = "─",
                        top_right = "┬",
                        right = "│",
                        bottom_right = "",
                        bottom = "",
                        bottom_left = "",
                        left = "│"
                     },
                     results_patch = {
                        minimal = {
                           top_left = "┌",
                           top_right = "┐"
                        },
                        horizontal = {
                           top_left = "┌",
                           top_right = "┬"
                        },
                        vertical = {
                           top_left = "├",
                           top_right = "┤"
                        }
                     },
                     prompt = {
                        top_left = "├",
                        top = "─",
                        top_right = "┤",
                        right = "│",
                        bottom_right = "┘",
                        bottom = "─",
                        bottom_left = "└",
                        left = "│"
                     },
                     prompt_patch = {
                        minimal = {
                           bottom_right = "┘"
                        },
                        horizontal = {
                           bottom_right = "┴"
                        },
                        vertical = {
                           bottom_right = "┘"
                        }
                     },
                     preview = {
                        top_left = "┌",
                        top = "─",
                        top_right = "┐",
                        right = "│",
                        bottom_right = "┘",
                        bottom = "─",
                        bottom_left = "└",
                        left = "│"
                     },
                     preview_patch = {
                        minimal = {},
                        horizontal = {
                           bottom = "─",
                           bottom_left = "",
                           bottom_right = "┘",
                           left = "",
                           top_left = ""
                        },
                        vertical = {
                           bottom = "",
                           bottom_left = "",
                           bottom_right = "",
                           left = "│",
                           top_left = "┌"
                        }
                     }
                  }

                  local results = make_popup({
                     focusable = false,
                     border = {
                        style = border.results,
                        text = {
                           top = picker.results_title,
                           top_align = "center"
                        }
                     },
                     win_options = {
                        winhighlight = "Normal:Normal"
                     }
                  })

                  local prompt = make_popup({
                     enter = true,
                     border = {
                        style = border.prompt,
                        text = {
                           top = picker.prompt_title,
                           top_align = "center"
                        }
                     },
                     win_options = {
                        winhighlight = "Normal:Normal"
                     }
                  })

                  local preview = make_popup({
                     focusable = false,
                     border = {
                        style = border.preview,
                        text = {
                           top = picker.preview_title,
                           top_align = "center"
                        }
                     }
                  })

                  local box_by_kind = {
                     vertical = Layout.Box({
                        Layout.Box(preview, { grow = 1 }),
                        Layout.Box(results, { grow = 1 }),
                        Layout.Box(prompt, { size = 3 })
                     }, { dir = "col" }),
                     horizontal = Layout.Box({
                        Layout.Box({
                           Layout.Box(results, { grow = 1 }),
                           Layout.Box(prompt, { size = 3 })
                        }, { dir = "col", size = "50%" }),
                        Layout.Box(preview, { size = "50%" })
                     }, { dir = "row" }),
                     minimal = Layout.Box({
                        Layout.Box(results, { grow = 1 }),
                        Layout.Box(prompt, { size = 3 })
                     }, { dir = "col" }),
                  }

                  local function get_box()
                     local strategy = picker.layout_strategy
                     if strategy == "vertical" or strategy == "horizontal" then
                        return box_by_kind[strategy], strategy
                     end

                     local height, width = vim.o.lines, vim.o.columns
                     local box_kind = "horizontal"
                     if width < 100 then
                        box_kind = "vertical"
                        if height < 40 then
                           box_kind = "minimal"
                        end
                     end
                     return box_by_kind[box_kind], box_kind
                  end

                  local function prepare_layout_parts(layout, box_type)
                     layout.results = results
                     results.border:set_style(border.results_patch[box_type])

                     layout.prompt = prompt
                     prompt.border:set_style(border.prompt_patch[box_type])

                     if box_type == "minimal" then
                        layout.preview = nil
                     else
                        layout.preview = preview
                        preview.border:set_style(
                           border.preview_patch[box_type]
                        )
                     end
                  end

                  local function get_layout_size(box_kind)
                     return picker.layout_config[box_kind == "minimal"
                        and "vertical" or box_kind].size
                  end

                  local box, box_kind = get_box()
                  local layout = Layout({
                     relative = "editor",
                     position = "50%",
                     size = get_layout_size(box_kind)
                  }, box)

                  layout.picker = picker
                  prepare_layout_parts(layout, box_kind)

                  local layout_update = layout.update
                  function layout:update()
                     local box, box_kind = get_box()
                     prepare_layout_parts(layout, box_kind)
                     layout_update(self, {
                        size = get_layout_size(box_kind)
                     }, box)
                  end

                  return TSLayout(layout)
               end
            }
         })

         telescope.load_extension("bookmarks")
         telescope.load_extension("frecency")
         telescope.load_extension("fzf")
         telescope.load_extension("gh")
         telescope.load_extension("lazy")
         telescope.load_extension("repo")
--          require("telescope.builtin").symbols{
--             sources = {
--                "emoji",
--                "gitmoji",
--                "julia",
--                "kaomoji",
--                "math",
--                "nerd"
--             }
--          }
      end
   },

   -- ╞═╡ PLUGIN: todo-comments.nvim ╞══════════════════════════════════╡ --

   {
      "folke/todo-comments.nvim",
      cmd = { 'TodoTrouble', 'TodoTelescope' },
      lazy = false,
      opts = {
         keywords = {
            FIX = {
               icon = " ",
               color = "fix"
            },
            TODO = {
               icon = " ",
               color = "todo"
            },
            HACK = {
               icon = " ",
               color = "hack"
            },
            WARN = {
               icon = " ",
               color = "warn"
            },
            PERF = {
               icon = "󰇬 ",
               color = "perf"
            },
            NOTE = {
               icon = " ",
               color = "note"
            },
            IDEA = {
               icon = " ",
               color = "note"
            },
            TEST = {
               icon = " ",
               color = "test"
            },
            SECTION = {
               icon = '󰚟 ',
               color = 'section'
            },
            SUBSECTION = {
               icon = '¶ ',
               color = 'subsection'
            },
            PLUGIN = {
               icon = ' ',
               color = 'plugin'
            },
            FUNCTION = {
               icon = '󰡱 ',
               color = 'subsection'
            }
         },
         merge_keywords = true,

         --  FIX: it's broken
         --  TODO: done
         --  HACK: held together with chewing gum and bailing wire
         --  WARN: something bad may happen
         --  PERF: make it faster or more efficient
         --  NOTE: something informative
         --  TEST: will it work
         --  IDEA: try this
         --  SECTION: complementary items
         --  SUBSECTION: small parts of sections
         --  PLUGIN: pluggy.nvim
         --  FUNCTION: functions, one hopes

         colors = {
            fix = { "#ff5445" },
            todo = { "#76c7b7" },
            hack = { "#fda331" },
            warn = { "#e8e805" },
            perf = { "#d381c3" },
            note = { "#6fb3d2" },
            test = { "#b0b0b0" },
            plugin = { "#e3845a" },
            section = { "#6fb3d2" },
            subsection = { "#a1c659" }
         },
         highlight = {
            multiline = false, -- default: false
            before = "fg", -- 'fg', 'bg', or empty
            keyword = "wide", -- 'fg', 'bg', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "fg",  -- "fg", "bg" or empty
            comments_only = true,
            -- pattern or table of patterns, used for highlightng (vim regex)
            -- pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]],
            pattern = [[.*<(KEYWORDS)\s*:]]
         }
      }
   },

   --[[
      TODO: Experiment with different patterns for highlights.

      The backslashes are placed before the closing square brackets only so
      the comment doesn't break. they should be removed before using. (\]\])

      These patterns allow for usernames in the keyword.
      highlight = {
         -- vimgrep regex, supporting the pattern TODO(name):
         pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):\]\],
      },
      search = {
         -- ripgrep regex, supporting the pattern TODO(name):
         pattern = [[\b(KEYWORDS)(\(\w*\))*:\]\],
      },

      Also need to make multiline work. Soonish.
   --]]

   -- ╞═╡ PLUGIN: treesj ╞══════════════════════════════════════════════╡ --

   {
      "Wansmer/treesj",
      opts = {
         use_default_keymaps = false,
         max_join_length = 79
      }
   },

   -- ╞═╡ PLUGIN: trouble.nvim ╞════════════════════════════════════════╡ --

   {
      "folke/trouble.nvim",
      cmd = "Trouble",
      opts = {
         keys = { -- trouble window-specific keys need not be added to maps.lua
            ["?"] = "help",
            r = "refresh",
            R = "toggle_refresh",
            q = "close",
            o = "jump_close",
            ["<esc>"] = "cancel",
            ["<cr>"] = "jump",
            ["<2-leftmouse>"] = "jump",
            ["<c-s>"] = "jump_split",
            ["<c-v>"] = "jump_vsplit",
            -- go down to next item (accepts count)
            -- j = "next",
            ["}"] = "next",
            ["]]"] = "next",
            -- go up to prev item (accepts count)
            -- k = "prev",
            ["{"] = "prev",
            ["[["] = "prev",
            dd = "delete",
            d = { action = "delete", mode = "v" },
            i = "inspect",
            p = "preview",
            P = "toggle_preview",
            zo = "fold_open",
            zO = "fold_open_recursive",
            zc = "fold_close",
            zC = "fold_close_recursive",
            za = "fold_toggle",
            zA = "fold_toggle_recursive",
            zm = "fold_more",
            zM = "fold_close_all",
            zr = "fold_reduce",
            zR = "fold_open_all",
            zx = "fold_update",
            zX = "fold_update_all",
            zn = "fold_disable",
            zN = "fold_enable",
            zi = "fold_toggle_enable"
         }
      }
   },

   -- ╞═╡ PLUGIN: virtcolumn.nvim ╞═════════════════════════════════════╡ --

   {
      "lukas-reineke/virt-column.nvim",
      opts = {
         virtcolumn = "80"
      }
   },

   -- ╞═╡ PLUGIN: which-key.nvim ╞══════════════════════════════════════╡ --

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
         preset = "modern",
         delay = 1000;
         notify = true,
         triggers = {
            { "<auto>", mode = "nixsotc" },
            { "<leader>", mode = { "n", "v" } }
         },
         keys = {
            scroll_down = "<A-DOWN>",
            scroll_up = "<A-UP>"
         },
         sort = { "alphanum" },
      }
   },

   -- ╞═╡ PLUGIN: yanky.nvim ╞══════════════════════════════════════════╡ --

   {
      "gbprod/yanky.nvim",
      config = true
   },

}) -- close lazy.setup()



-- ╔═══════════════════════════════════════════════════════════════════════╗ --
-- ║  SECTION: KEYMAPS                                                     ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --

local wk = require("which-key")

-- ╞═╡ SUBSECTION: core maps ╞═════════════════════════════════════════════╡ --

wk.add({

   -- Insert empty line in normal mode.

   --    For lines below cursor:
   --       <down> => add one line
   --       n<down> => add n lines
   --    For lines above cursor:
   --       <up> => add one line
   --       n<up> => add n lines
   {
      "<down>",
      "<cmd>call append(line('.'), repeat([''], v:count1))<cr>",
      desc = "Add lines below cursor."
   },
   {
      "<up>",
      "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>",
      desc = "Add lines above cursor."
   },

   -- Move line up or down. This may be superfluous with mini.move.
   { "<s-up>", "yyddkP", desc = "Move line up" },
   { "<s-down>", "yyddp", desc = "Move line down" },

   -- Use U for :redo.
   { "U", "<c-r>", desc = "Undo" },

   -- Clear highlights on search when pressing <esc> in normal mode
   {
      "<esc>",
      "<cmd>nohlsearch<cr>",
      desc = "Remove search highlights"
   },

   -- exit terminal mode (doesn"t work in all situations)
   { "<esc><esc>", "<c-\\><c-n>", mode = "t", desc = "Exit terminal mode" },

   -- Disable arrow keys in normal mode.
   -- Up and down keys used for adding lines as seen above.
   { "<left>", desc = "Inactive, use h" },
   { "<right>", desc = "Inactive, use l" },

   -- Use CTRL+<hjkl> to switch between windows.
   { "<c-h>", "<c-w><c-h>", desc = "Move to left window" },
   { "<c-l>", "<c-w><c-l>", desc = "Move to right window" },
   { "<c-j>", "<c-w><c-j>", desc = "Move to window below" },
   { "<c-k>", "<c-w><c-k>", desc = "Move to window above" },

  -- Easy window resizing.
   { "<c-up>", "<cmd>res -2<cr>", desc = "Resize window up" },
   { "<c-down>", "<cmd>res +2<cr>", desc = "Resize window down" },
   { "<c-left>", "<cmd>vert res -2<cr>", desc = "Resize window left" },
   { "<c-right>", "<cmd>vert res +_2<cr>", desc = "Resize window right" },
   { --                                                         ==> @yanky.nvim
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank text"
   },
   { --                                                         ==> @yanky.nvim
      "p",
      "<Plug>(YankyPutAfter)",

      mode = { "n", "x" },
      desc = "Put yanked text after cursor"
   },
   { --                                                         ==> @yanky.nvim
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before cursor"
   },
   { --                                                         ==> @yanky.nvim
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after selection"
   },
   { --                                                         ==> @yanky.nvim
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before selection"
   },
   { --                                                         ==> @flash.nvim
      "<c-s>",
      function()
         require("flash").toggle()
      end,
      mode = { "c" },
      desc = "Toggle Flash Search"
   },



   -- NOTE: The following mini.nvim maps must be set in the plugin spec file.
   -- They are shown here for ease of reference and so the key combinations
   -- don't get used somewhere else. None of the maps make use of the leader.

   --[[                                                         ==> @mini.align
   Start: 'ga'
   Start with preview: 'gA'
   • Modifiers changing alignment steps and/or options
     • Main option modifiers
       ==> 's' enter split pattern
       ==> 'j' choose justify side
       ==> 'm' enter merge delimiter
     • Modifiers adding pre-steps
       ==> 'f' filter parts by entering Lua expression
       ==> 'i' ignore some split matches
       ==> 'p' pair parts
       ==> 't' trim parts
     • Delete some last pre-step
       ==> '<BS>' delete some last pre-step
   --]]

   --[[                                                     ==> @mini.bracketed
   TARGET      SUFFIX   MAPPINGS       LUA FUNCTION
   buffer:      'b'     [B [b ]b ]B    MiniBracketed.buffer()
   comment:     'c'     [C [c ]c ]C    MiniBracketed.comment()
   conflict:    'x'     [X [x ]x ]X    MiniBracketed.conflict()
   diagnostic:  'd'     [D [d ]d ]D    MiniBracketed.diagnostic()
   file:        'f'     [F [f ]f ]F    MiniBracketed.file()
   indent:      'i'     [I [i ]i ]I    MiniBracketed.indent()
   jump:        'j'     [J [j ]j ]J    MiniBracketed.jump()
   location:    'l'     [L [l ]l ]L    MiniBracketed.location()
   oldfile:     'o'     [O [o ]o ]O    MiniBracketed.oldfile()
   quickfix:    'q'     [Q [q ]q ]Q    MiniBracketed.quickfix()
   treesitter:  't'     [T [t ]t ]T    MiniBracketed.treesitter()
   undo:        'u'     [U [u ]u ]U    MiniBracketed.undo()
   window:      'w'     [W [w ]w ]W    MiniBracketed.window()
   yank:        'y'     [Y [y ]y ]Y    MiniBracketed.yank()
   --]]

   --[[                                                          ==> @mini.jump
   Forward:       'f'
   Backward:      'F'
   Forward till:  't'
   Backward till: 'T'
   Repeat jump:   '' not the default
   --]]

   --[[                                                        ==> @mini.jump2d
   Start jumping: "\"
   --]]

   --[[                                                          ==> @mini.move
   Move visual selection in Visual mode.
   Left:  '<ca-h>'  |
   Right: '<ca-l>'  |  These need to be tested.
   Down:  '<ca-j>'  |
   Up:    '<ca-k>'  |
   Move current line in Normal mode
   Line left:  '<a-h>'
   Line right: '<a-l>'
   Line down:  '<a-j>'
   Line up:    '<a-k>'
   --]]

   --[[                                                     ==> @mini.operators
   Evaluate prefix: "g="  ⎫
   Exchange prefix: "gx"  ⎪
   Multiply prefix: "gm"  ⎬  Experiment & keep the ones that useful.
   Replace prefix:  "gr"  ⎪
   sort prefix:     "gs"  ⎭
   --]]

   --[[                                                         ==> @mini.pairs
   Prevent the addition of the closing symbol when
   opening symbol is to the left of any non-space
   character or to the immediate right of "\".
   "(" action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]"
   "[" action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]"
   "{ " action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]"
   This is default (prevents the action if the cursor is just next to a "\").
   ")" action = "close", pair = "()", neigh_pattern = "[^\\]."
   "]" action = "close", pair = "[]", neigh_pattern = "[^\\]."
   " }" action = "close", pair = "{}", neigh_pattern = "[^\\]."
   Prevents the action if the cursor is just before or next to any character.
   '"' action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]",
   "'" action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]",
   "`" action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]",
   --]]

})


-- ╞═╡ SUBSECTION: Leader 0: telescope.nvim ╞══════════════════════════════╡ --

wk.add({

   { "<leader>0", group = "Telescope" },
   { --                                                     ==> @telescope.nvim
      "<leader>0r",
      "<cmd>Telescope resume<cr>",
      desc = "Resume last telescope session"
   },

})

-- ╞═╡ SUBSECTION: Leader 1: nvim-treesitter ╞═════════════════════════════╡ --


wk.add({

   { "<leader>1", group = "Treesitter" },
   { "<leader>1b", desc  = "Treesitter Buffer" },
   { --                                                    ==> @treesitter.nvim
      "<leader>1bd",
      "<cmd>TSBufDisable<cr>",
      desc = "TSBufDisable"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1be",
      "<cmd>TSBufEnable<cr>",
      desc = "TSBufEnable"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1bt",
      "<cmd>TSBufToggle<cr>",
      desc = "TSBufToggle"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1c",
      "<cmd>TSConfigInfo<cr>",
      desc = "TSConfigInfo"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1d",
      "<cmd>TSDisable<cr>",
      desc = "TSDisable"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1e",
      "<cmd>TSEnable<cr>",
      desc = "TSEnable"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1q",
      "<cmd>TSEditQuery<cr>",
      desc = "TSEditQuery"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1t",
      "<cmd>TSToggle<cr>",
      desc = "TSToggle"
   },
   { --                                                    ==> @treesitter.nvim
      "<leader>1u",
      "<cmd>TSEditQueryUserAfter<cr>",
      desc = "TSEditQueryUserAfter"
   },

})

-- ╞═╡ SUBSECTION: Leader 2 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>2", group = "Empty" },
   {
      "<leader>2a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 3 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>3", group = "Empty" },
   {
      "<leader>3a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 4 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>4", group = "Empty" },
   {
      "<leader>4a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 5 ╞══════════════════════════════════════════════╡ --



wk.add({

   { "<leader>5", group = "Empty" },
   {
      "<leader>5a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 6 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>6", group = "Empty" },
   {
      "<leader>6a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 7 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>7", group = "Empty" },
   {
      "<leader>7a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 8 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>8", group = "Empty" },
   {
      "<leader>8a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader 9 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>9", group = "Empty" },
   {
      "<leader>9a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader a ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>a", group = "Empty" },
   {
      "<leader>aa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader b: Buffers ╞═════════════════════════════════════╡ --


wk.add({

   { "<leader>b", group = "Buffers" },
   {
      "<leader>bb",
      "<cmd>buffers<cr>:b<space>",
      mode = "n",
      desc = "List Buffers"
   },
   {
      "<leader>bd",
      "<cmd>bdelete<cr>",
      desc = "Close buffer"
   },
   { --                                                       ==> @conform.nvim
      "<leader>bf",
      function()
         require("conform").format({ async = true })
      end,
      desc = "Format buffer"
   },
   {
      "<leader>bn",
      "<cmd>bnext<cr>",
      desc = "Next buffer"
   },
   {
      "<leader>bp",
      "<cmd>bprevious<cr>",
      desc = "Previous buffer"
   },
   { --                                                     ==> @which-key.nvim
      "<leader>bs",
      expand = function()
         return require("which-key.extras").expand.buf()
      end,
      desc = "Show Buffers"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>bt",
      "<cmd>Telescope buffers<CR>",
      mode = "n",
      desc = "List buffers (Telescope)"
   },

})

-- ╞═╡ SUBSECTION: Leader c: Comments ╞════════════════════════════════════╡ --


wk.add({

   { "<leader>c", group = "Comments" },
   { --                                                 ==> @nvim-comment-frame
      "<leader>cm",
      "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<cr>",
      mode = "n",
      desc = "Add multiple-line comment frame"
   },
   { --                                                 ==> @nvim-comment-frame
      "<leader>cs",
      "<cmd>lua require('nvim-comment-frame').add_comment()<cr>",
      mode = "n",
      desc = "Add single-line comment frame"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ct",
      group = "Todo-Comments"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>cta",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX}}<cr>",
      desc = "Todo/Fix/Fixme (Trouble)"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ctb",
      "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
      desc = "Todo/Fix/Fixme"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ctn",
      function()
         require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ctp",
      function()
         require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ctr",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Todo (Trouble)"
   },
   { --                                                 ==> @todo-comments.nvim
      "<leader>ctt",
      "<cmd>TodoTelescope<cr>",
      desc = "Todo"
   },

})

-- ╞═╡ SUBSECTION: Leader d: Diagnostics ╞═════════════════════════════════╡ --


wk.add({

   { "<leader>d", group = "Diagnostics" },
   { --                                          ==> @vim.diagnostic.setloclist
      "<leader>dq",
      "vim.diagnostic.setloclist",
      desc = "Open diagnostic quickfix list"
   },
   { "<leader>dt", desc = "trouble.nvim" },
   { --                                                       ==> @trouble.nvim
      "<leader>dtb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      mode = "n",
      desc = "Buffer Diagnostics (Trouble)"
   },
   { --                                                       ==> @trouble.nvim
      "<leader>dtd",
      "<cmd>Trouble diagnostics toggle<cr>",
      mode = "n",
      desc = "Diagnostics (Trouble)"
   },
   { --                                                       ==> @trouble.nvim
      "<leader>dts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      mode = "n",
      desc = "Symbols (Trouble)"
   },
   { "<leader>dtl", desc = "LSP toggle/loclist toggle" },
   { --                                                       ==> @trouble.nvim
      "<leader>dtll",
      "<cmd>Trouble loclist toggle<cr>",
      mode = "n",
      desc = "Location List (Trouble)"
   },
   { --                                                       ==> @trouble.nvim
      "<leader>dtls",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      mode = "n",
      desc = "LSP Defs / refs / … (Trouble)"
   },
   { --                                                       ==> @trouble.nvim
      "<leader>dtq",
      "<cmd>Trouble qflist toggle<cr>",
      mode = "n",
      desc = "Quickfix List (Trouble)"
   },

})

-- ╞═╡ SUBSECTION: Leader e ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>e", group = "Empty" },
   {
      "<leader>ea",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader f: Files ╞═══════════════════════════════════════╡ --


wk.add({

   { "<leader>f", group = "Files" },
   { --                                                     ==> @telescope.nvim
      "<leader>fb",
      "<cmd>Telescope file_browser<CR>",
      mode = "n",
      desc = "Browser"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fc",
      "<cmd>Telescope current_buffer_tags<CR>",
      mode = "n",
      desc = "This buffer's ctags"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>ff",
      "<cmd>Telescope find_files<CR>",
      mode = "n",
      desc = "Find files"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fg",
      "<cmd>Telescope tags<CR>",
      mode = "n",
      desc = "List global ctags"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fh",
      "<cmd>Telescope help_tags<CR>",
      mode = "n",
      desc = "Help tags"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fl",
      "<cmd>Telescope live_grep<CR>",
      mode = "n",
      desc = "Live grep"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fo",
      "<cmd>Telescope oldfiles<CR>",
      mode = "n",
      desc = "Old files"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>fz",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      mode = "n",
      desc = "fzf in current buffer"
   },

})

-- ╞═╡ SUBSECTION: Leader g: Github ╞══════════════════════════════════════╡ --


local _octo_reviews = require("octo.reviews")

wk.add({

   { "<leader>g", desc = "Github" },
   { "<leader>ga", desc = "Assignees" },
   { --                                                          ==> @octo.nvim
      "<leader>gaa",
      function()
         require("octo.commands").add_user("assignee")
      end,
      desc = "Add assignee"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gar",
      function()
         require("octo.commands").remove_user("assignee")
      end,
      desc = "Remove assignee"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gb",
      function()
         require("octo.navigation").open_in_browser()
      end,
      desc = "Open PR in browser"
   },
   { "<leader>gc", desc = "Comments" },
   { --                                                          ==> @octo.nvim
      "<leader>gca",
      function()
         require("octo.commands").add_comment()
      end,
      desc = "Add comment"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gcd",
      function()
         require("octo.commands").delete_comment()
      end,
      desc = "Delete comment"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gcn",
      function()
         require("octo.navigation").next_comment()
      end,
      desc = "Go to next comment"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gcp",
      function()
         require("octo.navigation").prev_comment()
      end,
      desc = "Go to previous comment"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gcs",
      function()
         require("octo.commands").add_suggestion()
      end,
      desc = "Add suggestion"
   },
   { "<leader>ge", desc = "Entries" },
   { --                                                          ==> @octo.nvim
      "<leader>gesf",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            local file = layout.files[1]
            if file then
               layout:set_file(file, true)
            end
         end
      end,
      desc = "Move to first changed file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gesl",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            local file = layout.files[#layout.files]
            if file then
               layout:set_file(file, true)
            end
         end
      end,
      desc = "Move to last changed file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gesn",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            local file_idx = layout.file_idx % #layout.files + 1
            local file = layout.files[file_idx]
            if file then
               layout:set_file(file, true)
            end
         end
      end,
      desc = "Move to next changed file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gesp",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            local file_idx = (layout.file_idx - 2) % #layout.files + 1
            local file = layout.files[file_idx]
            if file then
               layout:set_file(file, true)
            end
         end
      end,
      desc = "Move to previous changed file"
   },
   { "<leader>gf", desc = "Files" },
   { --                                                          ==> @octo.nvim
      "<leader>gff",
      function()
         local layout = reviews.get_current_layout()
         if layout then
            layout.file_panel:focus(true)
         end
      end,
      desc = "Move focus to changed file panel"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gfg",
      function()
         require("octo.navigation").go_to_file()
      end,
      desc  = "Go to file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gfn",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            layout.file_panel:highlight_next_file()
         end
      end,
      desc = "Go to next file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gfp",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            layout.file_panel:highlight_prev_file()
         end
      end,
      desc = "Go to previousd file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gfr",
      function()
         local layout = reviews.get_current_layout()
         if layout then
            layout:update_files()
         end
      end,
     desc = "Refresh files"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gfs",
      function()
         local layout = reviews.get_current_layout()
         if layout and layout.file_panel:is_open() then
            local file = layout.file_panel:get_file_at_cursor()
            if file then
               layout:set_file(file, true)
            end
         end
      end,
      desc = "Select file"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gft",
      function()
         local layout = reviews.get_current_layout()
         if layout then
            layout.file_panel:toggle()
         end
      end,
      desc = "Hide/show changed files panel"
   },
   { "<leader>gi", desc = "Issues" },
   { --                                                          ==> @octo.nvim
      "<leader>gic",
      function()
         require("octo.commands").change_state("CLOSED")
      end,
      desc = "Close issue"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gir",
      function()
         require("octo.commands").change_state("OPEN")
      end,
      desc = "Reopen Issue"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gil",
      function()
         local bufnr = vim.api.nget_current_buf()
         local buffer = octo_buffers[bufnr]
         local repo = buffer.repo
         if repo then
            require("octo.picker").issues { repo = repo }
         end
      end,
      desc = "List open issues on same repo"
   },
   { "<leader>gl", desc = "Labels" },
   { --                                                          ==> @octo.nvim
      "<leader>gla",
      function()
         require("octo.commands").add_label()
      end,
      desc  = "Add label"
   },
   { --                                                          ==> @octo.nvim
      "<leader>glc",
      function()
         require("octo.commands").create_label()
      end,
      desc  = "Create label"
   },
   { --                                                          ==> @octo.nvim
      "<leader>glr",
      function()
         require("octo.commands").remove_label()
      end,
      desc  = "Remove label"
   },
   { "<leader>gp", desc = "Pull requests" },
   { --                                                          ==> @octo.nvim
      "<leader>gpc",
      function()
         require("octo.commands").commands.pr.checkout()
      end,
      desc = "Checkout PR"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gpd",
      function()
         require("octo.commands").show_pr_diff()
      end,
      desc = "Show PR diff"
   },
   { "<leader>gpl", desc = "List…" },
   { --                                                          ==> @octo.nvim
      "<leader>gplc",
      function()
         require("octo.picker").commits()
      end,
      desc = "List PR commits"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gplf",
      function()
         require("octo.picker").changed_files()
      end,
      desc = "List changed files"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gpm",
      function()
         require("octo.commands").merge_pr("commit")
      end,
      desc = "Merge commit PR"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gpr",
      function()
         require("octo.commands").merge_pr("rebase")
      end,
      desc = "Rebase and merge PR"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gps",
      function()
         require("octo.commands").merge_pr("squash")
      end,
      desc = "Squash and merge PR"
   },
   { "<leader>gr", desc = "Reviews/Reactions" },
   { "<leader>grr", desc = "Reactions" },
   { --                                                          ==> @octo.nvim
      "<leader>grrc",
      function()
         require("octo.commands").reaction_action("confused")
      end,
      desc = "Add/remove 😕 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grrd",
      function()
         require("octo.commands").reaction_action("-1")
      end,
      desc = "Add/remove 👎 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grrh",
      function()
         require("octo.commands").reaction_action("heart")
      end,
      desc = "Add/remove ❤️ reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grri",
      function()
         require("octo.commands").reaction_action("eyes")
      end,
      desc = "Add/remove 👀 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grrk",
      function()
         require("octo.commands").reaction_action("rocket")
      end,
      desc = "Add/remove 🚀 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grrl",
      function()
         require("octo.commands").reaction_action("laugh")
      end,
      desc = "Add/remove 😄 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grru",
      function()
         require("octo.commands").reaction_action("+1")
      end,
      desc = "Add/remove 👍 reaction"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grry",
      function()
         require("octo.commands").reaction_action("hooray")
      end,
      desc = "Add/remove 🎉 reaction"
   },
   { "<leader>grv", desc = "Reviews" },
   { --                                                          ==> @octo.nvim
      "<leader>grv-",
      function()
         require("octo.commands").remove_user("reviewer")
      end,
      desc = "Remove reviewer"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grv+",
      function()
         require("octo.commands").add_user("reviewer")
      end,
      desc = "Add reviewer"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grva",
      function()
         local current_review = reviews.get_current_review()
         current_review:submit("APPROVE")
      end,
      desc  = "Approve review"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvb",
      function()
         reviews.start_review()
      end,
      desc = "Start a review for the current PR"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvc",
      function()
         local current_review = reviews.get_current_review()
         current_review:submit("COMMENT")
      end,
      desc = "Comment review"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvd",
      function()
         reviews.discard_review()
      end,
      desc = "Discard review"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grve",
      function()
         reviews.add_review_comment(false)
      end,
      desc = "Add a new review comment"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvr",
      function()
         reviews.resume_review()
      end,
      desc = "Resume a pending review for current PR"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvs",
      function()
         reviews.submit_review()
      end,
      desc = "Submit review"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvt",
      function()
         local tabpage = vim.api.nget_current_tabpage()
         reviews.close(tabpage)
      end,
      desc = "Close review tab"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvu",
      function()
         reviews.add_review_comment(true)
      end,
      desc = "Add a new review suggestion"
   },
   { --                                                          ==> @octo.nvim
      "<leader>grvw",
      function()
         vim.api.nvim_win_close(vim.api.nget_current_win())
      end,
      desc = "Close review window"
   },
   { "<leader>gs", desc = "gitsigns" },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsa",
      "gitsigns.stage_hunk",
      desc = "Stage hunk"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsb",
      "gitsigns.reset_hunk",
      desc = "Reset hunk"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsc",
      function()
         gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
      end,
      mode = "v",
      desc = "Stage hunk - visual"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsd",
      function()
         gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
      end,
      mode = "v",
      desc = "Reset hunk - visual"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leadergse",
      "<cmd>gitsigns.stage_buffer<cr>",
      desc = "Stage buffer"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsf",
      "<cmd>gitsigns.undo_stage_hunk<cr>",
      desc = "Undo stage hunk"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsg",
      "<cmd>gitsigns.reset_buffer<cr>",
      desc = "Reset buffer"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsh",
      "<cmd>gitsigns.preview_hunk<cr>",
      desc = "Preview Hunk"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsi",
      function()
         gitsigns.blame_line({full=true})
      end,
      desc = "Blame line"
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsj",
      "<cmd>gitsigns.toggle_current_line_blame<cr>",
      desc = ""
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsk",
      "<cmd>gitsigns.diffthis<cr>",
      desc = ""
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsl",
      function()
         gitsigns.diffthis('~')
      end,
      desc = ""
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsm",
      "<cmd>gitsigns.toggle_deleted<cr>",
      desc = ""
   },
   { --                                                      ==> @gitsigns.nvim
      "<leader>gsn",
      "<cmd>Gitsigns select_hunk<cr>",
      mode = { "o", "x" },
      desc = ""
   },
   { "<leader>gt", desc = "Threads" },
   { --                                                          ==> @octo.nvim
      "<leader>gtn",
      function()
         require("octo.reviews.file-panel").next_thread()
      end,
      desc = "Move to next thread"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gtp",
      function()
         require("octo.reviews.file-panel").prev_thread()
      end,
      desc = "Move to previous thread"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gu",
      function()
         require("octo.commands").copy_url()
      end,
      desc = "Copy url to system clipboard"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gv",
      function()
         local layout = reviews.get_current_layout()
         if layout then
            layout.file_panel:get_file_at_cursor():toggle_viewed()
         end
      end,
      desc = "Toggle viewer viewed state"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gx",
      function()
         vim.cmd [[e!]]
      end,
      desc = "Reload PR/Issue"
   },
   { --                                                          ==> @octo.nvim
      "<leader>gy",
      function()
         local current_review = reviews.get_current_review()
         current_review:submit("REQUEST_CHANGES")
      end,
      desc = "Request changes review"
   },

})

-- ╞═╡ SUBSECTION: Leader h ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>h", group = "Empty" },
   {
      "<leader>ha",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader i ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>i", group = "Empty" },
   {
      "<leader>ia",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader j ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>j", group = "Empty" },
   {
      "<leader>ja",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader k ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>k", group = "Empty" },
   {
      "<leader>ka",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader l: LSP ╞═════════════════════════════════════════╡ --


wk.add({

   { "<leader>l", group = "LSP" },
   {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "LSP Info"
   }

})

-- ╞═╡ SUBSECTION: Leader m: Marks ╞═══════════════════════════════════════╡ --


wk.add({

   { "<leader>m", group = "Marks" },
   { "<leader>mb", desc = "Bookmarks" },
   { "<leader>mbg", desc = "Bookmark groups" },

   { --                                                         ==> @marks.nvim
      "<leader>mbgd",
      "<Plug>(Marks-delete-bookmark[0-9])",
      desc = "Delete bookmarks from group [0-9]"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbgn",
      "<Plug>(Marks-next-bookmark[0-9])",
      desc = "Go to next bookmark from group [0-9]"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbgp",
      "<Plug>(Marks-prev-bookmark[0-9])",
      desc = "Go to next bookmark from group [0-9]"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbgs",
      "<Plug>(Marks-set-bookmark[0-9])",
      desc = "Set bookmark from group [0-9]"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbgt",
      "<Plug>(Marks-toggle-bookmark[0-9])",
      desc = "Toggle bookmark from group [0-9]"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbn",
      "<Plug>(Marks-next-bookmark)",
      desc = "Move to next bookmark of same type"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mbp",
      "<Plug>(Marks-prev-bookmark)",
      desc = "Move to previous bookmark of same type"
   },
   { "<leader>mc", desc = "Operate on mark at cursor" },
   { --                                                         ==> @marks.nvim
      "<leader>mcd",
      "<Plug>(Marks-delete-bookmark)",
      desc = "Delete bookmark under cursor"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mcn",
      "<Plug>(Marks-setnext)",
      desc = "Set next mark at cursor"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mcs",
      "<Plug>(Marks-set)",
      desc = "Set mark at cursor"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mct",
      "<Plug>(Marks-toggle)",
      desc = "Toggle next mark at cursor"
   },
   { "<leader>md", desc = "Delete Marks" },
   { --                                                         ==> @marks.nvim
      "<leader>mdb",
      "<Plug>(Marks-deletebuf)",
      desc = "Delete all marks in current buffer"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mdl",
      "<Plug>(Marks-deleteline)",
      desc = "Delete all marks on current line"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mdm",
      "<Plug>(Marks-delete)",
      desc = "Delete a letter mark"
   },
   { "<leader>mf", desc = "Operate on marks in buffers" },
   { --                                                         ==> @marks.nvim
      "<leader>mfn",
      "<Plug>(Marks-next)",
      desc = "Go to next mark in buffer"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mfp",
      "<Plug>(Marks-prev)",
      desc = "Go to previous mark in buffer"
   },
   { --                                                         ==> @marks.nvim
      "<leader>mp",
      "<Plug>(Marks-preview)",
      desc = "Preview marks"
   },

})

-- ╞═╡ SUBSECTION: Leader n: Navigation ╞══════════════════════════════════╡ --


wk.add({

   { "<leader>n", group = "Navigation" },
   { --                                                         ==> @flash.nvim
      "<leader>nf",
      function()
         require("flash").treesitter_search()
      end,
      mode = { "o", "x" },
      desc = "Treesitter Search"
   },
   { --                                                         ==> @flash.nvim
      "<leader>nr",
      function()
         require("flash").remote()
      end,
      mode = "o",
      desc = "Remote Flash"
   },
   { --                                                         ==> @flash.nvim
      "<leader>ns",
      function()
         require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash"
   },
   { --                                                         ==> @flash.nvim
      "<leader>nt",
      function()
         require("flash").treesitter()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash Treesitter"
   },

})

-- ╞═╡ SUBSECTION: Leader o ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>o", group = "Empty" },
   {
      "<leader>oa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader p: Put ╞═════════════════════════════════════════╡ --


wk.add({

   { "<leader>p", group = "Put" },
   { "<leader>pa", desc = "Put after and indent" },
   { --                                                         ==> @yanky.nvim
      "<leader>paf",
      "<Plug>(YankyPutAfterFilter)",
      desc = "Put after applying a filter"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>pal",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      desc = "Put and indent left"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>par",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      desc = "Put and indent right"
   },
   { "<leader>pb", desc = "Put before and indent" },
   { --                                                         ==> @yanky.nvim
      "<leader>pbf",
      "<Plug>(YankyPutBeforeFilter)",
      desc = "Put before applying a filter"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>pbl",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      desc = "Put before and indent left"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>pbr",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      desc = "Put before and indent right"
   },
   { "<leader>pi", desc = "Put indented" },
   { --                                                         ==> @yanky.nvim
      "<leader>pia",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>pib",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)"
   },
   { --                                                     ==> @telescope.nvim
      "<leader>pl",
      "<cmd>Telescope lazy<cr>",
      desc = "Work with lazy plugins"
   },

})

-- ╞═╡ SUBSECTION: Leader q ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>q", group = "Empty" },
   {
      "<leader>qa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader r: Registers ╞═══════════════════════════════════╡ --


wk.add({

   { "<leader>r", group = "Registers" },
   {
      "<leader>ra",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞═╡ SUBSECTION: Leader s: Surround ╞════════════════════════════════════╡ --


wk.add({

   { "<leader>s", group = "Surround" },
   { "<leader>sc", desc = "Change" },
   { --                                                      ==> @nvim-surround
      "<leader>scl",
      "<Plug>(nvim-surround-change-line)",
      desc = "Line change"
   },
   { --                                                      ==> @nvim-surround
      "<leader>scs",
      "<Plug>(nvim-surround-change)",
      desc = "Spot change"
   },
   { --                                                      ==> @nvim-surround
      "<leader>sd",
      "<Plug>(nvim-surround-delete)",
      desc = "Delete"
   },
   { "<leader>si", desc = "Insert Mode" },
   { --                                                      ==> @nvim-surround
      "<leader>sil",
      "<Plug>(nvim-surround-insert-line)",
      mode = "i",
      desc = "Line insert"
   },
   { --                                                      ==> @nvim-surround
      "<leader>sis",
      "<Plug>(nvim-surround-insert)",
      mode = "i",
      desc = "Spot insert"
   },
   { "<leader>sn", desc = "Normal mode" },
   { --                                                      ==> @nvim-surround
      "<leader>snc",
      "<Plug>(nvim-surround-normal-cur)",
      mode = "n",
      desc = "Spot insert in current line"
   },
   { "<leader>snl", desc = "Line insert" },
   { --                                                      ==> @nvim-surround
      "<leader>snlc",
      "<Plug>(nvim-surround-normal-cur-line)",
      mode = "n",
      desc = "Line insert in current line"
   },
   { --                                                      ==> @nvim-surround
      "<leader>snls",
      "<Plug>(nvim-surround-normal-line)",
      mode = "n",
      desc = "Line insert"
   },
   { --                                                      ==> @nvim-surround
      "<leader>sns",
      "<Plug>(nvim-surround-normal)",
      mode = "n",
      desc = "Spot insert"
   },
   { "<leader>sv", desc = "Visual Mode" },
   { --                                                      ==> @nvim-surround
      "<leader>svl",
      "<Plug>(nvim-surround-visual-line)",
      mode = "v",
      desc = "Line insert"
   },
   { --                                                      ==> @nvim-surround
      "<leader>svs",
      "<Plug>(nvim-surround-visual)",
      mode = "v",
      desc = "Spot insert"
   },

})

-- ╞═╡ SUBSECTION: Leader t: Text ╞════════════════════════════════════════╡ --


wk.add({

   { "<leader>t", group = "Text" },
   { "<leader>to", desc = "Text objects" },

   -- Move
   { "<leader>tom", desc = "Move…" },

   -- Move > Class
   { "<leader>tomc", desc = "Move > Class…" },

   -- Move > Class > Next
   { "<leader>tomcn", desc = "Move > Class > Next" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomcne",
      "<cmd>TSTextobjectGotoNextEnd class.outer<cr>",
      desc = "Next class end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomcns",
      "<cmd>TSTextobjectGotoNextStart class.outer<cr>",
      desc = "Next class start"
   },

   -- Move > Class > Previous
   { "<leader>tomcp", desc = "Move > Class > Previous" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomcpe",
      "<cmd>TSTextobjectGotoPreviousEnd class.outer<cr>",
      desc = "Prev class end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomcps",
      "<cmd>TSTextobjectGotoPreviousStart class.outer<cr>",
      desc = "Prev class start"
   },

   -- Move > Function call
   { "<leader>tomf", desc = "Move > Function call…" },

   --  Move > Function call > Next
   { "<leader>tomfn", desc = "Move > Function call > Next" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomfne",
      "<cmd>TSTextobjectGotoNextEnd call.outer<cr>",
      desc = "Next function call end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomfns",
      "<cmd>TSTextobjectGotoNextStart call.outer<cr>",
      desc = "Next function call start"
   },

   -- Move > Function call > Previous
   { "<leader>tomfp", desc = "Move > Function call > Previous" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomfpe",
      "<cmd>TSTextobjectGotoPreviousEnd call.outer<cr>",
      desc = "Prev function call end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomfps",
      "<cmd>TSTextobjectGotoPreviousStart call.outer<cr>",
      desc = "Prev function call start"
   },

   -- Move > Loop
   { "<leader>toml", desc = "Move > Loop…" },

   -- Move > Loop > Next
   { "<leader>tomln", desc = "Move > Loop > Next" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomlne",
      "<cmd>TSTextobjectGotoNextEnd loop.outer<cr>",
      desc = "Next loop end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomlns",
      "<cmd>TSTextobjectGotoNextStart loop.outer<cr>",
      desc = "Next loop start"
   },

   -- Move > Loop > Previous
   { "<leader>tomlp", desc = "Move > Loop > Previous" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomlpe",
      "<cmd>TSTextobjectGotoPreviousEnd loop.outer<cr>",
      desc = "Prev loop end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomlps",
      "<cmd>TSTextobjectGotoPreviousStart loop.outer<cr>",
      desc = "Prev loop start"
   },

   -- Move > Method/function
   { "<leader>tomm", desc = "Move > Method/function…" },

   -- Move > Method/function > Next
   { "<leader>tommn", desc = "Move > Method/function > Next" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tommne",
      "<cmd>TSTextobjectGotoNextEnd function.outer<cr>",
      desc = "Next method/function def end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tommns",
      "<cmd>TSTextobjectGotoNextStart function.outer<cr>",
      desc = "Next method/function definition start"
   },

   -- Move > Method/function > Previous
   { "<leader>tommp", desc = "Move > Method/function > Previous" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tommpe",
      "<cmd>TSTextobjectGotoPreviousEnd function.outer<cr>",
      desc = "Prev method/function def end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tommps",
      "<cmd>TSTextobjectGotoPreviousStart function.outer<cr>",
      desc = "Prev method/function def start"
   },

   -- Move > Conditional
   { "<leader>tomo", desc = "Move > Conditional…" },

   -- Move > Conditional > Next
   { "<leader>tomon", desc = "Move > Conditional > Next" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomone",
      "<cmd>TSTextobjectGotoNextEnd conditional.outer<cr>",
      desc = "Next conditional end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomons",
      "<cmd>TSTextobjectGotoNextStart conditional.outer<cr>",
      desc = "Next conditional start"
   },

   -- Move > Conditional > Previous
   { "<leader>tomop", desc = "Move > Conditional > Previous" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomope",
      "<cmd>TSTextobjectGotoPreviousEnd conditional.outer<cr>",
      desc = "Prev conditional end"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tomops",
      "<cmd>TSTextobjectGotoPreviousStart conditional.outer<cr>",
      desc = "Prev conditional start"
   },

   -- Select
   { "<leader>tos", desc = "Select…" },

   -- Select > Assignment
   { "<leader>tosa", desc = "Select > Assignment…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosai",
      "<cmd>TSTextobjectSelect @assignment.inner<cr>",
      desc = "Select inner part of an assignment"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosal",
      "<cmd>TSTextobjectSelect @assignment.lhs<cr>",
      desc = "Select left hand side of an assignment"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosao",
      "<cmd>TSTextobjectSelect @assignment.nuter<cr>",
      desc = "Select outer part of an assignment"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosar",
      "<cmd>TSTextobjectSelect @assignment.rhs<cr>",
      desc = "Select right hand side of an assignment"
   },

   -- Select > Class
   { "<leader>tosc", desc = "Select > Class…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosfi",
      "<cmd>TSTextobjectSelect @call.inner<cr>",
      desc = "Select inner part of a function call"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosfo",
      "<cmd>TSTextobjectSelect @call.outer<cr>",
      desc = "Select outer part of a function call"
   },

   -- Select > Loop
   { "<leader>tosl", desc = "Select > Loop…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosli",
      "<cmd>TSTextobjectSelect @loop.inner<cr>",
      desc = "Select inner part of a loop"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>toslo",
      "<cmd>TSTextobjectSelect @loop.outer<cr>",
      desc = "Select outer part of a loop"
   },

   -- Select > Method/function
   { "<leader>tosm", desc = "Select > Method/function…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosmi",
      "<cmd>TSTextobjectSelect @function.inner<cr>",
      desc = "Select inner part of a method/function definition"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosmo",
      "<cmd>TSTextobjectSelect @function.outer<cr>",
      desc = "Select outer part of a method/function definition"
   },

   -- Select > Conditional
   { "<leader>toso", desc = "Select > Conditional…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosoi",
      "<cmd>TSTextobjectSelect @conditional.inner<cr>",
      desc = "Select inner part of a conditional"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tosoo",
      "<cmd>TSTextobjectSelect @conditional.outer<cr>",
      desc = "Select outer part of a conditional"
   },

   -- Select > Parameter/argument
   { "<leader>tosp", desc = "Select > Parameter/argument…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tospi",
      "<cmd>TSTextobjectSelect @parameter.inner<cr>",
      desc = "Select inner part of a parameter/argument"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>tospo",
      "<cmd>TSTextobjectSelect @parameter.outer<cr>",
      desc = "Select outer part of a parameter/argument"
   },

   -- Swap
   { "<leader>tow", desc = "Swap…" },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>town",
      "<cmd>TSTextobjectSwapNext<cr>",
      desc = "Swap next"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>towp",
      "<cmd>TSTextobjectSwapPrevious<cr>",
      desc = "Swap previous"
   },
   { "<leader>ts", desc = "Split/Join" },
   { --                                                        ==> @treesj.nvim
      "<leader>tst",
      "<cmd>lua require('treesj').toggle()<cr>",
      desc = "Toggle split/join"
   },
   { --                                                        ==> @treesj.nvim
      "<leader>tss",
      "<cmd>lua require('treesj').split()<cr>",
      desc = "Split"
   },
   { --                                                        ==> @treesj.nvim
      "<leader>tsj",
      "<cmd>lua require('treesj').join()<cr>",
      desc = "Join"
   },

})



-- ╞═╡ SUBSECTION: Leader u ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>u", group = "Empty" },
   {
      "<leader>ua",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞═╡ SUBSECTION: Leader v ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>v", group = "Empty" },
   {
      "<leader>va",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞═╡ SUBSECTION: Leader w: Windows/Tabs ╞════════════════════════════════╡ --


wk.add({

   { "<leader>w", group = "Windows/Tabs" },
   { --                                                          ==> @edgy.nvim
      "<leader>wa",
      function() require("edgy").select() end,
      desc = "Edgy Select Window"
   },

   { "<leader>wc", group = "Close…" },
   {
      "<leader>wch",
      "<cmd>helpc<cr>",
      desc = "Close help buffer"
   },
   { --                                        ==> @nvim-treesitter-textobjects
      "<leader>wco",
      "<cmd>only<cr>",
      desc = "Close all but this window"
   },
   { "<leader>wct", "<cmd>tabc<cr>", desc = "Close tab" },
   { --                                                     ==> @which-key.nvim
      "<leader>ws",
      function()
         require("which-key.extras").expand.win()
      end,
      desc = "Show Windows"
   },
   { --                                                          ==> @edgy.nvim
      "<leader>wt",
      function()
         require("edgy").toggle()
      end,
      desc = "Edgy Toggle"
   },

})



-- ╞═╡ SUBSECTION: Leader x ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>x", group = "Empty" },
   {
      "<leader>xa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞═╡ SUBSECTION: Leader y: Yank ╞════════════════════════════════════════╡ --


wk.add({

   { "<leader>y", group = "Yank" },
   { --                                                         ==> @yanky.nvim
      "<leader>yh",
      function()
         require("telescope").extensions.yank_history.yank_history()
      end,
      desc = "Open Yank History"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>yn",
      "<Plug>(YankyNextEntry)",
      desc = "Select next entry through yank history"
   },
   { --                                                         ==> @yanky.nvim
      "<leader>yp",
      "<Plug>(YankyPreviousEntry)",
      desc = "Select previous entry through yank history"
   },

})



-- ╞═╡ SUBSECTION: Leader z ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>z", group = "Empty" },
   {
      "<leader>za",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})







-- ╞═════════════════════════════╡  la fin  ╞══════════════════════════════╡ --

