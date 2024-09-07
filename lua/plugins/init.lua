-- TODO: add comment header


return {
   {
      'tinted-theming/base16-vim',
      priority = 1000
   },
   {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {}
   },
   -- 'fecet/fortune.nvim',
   'tpope/vim-surround',
   'tpope/vim-repeat',
   {
      'folke/trouble.nvim',
      cmd = 'Trouble',
      opts = {}
   },
   {
      'nvim-treesitter/nvim-treesitter',
      build = function()
         require('nvim-treesitter.install').update({ with_sync = true })()
      end
   },
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         }
      }
   },
   {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = true
   },
   {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
         require('telescope').load_extension('bookmarks')
         require("telescope").load_extension("frecency")
         require('telescope').load_extension('fzf')
         require('telescope').load_extension('repo')
      end
   },
   'wesleimp/stylua.nvim',
   'kkharji/sqlite.lua',
   'nvim-lua/plenary.nvim',
   'cljoly/telescope-repo.nvim',
   {
      'nvim-tree/nvim-web-devicons',
      lazy = true
   },
   {
      'StonyBoy/nvim-update-time',
      config = function()
         require('nvim-update-time').setup({
            last = 5,
            format = '%Y-%m-%d %H:%M',
            pattern = 'Last Modified: '
         })
      end,
   },
   {
      'MunifTanjim/nui.nvim',
      lazy = false
   },
   {
      'folke/neoconf.nvim',
      cmd = 'Neoconf'
   },
--    {
--       'echasnovski/mini.nvim',
--       version = false,
--       config = function()
--          require('mini.diff').setup()
--          require('mini.extra').setup()
--          require('mini.files').setup()
--          require('mini.git').setup()
--          require('mini.icons').setup()
--          require('mini.sessions').setup()
--          require('mini.starter').setup()
--          require('mini.visits').setup()
--       end
--    },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
         require('lualine').setup()
      end,
      options = { theme = 'base16-isotope' }
   },
   {
      'MagicDuck/grug-far.nvim',
      config = function()
         require('grug-far').setup()
      end
   },
   {
      'lewis6991/gitsigns.nvim',
      opts = {}
   },
   {
      'folke/flash.nvim',
      event = 'VeryLazy',
      config = function()
         require('flash').setup()
      end
   },
   {
      'stevearc/dressing.nvim',
      opts = {}
   },
--    {
--       'folke/todo-comments.nvim',
--       dependencies = { 'nvim-lua/plenary.nvim' },
--       cmd = { 'TodoTrouble', 'TodoTelescope' },
--       lazy = false,
--       config = function()
--          require('todo-comments').setup()
--       end
--    },
   'nvim-telescope/telescope-github.nvim',
   {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = {
         'nvim-telescope/telescope.nvim',
         'nvim-lua/plenary.nvim'
      }
   },
   {
      'pwntester/octo.nvim',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-telescope/telescope.nvim',
         'nvim-tree/nvim-web-devicons',
         'nvim-treesitter/nvim-treesitter'
      },
      config = function()
         require'octo'.setup {
            suppress_missing_scope = {
               projects_v2 = true,
            }
         }
         vim.treesitter.language.register('markdown', 'octo')
      end
   },
   {
      'rcarriga/nvim-notify',
      lazy = false
   },
   {
      's1n7ax/nvim-comment-frame',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
         require('nvim-comment-frame').setup({
            frame_width = 79,
            line_wrap_len = 60
         })
      end
   },
   {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
   },
   "nvim-telescope/telescope-frecency.nvim",
   {
      'folke/edgy.nvim',
      event = "VeryLazy",
      config = function()
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
               {
                  title = "Spectre",
                  ft = "spectre_panel",
                  size = { height = 0.4 }
               },
               {
                  title = "Neotest Output",
                  ft = "neotest-output-panel",
                  size = { height = 15 }
               },
            },
            left = {
               -- Neo-tree filesystem always takes half the screen height
               {
                  title = "Neo-Tree",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "filesystem"
                  end,
                  size = { height = 0.5 },
               },
               {
                  title = "Neo-Tree Git",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "git_status"
                  end,
                  pinned = true,
                  collapsed = true, -- show window as collapsed on start
                  open = "Neotree position=right git_status",
               },
               {
                  title = "Neo-Tree Buffers",
                  ft = "neo-tree",
                  filter = function(buf)
                     return vim.b[buf].neo_tree_source == "buffers" end,
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
                  open = "SymbolsOutlineOpen",
               },
               -- any other neo-tree windows
               "neo-tree",
            },
            right = {
               {
                  ft = "help",
                  filter = function(buf)
                     return vim.bo[buf].buftype == "help"
                  end,
               },
            },
         }
      end,
   },
   {
      "lukas-reineke/headlines.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = true,
   },
   'smolck/command-completion.nvim',
   {
      'dhruvmanila/browser-bookmarks.nvim',
      version = '*',
      opts = {
         selected_browser = 'vivaldi'
      },
      dependencies = {
         'nvim-telescope/telescope.nvim'
      }
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = 'v3.x',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-tree/nvim-web-devicons',
         'MunifTanjim/nui.nvim'
      }
   },
   {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      opts = {
         options = {
            numbers = 'buffer_id',
            offsets = {
               {
                  filetype = "neo-tree",
                  text = function()
                     return vim.fn.getcwd()
                  end,
                  highlight = "Directory",
                  -- use a "true" to enable the default,
                  -- or set your own character
                  separator = true
               }
            },
            show_tab_indicators = true,
            hover = {
               enabled = true,
               delay = 200,
               reveal = {'close'}
            }
         }
      }
   },
   {
      'stevearc/conform.nvim',
      opts = {
         event = { "BufWritePre" },
         cmd = { "ConformInfo" },
         keys = {
            {
               -- Customize or remove this keymap to your liking
               "<leader>f",
               function()
                  require("conform").format({ async = true })
               end,
               mode = "",
               desc = "Format buffer",
            },
         },
         -- This will provide type hinting with LuaLS
         ---@module "conform"
         ---@type conform.setupOpts
         opts = {
            -- Define your formatters
            formatters_by_ft = {
               lua = { "stylua" },
               python = { "isort", "black" },
               javascript = {
                  "prettierd",
                  "prettier",
                  stop_after_first = true
               },
            },
            -- Set default options
            default_format_opts = {
               lsp_format = "fallback",
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500 },
            -- Customize formatters
            formatters = {
               shfmt = {
                  prepend_args = { "-i", "2" },
               },
            },
         },
--          init = function()
--             -- If you want the formatexpr, here is the place to set it
--             vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--          end,
      }
   },
   install = { colorscheme = { "base16-isotope" } },
   checker = { enabled = true },
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

