-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/init.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-23 16:54


return {

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "numToStr/Comment.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "hrsh7th/cmp-buffer" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "hrsh7th/cmp-nvim-lsp" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "hrsh7th/cmp-path" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "smolck/command-completion.nvim",
      opts = {
         border = single,
         max_col_num = 3,
         min_col_width = 25,
         use_matchfuzzy = false
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "hat0uma/csvview.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "stevearc/dressing.nvim" },

-- ╔═╡ PLUGIN: edgy.nvim ╞═════════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/folke/edgy.nvim                    ║ --
-- ║  Plugin license: Apache-2.0                                           ║ --
-- ║                                                                       ║ --
-- ╚═══════════════════════════════════════════════════════╡ UI: Layouts ╞═╝ --

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
               ft = "help",
               filter = function(buf)
                  return vim.bo[buf].buftype == "help"
               end
         }
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
         -- Ordered thusly because it places the home row keys first, with the
         -- top second and the bottom third.
         labels = "asdfghjklqwertyuiopzxcvbnm",
         search = {
            mode = "search",
            incremental = true
         }
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "fecet/fortune.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "rafamadriz/friendly-snippets"},

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "MagicDuck/grug-far.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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
            cmp = true
         }
      }
   },

-- ╔═╡ PLUGIN: lualine.nvim ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/nvim-lualine/lualine.nvim          ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡ UI: Statusline & Tabline ╞═╝ --

   {
      "nvim-lualine/lualine.nvim",
      config = function()
         require("lualine").setup({
            options = {
               theme = "auto",
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
               lualine_y = {
                  "progress"
               },
               lualine_z = {
                  "location",
                  "tabs",
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

         })
      end
   },



-- ╔═╡ PLUGIN: lush.nvim ╞═════════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/rktjmp/lush.nvim                   ║ --
-- ║  Plugin license: MIT                                                  ║ --
-- ║                                                                       ║ --
-- ╚═════════════════════════════════════════════╡ UI: Colorscheme Maker ╞═╝ --

   { "rktjmp/lush.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "Bilal2453/luvit-meta", lazy = true },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {
         default_mappings = false,
         force_write_shada = true,
         sign_priority = 10
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "williamboman/mason-lspconfig.nvim", },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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
         -- I borrowed (blatenly stole) this and I can't remember where from.
         -- As soon as I figure it out I will post the requisit credits.
         -- If it's yours let me know. Thanks.
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

         mini.base16      tinty  TODO: tinty's out. lush.nvim is in.

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


-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "folke/neoconf.nvim",
      cmd = "Neoconf"
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "nvimtools/none-ls.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "MunifTanjim/nui.nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "hrsh7th/nvim-cmp" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "s1n7ax/nvim-comment-frame" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "mfussenegger/nvim-dap" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "rcarriga/nvim-dap-ui" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "neovim/nvim-lspconfig" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "nvim-neotest/nvim-nio" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 8,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: "
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "kyazdani42/nvim-web-devicons" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "kkharji/sqlite.lua" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "ckipp01/stylua-nvim" },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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
            before = "", -- 'fg', 'bg', or empty
            keyword = "wide", -- 'fg', 'bg', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "",  -- "fg", "bg" or empty
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

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   {
      "Wansmer/treesj",
      opts = {
         use_default_keymaps = false,
         max_join_length = 79
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

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

-- ╔═╡ PLUGIN: virtcolumn.nvim ╞═══════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/lukas-reineke/virt-column.nvim     ║ --
-- ║  Plugin license: MIT                                                  ║ --
-- ║                                                                       ║ --
-- ╚═══════════════════════════════════════════════════╡ UI: Colorcolumn ╞═╝ --

   {
      "lukas-reineke/virt-column.nvim",
      opts = {
         virtcolumn = "80"
      }
   },

-- ╔═╡ PLUGIN: virtcolumn.nvim ╞═══════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/lukas-reineke/virt-column.nvim     ║ --
-- ║  Plugin license: MIT                                                  ║ --
-- ║                                                                       ║ --
-- ╚═══════════════════════════════════════════════════╡ UI: Colorcolumn ╞═╝ --

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
         preset = "modern",
         delay = 1000,
         notify = true,
         triggers = {
            { "<auto>", mode = "nixsotc" },
            { "<leader>", mode = { "n", "v" } }
         },
         keys = {
            scroll_down = "<A-DOWN>",
            scroll_up = "<A-UP>"
         },
         sort = { "alphanum" }
      }
   },

-- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source:           ║ --
-- ║  Plugin license:           ║ --
-- ║                                                                       ║ --
-- ╚══════════════════════════════════════════╡  ╞═╝ --

   { "gbprod/yanky.nvim", config = true }


}

-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

