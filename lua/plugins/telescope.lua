-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/telescope.lua            ║ --
-- ║  Source: https://github.com/nvim-telescope/telescope.nvim             ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] UI                                     Last modified: 2025-05-17 16:27

local M = {
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
      { "nvim-telescope/telescope-symbols.nvim" },
   },
}

function M.config()
   local ok, Layout = pcall(require, "nui.layout")
   if not ok then
      print("Error: " .. Layout)
   end

   local ok, Popup = pcall(require, "nui.popup")
   if not ok then
      print("Error: " .. Popup)
   end

   local ok, telescope = pcall(require, "telescope")
   if not ok then
      print("Error: " .. telescope)
   end

   local ok, TSLayout = pcall(require, "telescope.pickers.layout")
   if not ok then
      print("Error: " .. TSLayout)
   end

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
                  height = "60%",
               },
            },
            vertical = {
               size = {
                  width = "90%",
                  height = "90%",
               },
            },
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
                  change_cwd_to_plugin = "<c-c>d",
               },
            },
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
                  left = "│",
               },
               results_patch = {
                  minimal = {
                     top_left = "┌",
                     top_right = "┐",
                  },
                  horizontal = {
                     top_left = "┌",
                     top_right = "┬",
                  },
                  vertical = {
                     top_left = "├",
                     top_right = "┤",
                  },
               },
               prompt = {
                  top_left = "├",
                  top = "─",
                  top_right = "┤",
                  right = "│",
                  bottom_right = "┘",
                  bottom = "─",
                  bottom_left = "└",
                  left = "│",
               },
               prompt_patch = {
                  minimal = {
                     bottom_right = "┘",
                  },
                  horizontal = {
                     bottom_right = "┴",
                  },
                  vertical = {
                     bottom_right = "┘",
                  },
               },
               preview = {
                  top_left = "┌",
                  top = "─",
                  top_right = "┐",
                  right = "│",
                  bottom_right = "┘",
                  bottom = "─",
                  bottom_left = "└",
                  left = "│",
               },
               preview_patch = {
                  minimal = {},
                  horizontal = {
                     bottom = "─",
                     bottom_left = "",
                     bottom_right = "┘",
                     left = "",
                     top_left = "",
                  },
                  vertical = {
                     bottom = "",
                     bottom_left = "",
                     bottom_right = "",
                     left = "│",
                     top_left = "┌",
                  },
               },
            }

            local results = make_popup({
               focusable = false,
               border = {
                  style = border.results,
                  text = {
                     top = picker.results_title,
                     top_align = "center",
                  },
               },
               win_options = {
                  winhighlight = "Normal:Normal",
               },
            })

            local prompt = make_popup({
               enter = true,
               border = {
                  style = border.prompt,
                  text = {
                     top = picker.prompt_title,
                     top_align = "center",
                  },
               },
               win_options = {
                  winhighlight = "Normal:Normal",
               },
            })

            local preview = make_popup({
               focusable = false,
               border = {
                  style = border.preview,
                  text = {
                     top = picker.preview_title,
                     top_align = "center",
                  },
               },
            })

            local box_by_kind = {
               vertical = Layout.Box({
                  Layout.Box(preview, { grow = 1 }),
                  Layout.Box(results, { grow = 1 }),
                  Layout.Box(prompt, { size = 3 }),
               }, { dir = "col" }),
               horizontal = Layout.Box({
                  Layout.Box({
                     Layout.Box(results, { grow = 1 }),
                     Layout.Box(prompt, { size = 3 }),
                  }, { dir = "col", size = "50%" }),
                  Layout.Box(preview, { size = "50%" }),
               }, { dir = "row" }),
               minimal = Layout.Box({
                  Layout.Box(results, { grow = 1 }),
                  Layout.Box(prompt, { size = 3 }),
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
                  preview.border:set_style(border.preview_patch[box_type])
               end
            end

            local function get_layout_size(box_kind)
               return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
            end

            local box, box_kind = get_box()
            local layout = Layout({
               relative = "editor",
               position = "50%",
               size = get_layout_size(box_kind),
            }, box)

            layout.picker = picker
            prepare_layout_parts(layout, box_kind)

            local layout_update = layout.update
            function layout:update()
               local box, box_kind = get_box()
               prepare_layout_parts(layout, box_kind)
               layout_update(self, {
                  size = get_layout_size(box_kind),
               }, box)
            end

            return TSLayout(layout)
         end,
      },
   })

   telescope.load_extension("frecency")
   telescope.load_extension("fzf")
   telescope.load_extension("gh")
   telescope.load_extension("lazy")
   telescope.load_extension("nerdy")
   telescope.load_extension("repo")
   -- require("telescope.builtin").symbols{
   --    sources = {
   --       "emoji",
   --       "gitmoji",
   --       "julia",
   --       "kaomoji",
   --       "math",
   --       "nerd"
   --    }
   -- }
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
