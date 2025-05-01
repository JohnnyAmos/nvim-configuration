-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/init.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-04-28 19:01

--[[

   FIX: edgy.nvim needs work. Soonish.

   List of plugins that need to be set up.

   cmp-buffer
   cmp-nvim-lsp
   cmp-path
   command-completion.nvim
   fortune.nvim  <== needs mini.startup footer to be altered
   icon-picker.nvim
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

return {

   --  NOTE: The following is a blank for copying to the proper location for a
   -- new plugin.

   -- ╔═╡ PLUGIN:  ╞══════════════════════════════════════════╡ [   ] ╞═╗ --
   -- ║  Source:                                                        ║ --
   -- ║  License:                                                       ║ --
   -- ╚════════════════════════════════════════════════════════════╡  ╞═╝ --

   -- ╔═╡ PLUGIN: Comment.nvim ╞══════════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/numToStr/Comment.nvim               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════╡ Coding: Comments ╞═╝ --

   { "numToStr/Comment.nvim" },

   -- ╔═╡ PLUGIN: cmp-buffer ╞════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/hrsh7th/cmp-buffer                  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Completion ╞═╝ --

   --   { "hrsh7th/cmp-buffer" },

   -- ╔═╡ PLUGIN: cmp-nvim-lsp ╞══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/hrsh7th/cmp-nvim-lsp                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═══════════════════════════════════╡ Coding: Completion (LSP?) ╞═╝ --

   --   { "hrsh7th/cmp-nvim-lsp" },

   -- ╔═╡ PLUGIN: cmp-path ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/hrsh7th/cmp-path                    ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Completion ╞═╝ --

   --   { "hrsh7th/cmp-path" },

   -- ╔═╡ PLUGIN: command-completion.nvim ╞═══════════════════╡ [*!!] ╞═╗ --
   -- ║  Source: https://github.com/smolck/command-completion.nvim      ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════╡ Editor: Command Completion ╞═╝ --

   -- FIX: Getting odd error when entering command: Invalid buffer number.

   -- {
   --    "smolck/command-completion.nvim",
   --    opts = {
   --       max_col_num = 5,
   --       min_col_width = 25,
   --       use_matchfuzzy = false,
   --    },
   -- },

   -- ╔═╡ PLUGIN: conform.nvim ╞══════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/stevearc/conform.nvim               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Formatting ╞═╝ --

   {
      "stevearc/conform.nvim",
      config = function()
         require("conform").setup({
            formatters_by_ft = {
               css = {
                  "stylelint",
                  "prettierd",
               },
               html = {
                  "ast-grep",
                  "prettierd",
               },
               javascript = {
                  "ast-grep",
                  "prettierd",
               },
               json = { "prettierd" },
               lua = { "stylua" },
               markdown = {
                  "cbfmt",
                  "doctoc",
               },
               python = { "ruff" },
               scss = {
                  "stylelint",
                  "prettierd",
               },
               sql = { "sqlfmt" },
               vue = { "prettierd" },
               yaml = { "yamlfmt" },
            },
            lang_to_ext = {
               javascript = "js",
               latex = "tex",
               markdown = "md",
               python = "py",
            },
            ft_parsers = {
               javascript = "babel",
               vue = "vue",
               css = "css",
               scss = "scss",
               html = "html",
               json = "json",
               jsonc = "json",
               yaml = "yaml",
               markdown = "markdown",
               ["markdown.mdx"] = "mdx",
               graphql = "graphql",
            },
            default_format_opts = {
               lsp_format = "fallback",
            },
         })
      end,
   },

   -- ╔═╡ PLUGIN: csvview.nvim ╞══════════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/hat0uma/csvview.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════╡ Languages: CSV, TSV ╞═╝ --

   {
      "hat0uma/csvview.nvim",
      opts = {
         display_mode = "border", -- or "highlight"
      },
   },

   -- ╔═╡ PLUGIN: dark_flat.nvim ╞════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/uncleTen276/dark_flat.nvim          ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════╡ UI: Colourscheme ╞═╝ --

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
               dark_blue = "#00156d",
            },
            italics = false,
         })
      end,
   },

   -- ╔═╡ PLUGIN: dressing.nvim ╞═════════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/stevearc/dressing.nvim              ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════╡ UI: Enhancement  ╞═╝ --

   { "stevearc/dressing.nvim" },

   -- ╔═╡ PLUGIN: edgy.nvim ╞═════════════════════════════════╡ [*!!] ╞═╗ --
   -- ║  Source: https://github.com/folke/edgy.nvim                     ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ UI: Layouts ╞═╝ --

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
               end,
            },
            "Trouble",
            { ft = "qf", title = "QuickFix" },
         },
         left = {
            {
               title = "Files",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "filesystem"
               end,
               size = { height = 0.5 },
            },
            {
               title = "Git",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "git_status"
               end,
               pinned = true,
               collapsed = true, -- show window as collapsed on start
               open = "Neotree position=right git_status",
            },
            {
               title = "Buffers",
               ft = "neo-tree",
               filter = function(buf)
                  return vim.b[buf].neo_tree_source == "buffers"
               end,
               pinned = true,
               collapsed = true, -- show window as collapsed on start
               open = "Neotree position=top buffers",
            },
            {
               title = function()
                  local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
                  return vim.fn.fnamemodify(buf_name, ":t")
               end,
               ft = "Outline",
               pinned = true,
               open = "Lspsaga outline",
            },
            -- any other neo-tree windows
            "neo-tree",
         },
         right = {
            ft = "help",
            filter = function(buf)
               return vim.bo[buf].buftype == "help"
            end,
         },
      },
   },

   -- ╔═╡ PLUGIN: flash.nvim ╞════════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/folke/flash.nvim                    ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚══════════════════════════════════════════════╡ UI: Navigation ╞═╝ --

   {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
         -- Ordered thusly because it places the home row keys first, with the
         -- top second and the bottom third.
         labels = "asdfghjklqwertyuiopzxcvbnm",
         search = {
            mode = "search",
            incremental = true,
         },
      },
   },

   -- ╔═╡ PLUGIN: flexoki-nvim ╞══════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/nuvic/flexoki-nvim                  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════╡ UI: Colorscheme ╞═╝ --

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
                  muted = "#afafaf",
               },
               dawn = {
                  base = "#ffffff",
                  overlay = "#f2f0e5",
               },
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
      end,
   },

   -- ╔═╡ PLUGIN: fortune.nvim ╞══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/fecet/fortune.nvim                  ║ --
   -- ║  License: None                                                  ║ --
   -- ╚════════════════════════════════════════════════╡ Utility: Fun ╞═╝ --

   --   { "fecet/fortune.nvim" },

   -- ╔═╡ PLUGIN: friendly-snippets ╞═════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/rafamadriz/friendly-snippets        ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Completion ╞═╝ --

   { "rafamadriz/friendly-snippets" },

   -- ╔═╡ PLUGIN: garbage-day.nvim ╞══════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/Zeioth/garbage-day.nvim             ║ --
   -- ║  License: GPL-3.0                                               ║ --
   -- ╚════════════════════════════════════════╡ Utility: LSP Cleanup ╞═╝ --

   {
      "zeioth/garbage-day.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
      event = "VeryLazy",
   },

   -- ╔═╡ PLUGIN: glow.nvim ╞═════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/ellisonleao/glow.nvim               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Language: Markdown ╞═╝ --

   {
      "ellisonleao/glow.nvim",
      config = true,
      cmd = "Glow",
   },

   -- ╔═╡ PLUGIN: grug-far.nvim ╞═════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/MagicDuck/grug-far.nvim             ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════╡ Editor: Search ╞═╝ --

   { "MagicDuck/grug-far.nvim" },

   -- ╔═╡ PLUGIN: hardtime.nvim ╞═════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/m4xshen/hardtime.nvim               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════════╡ Utility ╞═╝ --

   --    {
   --       "m4xshen/hardtime.nvim",
   --       dependencies = { "MunifTanjim/nui.nvim" },
   --       opts = {},
   --    },

   -- ╔═╡ PLUGIN: hawtkeys.nvim ╞═════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/tris203/hawtkeys.nvim               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════╡ Utility: Keymaps ╞═╝ --

   {
      "tris203/hawtkeys.nvim",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-treesitter/nvim-treesitter",
      },
      config = function()
         require("hawtkeys").setup({
            customMaps = {
               ["wk.register"] = {
                  method = "which_key",
               },
               ["lazy"] = {
                  method = "lazy",
               },
            },
         })
      end,
   },

   -- ╔═╡ PLUGIN: icon-picker.nvim ╞══════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/JohnnyAmos/icon-picker.nvim         ║ --
   -- ║  License: MIT {Detach from fork and release under ISC license.} ║ --
   -- ╚═══════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

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

   -- ╔═╡ PLUGIN: key-analyzer.nvim ╞═════════════════════════╡ [*  ] ╞═╗ --
   -- ║  source: https://github.com/meznaric/key-analyzer.nvim          ║ --
   -- ║  license: MIT                                                   ║ --
   -- ╚════════════════════════════════════════╡ Utility: Mapping Aid ╞═╝ --

   {
      "meznaric/key-analyzer.nvim",
      opts = {},
   },

   -- ╔═╡ PLUGIN: lazydev.nvim ╞══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/folke/lazydev.nvim                  ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

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

   -- ╔═╡ PLUGIN: lsp_lines.nvim ╞════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://git.sr.ht/~whynothugo/lsp_lines.nvim           ║ --
   -- ║  License: ISC                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
         require("lsp_lines").setup()
      end,
      vim.diagnostic.config({
         virtual_text = false,
         virtual_lines = {
            only_current_line = true,
            highlight_whole_line = false,
         },
      }),
   },

   -- ╔═╡ PLUGIN: lspsaga.nvim ╞══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/nvimdev/lspsaga.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   {
      "nvimdev/lspsaga.nvim",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("lspsaga").setup()
      end,
   },

   -- ╔═╡ PLUGIN: marks.nvim ╞════════════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/chentoast/marks.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════╡ UI: Navigation ╞═╝ --

   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {
         default_mappings = false,
         force_write_shada = true,
         sign_priority = 10,
      },
   },

   -- ╔═╡ PLUGIN: mason-lspconfig.nvim ╞══════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/williamboman/mason-lspconfig.nvim   ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

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

   -- ╔═╡ PLUGIN: multiple-cursors.nvim ╞═════════════════════╡ [***] ╞═╗ --
   -- ║  Source:                                                        ║ --
   -- ║     https://github.com/brenton-leighton/multiple-cursors.nvim   ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════╡ Editor: Multicursor ╞═╝ --

   {
      "brenton-leighton/multiple-cursors.nvim",
      version = "*", -- Use the latest tagged version
      opts = {
         pre_hook = function()
            vim.cmd("Lazy load mini.move")
            vim.g.minipairs_disable = true
            require("cmp").setup({ enabled = false })
            vim.cmd("NoMatchParen")
         end,
         post_hook = function()
            vim.g.minipairs_disable = false
            require("cmp").setup({ enabled = true })
            vim.cmd("DoMatchParen")
         end,
      },
   },

   -- ╔═╡ PLUGIN: neo-tree.nvim ╞═════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/nvim-neo-tree/neo-tree.nvim         ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════╡ Editor: File Manager ╞═╝ --

   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      },
      config = function()
         vim.fn.sign_define("DiagnosticSignError", {
            text = " ",
            texthl = "DiagnosticSignError",
         })
         vim.fn.sign_define("DiagnosticSignWarn", {
            text = " ",
            texthl = "DiagnosticSignWarn",
         })
         vim.fn.sign_define("DiagnosticSignInfo", {
            text = " ",
            texthl = "DiagnosticSignInfo",
         })
         vim.fn.sign_define("DiagnosticSignHint", {
            text = "󰌵",
            texthl = "DiagnosticSignHint",
         })
         require("neo-tree").setup({
            popup_border_style = "single",
            add_blank_line_at_top = true,
            auto_clean_after_session_restore = true,
            -- "trace", "debug", "info", "warn", "error", "fatal"
            log_level = "info",
            -- true, false, "/path/to/file.log"
            log_to_file = "$HOME/.config/nvim/.logs/neotree.log",
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
      end,
   },

   -- ╔═╡ PLUGIN: nerdy.nvim ╞════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/2KAbhishek/nerdy.nvim               ║ --
   -- ║  License: GPL-3.0                                               ║ --
   -- ╚═══════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   {
      "2kabhishek/nerdy.nvim",
      dependencies = {
         "stevearc/dressing.nvim",
         "nvim-telescope/telescope.nvim",
      },
      cmd = "Nerdy",
   },

   -- ╔═╡ PLUGIN: nui.nvim ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/MunifTanjim/nui.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════════════════╡ UI ╞═╝ --

   { "MunifTanjim/nui.nvim" },

   -- ╔═╡ PLUGIN: nvim-cmp ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/hrsh7th/nvim-cmp                    ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════╡ Coding: Completions ╞═╝ --

   --    { "hrsh7th/nvim-cmp" },

   -- ╔═╡ PLUGIN: nvim-comment-frame ╞════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/s1n7ax/nvim-comment-frame           ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════╡ Coding: Comments ╞═╝ --

   { "s1n7ax/nvim-comment-frame" },

   -- ╔═╡ PLUGIN: nvim-dap ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/mfussenegger/nvim-dap               ║ --
   -- ║  License: GPL-3.0                                               ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: DAP ╞═╝ --

   --    { "mfussenegger/nvim-dap" },

   -- ╔═╡ PLUGIN: nvim-dap-ui ╞═══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/rcarriga/nvim-dap-ui                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: DAP ╞═╝ --

   --    { "rcarriga/nvim-dap-ui" },

   -- ╔═╡ PLUGIN: nvim-lsp-file-operations ╞══════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/antosha417/nvim-lsp-file-operations ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

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

   -- ╔═╡ PLUGIN: nvim-lspconfig ╞════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/neovim/nvim-lspconfig               ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚═════════════════════════════════════════════════╡ Coding: LSP ╞═╝ --

   --    { "neovim/nvim-lspconfig" },

   -- ╔═╡ PLUGIN: nvim-nio ╞══════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/nvim-neotest/nvim-nio               ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════════╡ API: IO ╞═╝ --

   --    { "nvim-neotest/nvim-nio" },

   -- ╔═╡ PLUGIN: nvim-surround ╞═════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/kylechui/nvim-surround              ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════════════════╡ Coding:  ╞═╝ --

   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
   },

   -- ╔═╡ PLUGIN: nvim-treesitter ╞═══════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/nvim-treesitter/nvim-treesitter     ║ --
   -- ║  License: Apache-2.0                                            ║ --
   -- ╚══════════════════════════════════════════════╡ Coding: Syntax ╞═╝ --

   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
         "RRethy/nvim-treesitter-endwise",
      },
      build = function()
         require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      vim.treesitter.language.register("markdown", "octo"),
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
            "yaml",
         },
         textobjects = {
            select = {
               enable = true,
               lookahead = true,
            },
            swap = {
               enable = true,
            },
            move = {
               enable = true,
               set_jumps = true,
            },
            lsp_interop = {
               enable = true,
               border = "none",
            },
         },
         endwise = {
            enable = true,
         },
      },
   },

   -- ╔═╡ PLUGIN: nvim-update-time ╞══════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/StonyBoy/nvim-update-time           ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚════════════════════════════════════════╡ Utilities: Timestamp ╞═╝ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 15,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: ",
      },
   },

   -- ╔═╡ PLUGIN: nvim-various-textobjects ╞══════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/chrisgrieser/nvim-various-textobjs  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════╡ Coding: Object Manipulation ╞═╝ --

   {
      "chrisgrieser/nvim-various-textobjs",
      event = "VeryLazy",
      opts = {
         keymaps = {
            useDefaults = false,
         },
      },
   },

   -- ╔═╡ PLUGIN: nvim-web-devicons ╞═════════════════════════╡ [***] ╞═╗ --
   -- ║  Source: https://github.com/nvim-tree/nvim-web-devicons         ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═══════════════════════════════════════════════════╡ UI: Icons ╞═╝ --

   { "kyazdani42/nvim-web-devicons" },

   -- ╔═╡ PLUGIN: octo.nvim ╞═════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/pwntester/octo.nvim                 ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════════╡ Editor: Git ╞═╝ --

   {
      "pwntester/octo.nvim",
      opts = {
         enable_builtin = true,
         default_remote = { "origin", "upstream" },
         picker = "telescope",
         default_to_projects_v2 = false,
         suppress_missing_scope = {
            projects_v2 = true,
         },
         ui = {
            -- show "modified" marks on the sign column
            use_signcolumn = false,
            -- show "modified" marks on the status column
            use_signstatus = true,
         },
         mappings_disable_default = true,
      },
   },

   -- ╔═╡ PLUGIN: sqlite.lua ╞════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/kkharji/sqlite.lua                  ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═══════════════════════════════════════════╡ Utility: Database ╞═╝ --

   { "kkharji/sqlite.lua" },

   -- ╔═╡ PLUGIN: stylua-nvim ╞═══════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/wesleimp/stylua.nvim                ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════╡ Coding: Formatting ╞═╝ --

   { "ckipp01/stylua-nvim" },

   -- ╔═╡ PLUGIN: treesj ╞════════════════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/Wansmer/treesj                      ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚══════════════════════════════════════════════════════╡ Coding ╞═╝ --

   {
      "Wansmer/treesj",
      opts = {
         use_default_keymaps = false,
         max_join_length = 79,
      },
   },

   -- ╔═╡ PLUGIN: virtcolumn.nvim ╞═══════════════════════════╡ [*  ] ╞═╗ --
   -- ║  Source: https://github.com/lukas-reineke/virt-column.nvim      ║ --
   -- ║  License: MIT                                                   ║ --
   -- ╚═════════════════════════════════════════════╡ UI: Colorcolumn ╞═╝ --

   {
      "lukas-reineke/virt-column.nvim",
      opts = {
         virtcolumn = "80",
      },
   },

   -- ╔═╡ PLUGIN: yanky.nvim ╞════════════════════════════════╡ [** ] ╞═╗ --
   -- ║  Source: https://github.com/gbprod/yanky.nvim                   ║ --
   -- ║  License: WTFPL                                                 ║ --
   -- ╚═══════════════════════════════════╡ Coding: Text Manipulation ╞═╝ --

   {
      "gbprod/yanky.nvim",
      config = true,
   },
}

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
