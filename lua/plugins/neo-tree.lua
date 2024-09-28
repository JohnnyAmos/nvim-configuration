--JMJ--------------------------------------------------------------------AMDG--
--                           PLUGIN: neo-tree.nvim                           --
--                      Last Modified: 2024-09-10 17:42
-------------------------------------------------------------------------------

return {
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = 'v3.x',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-tree/nvim-web-devicons',
         'MunifTanjim/nui.nvim'
      },
      config = function()
         require('neo-tree').setup({
            add_blank_line_at_top = true,
            auto_clean_after_session_restore = true,
            close_if_last_window = false,
            log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
            -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
            log_to_file = '$HOME/.config/nvim/.logs/neotree.log',
            -- when opening files, don't use windows containing these
            -- filetypes or buftypes
            open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
            -- "double", "none", "rounded", "shadow", "single" or "solid"
            popup_border_style = "single",
            -- used when sorting files and directories in the tree
            sort_case_insensitive = false,
            use_popups_for_input = true, -- If false, inputs will use vim.ui.input()
            use_default_mappings = true,
            -- source_selector provides clickable tabs to switch between sources.
            window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
                       -- possible options. These can also be functions that return these options.
               position = "left", -- left, right, top, bottom, float, current
               width = 40, -- applies to left and right positions
               height = 15, -- applies to top and bottom positions
               auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
               popup = { -- settings that apply to float position only
                  size = {
                     height = "80%",
                     width = "50%",
                  },
                  position = "50%", -- 50% means center it
                  -- you can also specify border here, if you want a different setting from
                  -- the global popup_border_style.
               },
               same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
               insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
                                    -- "child":   Insert nodes as children of the directory under cursor.
                                    -- "sibling": Insert nodes  as siblings of the directory under cursor.
               -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
               -- You can also create your own commands by providing a function instead of a string.
               mapping_options = {
                  noremap = true,
                  nowait = true,
               },
            },
            filesystem = {
               async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
                                              -- "always" means directory scans are always async.
                                              -- "never"  means directory scans are never async.
               scan_mode = "shallow", -- "shallow": Don't scan into directories to detect possible empty directory a priori
                                          -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
               bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
               cwd_target = {
                  sidebar = "tab",   -- sidebar is when position = left or right
                  current = "window" -- current is when position = current
               },
               check_gitignore_in_search = true, -- check gitignore status for files/directories when searching
                                                 -- setting this to false will speed up searches, but gitignored
                                                 -- items won't be marked if they are visible.
               -- The renderer section provides the renderers that will be used to render the tree.
               --   The first level is the node type.
               --   For each node type, you can specify a list of components to render.
               --       Components are rendered in the order they are specified.
               --         The first field in each component is the name of the function to call.
               --         The rest of the fields are passed to the function as the "config" argument.
               filtered_items = {
                  visible = false, -- when true, they will just be displayed differently than normal items
                  force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
                  show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
                  hide_dotfiles = false,
                  hide_gitignored = true,
                  hide_hidden = true, -- only works on Windows for hidden files/directories
                  hide_by_name = {
                     ".DS_Store",
                     "thumbs.db"
                     --"node_modules",
                  },
                  hide_by_pattern = { -- uses glob style patterns
                     --"*.meta",
                     --"*/src/*/tsconfig.json"
                  },
                  always_show = { -- remains visible even if other settings would normally hide it
                     --".gitignored",
                  },
                  always_show_by_pattern = { -- uses glob style patterns
                     --".env*",
                  },
                  never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                     --".DS_Store",
                     --"thumbs.db"
                  },
                  never_show_by_pattern = { -- uses glob style patterns
                     --".null-ls_*",
                  },
               },
               find_by_full_path_words = false,  -- `false` means it only searches the tail of a path.
                                                 -- `true` will change the filter into a full path
                                                 -- search with space as an implicit ".*", so
                                                 -- `fi init`
                                                 -- will match: `./sources/filesystem/init.lua
               group_empty_dirs = false, -- when true, empty folders will be grouped together
               search_limit = 50, -- max number of search results when using filters
               follow_current_file = {
                  enabled = false, -- This will find and focus the file in the active buffer every time
                  --               -- the current file is changed while the tree is open.
                  leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
               },
               hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                       -- in whatever position is specified in window.position
                                     -- "open_current",-- netrw disabled, opening a directory opens within the
                                                       -- window like netrw would, regardless of window.position
                                     -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
               use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                               -- instead of relying on nvim autocmd events.
            },
            buffers = {
               bind_to_cwd = true,
               follow_current_file = {
                  enabled = true, -- This will find and focus the file in the active buffer every time
                  --              -- the current file is changed while the tree is open.
                  leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
               },
               group_empty_dirs = true,  -- when true, empty directories will be grouped together
               show_unloaded = false,    -- When working with sessions, for example, restored but unfocused buffers
                                         -- are mark as "unloaded". Turn this on to view these unloaded buffer.
               terminals_first = false,  -- when true, terminals will be listed before file buffers
            },
         })
      end
   }
}

