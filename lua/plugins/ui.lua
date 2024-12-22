-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/ui.lua                   ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-18 15:30


return {

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
            {
               ft = "help",
               filter = function(buf)
                  return vim.bo[buf].buftype == "help"
               end
            }
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
   },

-- ╔═╡ PLUGIN: lush.nvim ╞═════════════════════════════════════════════════╗ --
-- ║                                                                       ║ --
-- ║  Plugin source: https://github.com/rktjmp/lush.nvim                   ║ --
-- ║  Plugin license: MIT                                                  ║ --
-- ║                                                                       ║ --
-- ╚═════════════════════════════════════════════╡ UI: Colorscheme Maker ╞═╝ --

   { "rktjmp/lush.nvim" },

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
   }

}

-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

