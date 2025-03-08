-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/init.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-03-08 00:12

--[[

   List of plugins that need to be set up.

   cmp-buffer
   cmp-nvim-lsp
   cmp-path
   fortune.nvim  <== needs mini.startup footer to be altered
   icon-picker.nvis
   illustro.nvim
   lazydev.nvim
   mason-lspconfig.nvim
   nvim-cmp
   nvim-dap
   nvim-dap-ui
   nvim-lsp-file-operations
   nvim-lspconfig
   nvim-nio

--]]

-- ╔═╡ PLUGIN:  ╞═══════════════════════════════╡ [   ] ╞═╗ --
-- ║  Source:               ║ --
-- ║  License:                                                          ║ --
-- ╚════════════════════════════════════════════════╡  ╞═╝ --

return {

-- ╔═╡ PLUGIN: Comment.nvim ╞════════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/numToStr/Comment.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════════╡ Coding: Comments ╞═╝ --

   { "numToStr/Comment.nvim" },

-- ╔═╡ PLUGIN: cmp-buffer ╞══════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/hrsh7th/cmp-buffer                        ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════╡ Coding: Completion ╞═╝ --

--   { "hrsh7th/cmp-buffer" },

-- ╔═╡ PLUGIN: cmp-nvim-lsp ╞════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/hrsh7th/cmp-nvim-lsp                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═════════════════════════════════════════╡ Coding: Completion (LSP?) ╞═╝ --

--   { "hrsh7th/cmp-nvim-lsp" },

-- ╔═╡ PLUGIN: cmp-path ╞════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/hrsh7th/cmp-path                          ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════╡ Coding: Completion ╞═╝ --

--   { "hrsh7th/cmp-path" },

-- ╔═╡ PLUGIN: command-completion.nvim ╞═════════════════════════╡ [*!!] ╞═╗ --
-- ║  Source: https://github.com/smolck/command-completion.nvim            ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════╡ Editor: Command Completion ╞═╝ --

   -- FIX: Getting odd error when entering command: Invalid buffer number.

   {
      "smolck/command-completion.nvim",
      opts = {
         max_col_num = 5,
         min_col_width = 25,
         use_matchfuzzy = false
      }
   },

-- ╔═╡ PLUGIN: csvview.nvim ╞════════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/hat0uma/csvview.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════╡ Languages: CSV, TSV ╞═╝ --

   {
      "hat0uma/csvview.nvim",
      opts = {
         display_mode = "border" -- or "highlight"
      }
   },

-- ╔═╡ PLUGIN: dark_flat.nvim ╞══════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/uncleTen276/dark_flat.nvim                ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════════╡ UI: Colourscheme ╞═╝ --

   {
      "sekke276/dark_flat.nvim",
      priority = 1000,
      config = function()
         require("dark_flat").setup({
            colors = {
               fg = "#ddeedd",
               bg = "#060606",
               gray = "#aaaaaa",
               pink = "#d60075",
               green = "#00bb28",
               light_green = "#14df4c",
               cyan = "#00d2cb",
               aqua = "#4a63f7",
               purple = "#a733c9",
               peanut = "#e6a868",
               orange = "#ff4704",
               dark_pink = "#c70053",
               dark_cyan = "#2b8db3",
               red = "#c00102",
               dark_red = "#a60404",
               light_gray = "#bababa",
               dark_gray = "#777777",
               dark_green = "#00570e",
               dark_blue = "#00156d"
            },
            italics = false,
         })
      end
   },

-- ╔═╡ PLUGIN: dressing.nvim ╞═══════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/stevearc/dressing.nvim                    ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════════╡ UI: Enhancement  ╞═╝ --

   { "stevearc/dressing.nvim" },

-- ╔═╡ PLUGIN: edgy.nvim ╞═══════════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/folke/edgy.nvim                           ║ --
-- ║  License: Apache-2.0                                                  ║ --
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

-- ╔═╡ PLUGIN: flash.nvim ╞══════════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/folke/flash.nvim                          ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚════════════════════════════════════════════════════╡ UI: Navigation ╞═╝ --

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

-- ╔═╡ PLUGIN: flexoki-nvim ╞════════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/nuvic/flexoki-nvim                        ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════╡ UI: Colorscheme ╞═╝ --

   {
      "nuvic/flexoki-nvim",
      name = "flexoki",
      config = function()
         require("flexoki").setup({
            variant = "auto", -- auto, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
               terminal = true,
            },

            styles = {
               bold = true,
               italic = false,
            },

            -- may experiment with this later
            -- groups = {
            --    border = "muted",
            --    link = "purple_two",
            --    panel = "surface",
            --
            --    error = "red_one",
            --    hint = "purple_one",
            --    info = "cyan_one",
            --    ok = "green_one",
            --    warn = "orange_one",
            --    note = "blue_one",
            --    todo = "magenta_one",
            --
            --    git_add = "green_one",
            --    git_change = "yellow_one",
            --    git_delete = "red_one",
            --    git_dirty = "yellow_one",
            --    git_ignore = "muted",
            --    git_merge = "purple_one",
            --    git_rename = "blue_one",
            --    git_stage = "purple_one",
            --    git_text = "magenta_one",
            --    git_untracked = "subtle",
            --
            --    h1 = "purple_two",
            --    h2 = "cyan_two",
            --    h3 = "magenta_two",
            --    h4 = "orange_two",
            --    h5 = "blue_two",
            --    h6 = "cyan_two",
            -- },

            palette = {
               moon = {
                  base = "#000000",
                  overlay = "#111111",
                  muted = "#afafaf"
               },
               dawn = {
                  base = "#ffffff",
                  overlay = "#f2f0e5"
               }
            },

            highlight_groups = {
               Comment = { fg = "muted" },
            --    VertSplit = { fg = "muted", bg = "muted" },
            },

            -- before_highlight = function(group, highlight, palette)
            --    -- Disable all undercurls
            --    if highlight.undercurl then
            --        highlight.undercurl = false
            --    end
            --
            --    -- Change palette colour
            --    if highlight.fg == palette.blue_two then
            --        highlight.fg = palette.cyan_two
            --    end
            -- end,
         })

--          vim.cmd("colorscheme flexoki-moon")
      end
   },

-- ╔═╡ PLUGIN: fortune.nvim ╞════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/fecet/fortune.nvim                        ║ --
-- ║  License: None                                                        ║ --
-- ╚══════════════════════════════════════════════════════╡ Utility: Fun ╞═╝ --

--   { "fecet/fortune.nvim" },

-- ╔═╡ PLUGIN: friendly-snippets ╞═══════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/rafamadriz/friendly-snippets              ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════╡ Coding: Completion ╞═╝ --

    { "rafamadriz/friendly-snippets" },

-- ╔═╡ PLUGIN: garbage-day.nvim ╞════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/Zeioth/garbage-day.nvim                   ║ --
-- ║  License: GPL-3.0                                                     ║ --
-- ╚══════════════════════════════════════════════╡ Utility: LSP Cleanup ╞═╝ --

   {
      "zeioth/garbage-day.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
      event = "VeryLazy"
   },

-- ╔═╡ PLUGIN: gitsigns.nvim ╞═══════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/lewis6991/gitsigns.nvim                   ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: Git ╞═╝ --

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

-- ╔═╡ PLUGIN: grug-far.nvim ╞═══════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/MagicDuck/grug-far.nvim                   ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════════╡ Editor: Search ╞═╝ --

   { "MagicDuck/grug-far.nvim" },

-- ╔═╡ PLUGIN: icon-picker.nvim ╞════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/JohnnyAmos/icon-picker.nvim               ║ --
-- ║  License: MIT {Detach from fork and release under ISC license.}       ║ --
-- ╚═════════════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

-- FIX: Set maps up in keymaps.lua and reflect change in config before using.

--    {
--       "JohnnyAmos/icon-picker.nvim",
--       config = function()
--          require("icon-picker").setup({ disable_legacy_commands = true })
--          local opts = { noremap = true, silent = true }
--          vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
--          vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
--          vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
--       end
--    }

-- ╔═╡ PLUGIN: illustro.nvim ╞═══════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/JohnnyAmos/illustro.nvim                  ║ --
-- ║  License: ISC                                                         ║ --
-- ╚═══════════════════════════════════════════════════╡ UI: Colorscheme ╞═╝ --

--    {
--       "JohnnyAmos/illustro.nvim",
--       name = "illustro",
--       priority = 1000,
--       config = function()
--          require("illustro").setup({
--          })
--       end
--    }

-- ╔═╡ PLUGIN: key-analyzer.nvim ╞═══════════════════════════════╡ [*  ] ╞═╗ --
-- ║  source: https://github.com/meznaric/key-analyzer.nvim                ║ --
-- ║  license: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════╡ Utility: Mapping Aid ╞═╝ --

   {
      "meznaric/key-analyzer.nvim",
      opts = {}
   },

-- ╔═╡ PLUGIN: lazydev.nvim ╞════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/folke/lazydev.nvim                        ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

-- TODO: Set up after nvim-lspconfig.
--    {
--       "folke/lazydev.nvim",
--       ft = "lua",
--       opts = {
--          library = {
--             {
--                path = "luvit-meta/library",
--                words = { "vim%.uv" }
--             }
--          },
--          integrations = {
--             lspconfig = true,
--             cmp = true
--          }
--       }
--    },

-- ╔═╡ PLUGIN: lualine.nvim ╞════════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/nvim-lualine/lualine.nvim                 ║ --
-- ║  License: MIT                                                         ║ --
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

-- ╔═╡ PLUGIN: marks.nvim ╞══════════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/chentoast/marks.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════════╡ UI: Navigation ╞═╝ --

   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {
         default_mappings = false,
         force_write_shada = true,
         sign_priority = 10
      }
   },

-- ╔═╡ PLUGIN: mason-lspconfig.nvim ╞════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/williamboman/mason-lspconfig.nvim         ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

--    {
--       "williamboman/mason-lspconfig.nvim",
--       config = function()
--          require("mason-lspconfig").setup({
--             ensure_installed = {
--                "arduino_language_server",
--                "ast_grep",
--                "astro",
--                "basedpyright",
--                "bashls",
--                "css_variables",
--                "cssls",
--                "cssmodules_ls",
--                "denols",
--                "eslint",
--                "htmx",
--                "jsonls",
--                "ltex",
--                "lua_ls",
--                "markdown_oxide",
--                "perlnavigator",
--                "ruff",
--                "sqlls",
--                "tailwindcss",
--                "taplo",
--             }
--          })
--       end
--    },

-- ╔═╡ PLUGIN: mason.nvim ╞══════════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/williamboman/mason.nvim                   ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

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

-- ╔═╡ PLUGIN: mini.nvim ╞═══════════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/echasnovski/mini.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════╡ Various ╞═╝ --

   {
      "echasnovski/mini.nvim",
      version = false,
      config = function()


-- ╞═╡ mini.align ╞═════════════════════════════════╡ Coding: Formatting ╞═╡ --

         require("mini.align").setup()

-- ╞═╡ mini.bracketed ╞═════════════════════════════════╡ UI: Navigation ╞═╡ --

         require("mini.bracketed").setup()

-- ╞═╡ mini.cursorword ╞════════════════════════════════════════╡ Coding ╞═╡ --

-- i'm of two minds about this one. it can be useful, and it can be very
-- annoying. the trait it exhibits most wins.

         require("mini.cursorword").setup()

-- ╞═╡ mini.icons ╞══════════════════════════════════════════╡ UI: Icons ╞═╡ --

         require("mini.icons").setup()

-- ╞═╡ mini.jump ╞══════════════════════════════════════╡ UI: Navigation ╞═╡ --

         require("mini.jump").setup()

-- ╞═╡ mini.jump2d ╞════════════════════════════════════╡ UI: Navigation ╞═╡ --

         require("mini.jump2d").setup({
            mappings = {
               start_jumping = "\\",
            },
         })

-- ╞═╡ mini.misc ╞═════════════════════════════════════════════╡ Utilily ╞═╡ --

-- i know it's just a box, but it's a nice box and i might need it someday. i
-- just hope i can remember where i put it when i need it.

         require("mini.misc").setup()

-- ╞═╡ mini.move ╞══════════════════════════════════════════════╡ Editor ╞═╡ --

         require("mini.move").setup({
            mappings = {
               -- move visual selection in visual mode.
               left = '<ca-h>',
               right = '<ca-l>',
               down = '<ca-j>',
               up = '<ca-k>',
               -- move current line in normal mode
               line_left = '<a-h>',
               line_right = '<a-l>',
               line_down = '<a-j>',
               line_up = '<a-k>',
            },
         })

-- ╞═╡ mini.pairs ╞═════════════════════════════════════════════╡ Editor ╞═╡ --

-- i borrowed (blatenly stole) this and i can't remember where from. as soon as
-- i figure it out i will post the requisite credits. if it's yours let me
-- know. thanks.

         require("mini.pairs").setup({
            mappings = {
               -- prevent the addition of the closing symbol when opening
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
               -- this is default (prevents the action if the cursor is just
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
               -- prevents the action if the cursor is just before or next to
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

-- ╞═╡ mini.sessions ╞════════════════════════════════════════╡ Projects ╞═╡ --

-- todo: see if there are any keymaps that can be used, or make some

         require("mini.sessions").setup()

-- ╞═╡ mini.starter ╞══════════════════════════════════╡ UI: Enhancement ╞═╡ --

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

-- todo: add fortune and stats to footer and put the cow back in the header.

         local starter = require("mini.starter")
         starter.setup({
            evaluating_single = true,
            header = logo,
            items = {
               {
                  action = "ene | startinsert",
                  name = "new file",
                  section = "files"
               },
               {
                  action = "telescope oldfiles",
                  name = "recent files",
                  section = "files"
               },
               {
                  action = "telescope find_files",
                  name = "find files",
                  section = "files"
               },
               {
                  action = "telescope file_browser",
                  name = "browser",
                  section = "files"
               },
               {
                  action = "telescope live_grep",
                  name = "live grep",
                  section = "search"
               },
               {
                  action = "telescope command_history",
                  name = "command history",
                  section = "search"
               },
               {
                  action = "telescope repo list",
                  name = "git repos",
                  section = "projects"
               },
               starter.sections.sessions(5, true),
               {
                  action = "telescope man_pages",
                  name = "man pages",
                  section = "reference/config"
               },
               {
                  action = "telescope help_tags",
                  name = "help tags",
                  section = "reference/config"
               },
               {
                  action = "lazy",
                  name = "plugins",
                  section = "reference/config"
               },
               {
                  action = "telescope colorscheme",
                  name = "schémas de couleurs",
                  section = "reference/config"
               },
               {
                  action = "telescope bookmarks",
                  name = "vivaldi bookmarks",
                  section = "internet resources"
               },
               {
                  action = "qa",
                  name = "quit",
                  section = "exit"
               },
            },
            -- footer = footer, -- need to set up fortune.nvim
            content_hooks = {
               starter.gen_hook.adding_bullet("░ ☞  "),
               starter.gen_hook.aligning("center", "center"),
               starter.gen_hook.indexing("all", {
                  "files",
                  "search",
                  "projects",
                  "reference/config",
                  "internet resources",
                  "exit"
               })
            }
         })

-- ╞═╡ mini.visits ╞══════════════════════════════════════════╡ Projects ╞═╡ --

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

         mini.base16      tinty  NOTE: tinty's out. lush.nvim is in.

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
      well. And then… it moves on. I, however, needed more than one thing.
      so I moved on.

      As for mini.bufremove: it's been a long time since I used vim, and I
      am new to nvim, and I don't get the point of this one. Maybe in time.
      ¯\_(ツ)_/¯

      And finally, firmly in the no-thank-you category:

         mini.animate: ʕ ͡° ʖ̯ ͡°ʔノ Eww, apparantly I am not a fan of flying
         cursors.

         mini.indentscope: This is even worse than the animated cursor. It
         is terribly annoying. (ಠ_ಠ)

   --]]

-- ╔═╡ PLUGIN: multiple-cursors.nvim ╞═══════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/brenton-leighton/multiple-cursors.nvim    ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════╡ Editor: Multicursor ╞═╝ --

   {
      "brenton-leighton/multiple-cursors.nvim",
      version = "*",  -- Use the latest tagged version
      opts = {
         pre_hook = function()
            vim.cmd("Lazy load mini.move")
            vim.g.minipairs_disable = true
            require("cmp").setup({enabled=false})
            vim.cmd("NoMatchParen")
         end,
         post_hook = function()
            vim.g.minipairs_disable = false
            require("cmp").setup({enabled=true})
            vim.cmd("DoMatchParen")
         end
      }
   },

-- ╔═╡ PLUGIN: neo-tree.nvim ╞═══════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/nvim-neo-tree/neo-tree.nvim               ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════╡ Editor: File Manager ╞═╝ --

   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim"
      },
      config = function()
         vim.fn.sign_define("DiagnosticSignError", {
            text = " ",
            texthl = "DiagnosticSignError"
         })
         vim.fn.sign_define("DiagnosticSignWarn", {
            text = " ",
            texthl = "DiagnosticSignWarn"
         })
         vim.fn.sign_define("DiagnosticSignInfo", {
            text = " ",
            texthl = "DiagnosticSignInfo"
         })
         vim.fn.sign_define("DiagnosticSignHint", {
            text = "󰌵",
            texthl = "DiagnosticSignHint"
         })
         require("neo-tree").setup({
            popup_border_style = "single",
            add_blank_line_at_top = true,
            auto_clean_after_session_restore = true,
            -- "trace", "debug", "info", "warn", "error", "fatal"
            log_level = "info",
            -- true, false, "/path/to/file.log"
            log_to_file = '$HOME/.config/nvim/.logs/neotree.log',
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
         })
      end
   },

-- ╔═╡ PLUGIN: nerdy.nvim ╞══════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/2KAbhishek/nerdy.nvim                     ║ --
-- ║  License: GPL-3.0                                                     ║ --
-- ╚═════════════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   {
       '2kabhishek/nerdy.nvim',
       dependencies = {
           'stevearc/dressing.nvim',
           'nvim-telescope/telescope.nvim',
       },
       cmd = 'Nerdy',
   },

-- ╔═╡ PLUGIN: nui.nvim ╞════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/MunifTanjim/nui.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════════════════════╡ UI ╞═╝ --

   { "MunifTanjim/nui.nvim" },

-- ╔═╡ PLUGIN: nvim-cmp ╞════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/hrsh7th/nvim-cmp                          ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════╡ Coding: Completions ╞═╝ --

--    { "hrsh7th/nvim-cmp" },

-- ╔═╡ PLUGIN: nvim-comment-frame ╞══════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/s1n7ax/nvim-comment-frame                 ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════════╡ Coding: Comments ╞═╝ --

   { "s1n7ax/nvim-comment-frame" },

-- ╔═╡ PLUGIN: nvim-dap ╞════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/mfussenegger/nvim-dap                     ║ --
-- ║  License: GPL-3.0                                                     ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: DAP ╞═╝ --

--    { "mfussenegger/nvim-dap" },

-- ╔═╡ PLUGIN: nvim-dap-ui ╞═════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/rcarriga/nvim-dap-ui                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: DAP ╞═╝ --

--    { "rcarriga/nvim-dap-ui" },

-- ╔═╡ PLUGIN: nvim-lsp-file-operations ╞════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/antosha417/nvim-lsp-file-operations       ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

--    {
--       "antosha417/nvim-lsp-file-operations",
--       dependencies = {
--          "nvim-lua/plenary.nvim",
--          "nvim-neo-tree/neo-tree.nvim",
--       },
--       config = function()
--          require("lsp-file-operations").setup()
--       end
--    },

-- ╔═╡ PLUGIN: nvim-lspconfig ╞══════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/neovim/nvim-lspconfig                     ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

--    { "neovim/nvim-lspconfig" },

-- ╔═╡ PLUGIN: nvim-nio ╞════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/nvim-neotest/nvim-nio                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════╡ API: IO ╞═╝ --

--    { "nvim-neotest/nvim-nio" },

-- ╔═╡ PLUGIN: nvim-surround ╞═══════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/kylechui/nvim-surround                    ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════════════════════╡ Coding:  ╞═╝ --

   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy"
   },

-- ╔═╡ PLUGIN: nvim-treesitter ╞═════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/nvim-treesitter/nvim-treesitter           ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚════════════════════════════════════════════════════╡ Coding: Syntax ╞═╝ --

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
            "bash",
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
            "html",
            "http",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "ledger",
            "lua",
            "luadocs",
            "luap",
            "markdown",
            "perl",
            "pod",
            "printf",
            "python",
            "query",
            "regex",
            "robots",
            "scss",
            "sql",
            "ssh_config",
            "styled",
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

-- ╔═╡ PLUGIN: nvim-update-time ╞════════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/StonyBoy/nvim-update-time                 ║ --
-- ║  License: MIT                                                         ║ --
-- ╚══════════════════════════════════════════╡ Utilities: Timestamp ╞═╝ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 8,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: "
      }
   },

-- ╔═╡ PLUGIN: nvim-web-devicons ╞═══════════════════════════════╡ [***] ╞═╗ --
-- ║  Source: https://github.com/nvim-tree/nvim-web-devicons               ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═════════════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   { "kyazdani42/nvim-web-devicons" },

-- ╔═╡ PLUGIN: octo.nvim ╞═══════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/pwntester/octo.nvim                       ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════╡ Editor: Git ╞═╝ --

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

-- ╔═╡ PLUGIN: sqlite.lua ╞══════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/kkharji/sqlite.lua                        ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═════════════════════════════════════════════════╡ Utility: Database ╞═╝ --

   { "kkharji/sqlite.lua" },

-- ╔═╡ PLUGIN: stylua-nvim ╞═════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/wesleimp/stylua.nvim                      ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════╡ Coding: Formatting ╞═╝ --

   { "ckipp01/stylua-nvim" },

-- ╔═╡ PLUGIN: telescope.nvim ╞══════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/nvim-telescope/telescope.nvim             ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════════════════════╡ UI ╞═╝ --

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
                  local border = { -- relocate to icons.lua?
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
         telescope.load_extension('nerdy')
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

-- ╔═╡ PLUGIN: todo-comments.nvim ╞══════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/folke/todo-comments.nvim                  ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚══════════════════════════════════════════════════╡ Coding: comments ╞═╝ --

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
               color = 'plugin'
            }
         },
         merge_keywords = true,


         --  FIX:
         --  TODO:
         --  HACK:
         --  WARN:
         --  PERF:
         --  NOTE:
         --  IDEA:
         --  TEST:
         --  SECTION:
         --  SUBSECTION:
         --  PLUGIN:
         --  FUNCTION:

         colors = {
            fix = { "#b22222" },
            todo = { "#01bfff" },
            hack = { "#ff8c00" },
            warn = { "#ffd703" },
            perf = { "#78889a" },
            note = { "#2e8c22" },
            test = { "#deb887" },
            plugin = { "#ba55d3" },
            section = { "#1e91ff" },
            subsection = { "#87cefa" }



         },
         highlight = {
            multiline = false, -- default: false
            -- FIX: The highlighting starts in line with the beginning of the
            -- keyword instead of the beginning of the line.
            -- Lua pattern to match the next multiline from the start of the
            -- matched keyword
            multiline_pattern = "^.",
            -- Extra lines that will be re-evaluated when changing a line.
            multiline_context = 0,

            before = "", -- 'fg', 'bg', or empty
            keyword = "wide_bg", -- 'fg', 'bg', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "",  -- "fg", "bg" or empty
            comments_only = true,
            -- pattern or table of patterns, used for highlightng (vim regex)
            -- pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]],
            pattern = {
               [[.*<(KEYWORDS)\s*:]],
            }
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

-- ╔═╡ PLUGIN: treesj ╞══════════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/Wansmer/treesj                            ║ --
-- ║  License: MIT                                                         ║ --
-- ╚════════════════════════════════════════════════════════════╡ Coding ╞═╝ --

   {
      "Wansmer/treesj",
      opts = {
         use_default_keymaps = false,
         max_join_length = 79
      }
   },

-- ╔═╡ PLUGIN: trouble.nvim ╞════════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/folke/trouble.nvim                        ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════╡ Coding: Diagnostics ╞═╝ --

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

-- ╔═╡ PLUGIN: virtcolumn.nvim ╞═════════════════════════════════╡ [*  ] ╞═╗ --
-- ║  Source: https://github.com/lukas-reineke/virt-column.nvim            ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════╡ UI: Colorcolumn ╞═╝ --

   {
      "lukas-reineke/virt-column.nvim",
      opts = {
         virtcolumn = "80"
      }
   },

-- ╔═╡ PLUGIN: which-key.nvim ╞══════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/folke/which-key.nvim                      ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════╡ Editor: Keymaps ╞═╝ --

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

-- ╔═╡ PLUGIN: yanky.nvim ╞══════════════════════════════════════╡ [** ] ╞═╗ --
-- ║  Source: https://github.com/gbprod/yanky.nvim                         ║ --
-- ║  License: WTFPL                                                       ║ --
-- ╚═════════════════════════════════════════╡ Coding: Text Manipulation ╞═╝ --

   { "gbprod/yanky.nvim", config = true }


}

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --

