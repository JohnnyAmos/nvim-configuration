-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/wip.lua                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-21 17:45


--  TODO:  It's a mess. I'm working on it.

return {

-- ╞═╡ PLUGIN: command-completion.nvim ╞═══════════════════════════════════╡ --

--    {
--       "smolck/command-completion.nvim",
--       opts = {
--          border = single,
--          max_col_num = 3,
--          min_col_width = 25,
--          use_matchfuzzy = false
--       }
--    },

-- ╞═╡ PLUGIN: conform.nvim ╞══════════════════════════════════════════════╡ --

--    {
--       "stevearc/conform.nvim",
--       event = "BufWritePre",
--       cmd = "ConformInfo",
--       opts = {
--          formatters_by_ft = {
--             lua = { "stylua" },
--             python = { "isort", "black" },
--             javascript = { "prettierd", "prettier", stop_after_first = true }
--          },
--          default_format_opts = {
--             lsp_format = "fallback"
--          },
--       },
--       init = function()
--          vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
--       end
--    },

-- ╞═╡ PLUGIN: flash.nvim ╞════════════════════════════════════════════════╡ --

--    {
--       "folke/flash.nvim",
--       event = "VeryLazy",
--       opts = {
--          -- Ordered thusly because it places the home row keys first, with the
--          -- top second and the bottom third.
--          labels = "asdfghjklqwertyuiopzxcvbnm",
--          search = {
--             mode = "search",
--             incremental = true
--          }
--       }
--    },

-- ╞═╡ PLUGIN: lazydev.nvim ╞══════════════════════════════════════════════╡ --

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

-- ╞═╡ PLUGIN: marks.nvim ╞════════════════════════════════════════════════╡ --

--    {
--       "chentoast/marks.nvim",
--       event = "VeryLazy",
--       opts = {
--          default_mappings = false,
--          force_write_shada = true,
--          sign_priority = 10
--       }
--    },

-- ╞═╡ PLUGIN: mason.nvim ╞════════════════════════════════════════════════╡ --

--    {
--       "williamboman/mason.nvim",
--       opts = {
--          PATH = 'skip',
--          border = 'single',
--          ui = {
--             icons = icons_mason_ui,
--          }
--       }
--    },

-- ╞═╡ PLUGIN: neo-tree.nvim ╞═════════════════════════════════════════════╡ --

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

-- ╞═╡ PLUGIN: nvim-update-time ╞══════════════════════════════════════════╡ --

   {
      "StonyBoy/nvim-update-time",
      opts = {
         last = 8,
         format = "%Y-%m-%d %H:%M",
         pattern = "Last modified: "
      }
   },

-- ╞═╡ PLUGIN: telescope.nvim ╞════════════════════════════════════════════╡ --

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

-- ╞═╡ PLUGIN: todo-comments.nvim ╞════════════════════════════════════════╡ --

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

-- ╞═╡ PLUGIN: treesj ╞════════════════════════════════════════════════════╡ --

--    {
--       "Wansmer/treesj",
--       opts = {
--          use_default_keymaps = false,
--          max_join_length = 79
--       }
--    },

-- ╞═╡ PLUGIN: trouble.nvim ╞══════════════════════════════════════════════╡ --

--    {
--       "folke/trouble.nvim",
--       cmd = "Trouble",
--       opts = {
--          keys = { -- trouble window-specific keys need not be added to maps.lua
--             ["?"] = "help",
--             r = "refresh",
--             R = "toggle_refresh",
--             q = "close",
--             o = "jump_close",
--             ["<esc>"] = "cancel",
--             ["<cr>"] = "jump",
--             ["<2-leftmouse>"] = "jump",
--             ["<c-s>"] = "jump_split",
--             ["<c-v>"] = "jump_vsplit",
--             -- go down to next item (accepts count)
--             -- j = "next",
--             ["}"] = "next",
--             ["]]"] = "next",
--             -- go up to prev item (accepts count)
--             -- k = "prev",
--             ["{"] = "prev",
--             ["[["] = "prev",
--             dd = "delete",
--             d = { action = "delete", mode = "v" },
--             i = "inspect",
--             p = "preview",
--             P = "toggle_preview",
--             zo = "fold_open",
--             zO = "fold_open_recursive",
--             zc = "fold_close",
--             zC = "fold_close_recursive",
--             za = "fold_toggle",
--             zA = "fold_toggle_recursive",
--             zm = "fold_more",
--             zM = "fold_close_all",
--             zr = "fold_reduce",
--             zR = "fold_open_all",
--             zx = "fold_update",
--             zX = "fold_update_all",
--             zn = "fold_disable",
--             zN = "fold_enable",
--             zi = "fold_toggle_enable"
--          }
--       }
--    },

-- ╞═╡ PLUGIN: which-key.nvim ╞════════════════════════════════════════════╡ --

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
   }


}


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

