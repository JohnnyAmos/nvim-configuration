-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Config file: $HOME/.config/nvim/lua/config/keymaps.lua               ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-11 20:37


local wk = require("which-key")

-- ╞════╡ SECTION: core maps ╞═════════════════════════════════════════════╡ --

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
   { "<left>", "<nop>", desc = "Inactive, use h" },
   { "<right>", "<nop>", desc = "Inactive, use l" },

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


-- ╞════╡ SECTION: Leader 0: telescope.nvim ╞══════════════════════════════╡ --

wk.add({

   { "<leader>0", group = "Telescope" },
   { --                                                     ==> @telescope.nvim
      "<leader>0r",
      "<cmd>Telescope resume<cr>",
      desc = "Resume last telescope session"
   },

})

-- ╞════╡ SECTION: Leader 1: nvim-treesitter ╞═════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader 2 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>2", group = "Empty" },
   {
      "<leader>2a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 3 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>3", group = "Empty" },
   {
      "<leader>3a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 4 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>4", group = "Empty" },
   {
      "<leader>4a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 5 ╞══════════════════════════════════════════════╡ --



wk.add({

   { "<leader>5", group = "Empty" },
   {
      "<leader>5a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 6 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>6", group = "Empty" },
   {
      "<leader>6a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 7 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>7", group = "Empty" },
   {
      "<leader>7a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 8 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>8", group = "Empty" },
   {
      "<leader>8a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader 9 ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>9", group = "Empty" },
   {
      "<leader>9a",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader a ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>a", group = "Empty" },
   {
      "<leader>aa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader b: Buffers ╞═════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader c: Comments ╞════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader d: Diagnostics ╞═════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader e ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>e", group = "Empty" },
   {
      "<leader>ea",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader f: Files ╞═══════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader g: Github ╞══════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader h ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>h", group = "Empty" },
   {
      "<leader>ha",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader i ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>i", group = "Empty" },
   {
      "<leader>ia",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader j ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>j", group = "Empty" },
   {
      "<leader>ja",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader k ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>k", group = "Empty" },
   {
      "<leader>ka",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader l: LSP ╞═════════════════════════════════════════╡ --


wk.add({

   { "<leader>l", group = "LSP" },
   {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "LSP Info"
   }

})

-- ╞════╡ SECTION: Leader m: Marks ╞═══════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader n: Navigation ╞══════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader o ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>o", group = "Empty" },
   {
      "<leader>oa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader p: Put ╞═════════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader q ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>q", group = "Empty" },
   {
      "<leader>qa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader r: Registers ╞═══════════════════════════════════╡ --


wk.add({

   { "<leader>r", group = "Registers" },
   {
      "<leader>ra",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})

-- ╞════╡ SECTION: Leader s: Surround ╞════════════════════════════════════╡ --


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

-- ╞════╡ SECTION: Leader t: Text ╞════════════════════════════════════════╡ --


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



-- ╞════╡ SECTION: Leader u ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>u", group = "Empty" },
   {
      "<leader>ua",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞════╡ SECTION: Leader v ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>v", group = "Empty" },
   {
      "<leader>va",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞════╡ SECTION: Leader w: Windows/Tabs ╞════════════════════════════════╡ --


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



-- ╞════╡ SECTION: Leader x ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>x", group = "Empty" },
   {
      "<leader>xa",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})



-- ╞════╡ SECTION: Leader y: Yank ╞════════════════════════════════════════╡ --


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



-- ╞════╡ SECTION: Leader z ╞══════════════════════════════════════════════╡ --


wk.add({

   { "<leader>z", group = "Empty" },
   {
      "<leader>za",
      "<cmd>write<cr>",
      desc = "placeholder"
   },

})


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

