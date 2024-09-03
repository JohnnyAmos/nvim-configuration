-- TODO: add comment header


require("lazy").setup({
  spec = {
    {
      'tinted-theming/base16-vim',
      priority = 1000
    },
    {
      'tpope/vim-surround'
    },
    {
      'tpope/vim-repeat'
    },
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
--       config = function()
--         require('telescope').load_extension('bookmarks')
--       end
    },
    {
      'wesleimp/stylua.nvim'
    },
    {
      'kkharji/sqlite.lua'
    },
    {
      'nvim-lua/plenary.nvim'
    },
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
    {
      'echasnovski/mini.nvim',
      version = false,
      config = function()
        require('mini.diff').setup()
        require('mini.extra').setup()
        require('mini.files').setup()
        require('mini.git').setup()
        require('mini.icons').setup()
        require('mini.sessions').setup()
        require('mini.visits').setup()

        -- NOTE: Configuration for mini.starter:
        local starter = require('mini.starter')
        starter.setup({
          evaluate_single = true,
          items = {
            starter.sections.builtin_actions(),
            starter.sections.telescope(),
            starter.sections.sessions(5, true),
            {
              name = 'Todo',
              section = 'Quick Links',
              action = ':e ~/.todo.lua'
            }
          },
          content_hooks = {
            starter.gen_hook.adding_bullet('░ ☞  '),
            starter.gen_hook.indexing('all', {
              'Builtin actions',
              'Telescope'
            }),
            starter.gen_hook.aligning('center', 'center'),
          },
        })
      end
    },
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
    {
      'folke/todo-comments.nvim',
      cmd = { 'TodoTrouble', 'TodoTelescope' },
      lazy = false,
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('todo-comments').setup()
      end
    },
    {
      'nvim-telescope/telescope-github.nvim'
    },
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
            { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
            { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
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
              collapsed = true, -- show window as closed/collapsed on start
              open = "Neotree position=right git_status",
            },
            {
              title = "Neo-Tree Buffers",
              ft = "neo-tree",
              filter = function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
              end,
              pinned = true,
              collapsed = true, -- show window as closed/collapsed on start
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


  },
  install = { colorscheme = { "base16-isotope" } },
  checker = { enabled = true },
})

-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins" },
--   },
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "base16-isotope" } },
--   -- automatically check for plugin updates
--   checker = { enabled = true },
-- })

