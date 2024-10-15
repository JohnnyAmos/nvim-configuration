--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- File: $HOME/.config/nvim/lua/config/maps.lua
-- Last modified: 2024-09-29 11:28
-------------------------------------------------------------------------------


local wk = require("which-key")

-- SECTION: core maps

wk.add({

   -- Command/subject group assignments.
   -- Plugin-specific groups are assigned in their individual sections.
   { "<leader>b", group = "Buffers" },
   { "<leader>c", group = "Comments" },
   { "<leader>d", group = "Diagnostics" },
   { "<leader>f", group = "Files" },
   { "<leader>t", group = "Text" },
   { "<leader>w", group = "Windows/Tabs" },
   { "<leader>wc", group = "Close…" },

   -- Close all but current window in a single tab.
   {
      "<leader>wc",
      "<cmd>only<cr>",
      mode = "n",
      desc = "Close all but this window"
   },

   -- Make closing help buffers & tabs easy.
   { "<leader>wch", "<cmd>helpc<cr>", desc = "Close help" },
   { "<leader>wct", "<cmd>tabc<cr>", desc = "Close tab" },

   -- Insert empty line in normal mode.
   --    For lines below cursor:
   --       <down> => one line
   --       n<down> => n lines
   --    For lines above cursor:
   --       <up> => one line
   --       n<up> => n lines
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

   -- Diagnostic keymaps
   {
      "<leader>dq",
      "vim.diagnostic.setloclist",
      desc = "Open diagnostic quickfix list"
   },

   -- exit terminal mode (doesn"t work in all situations)
   { "<esc><esc>", "<c-\\><c-n>", mode = "t", desc = "Exit terminal mode" },

   -- Switch & close buffers quickly.
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
   {
      "<leader>bd",
      "<cmd>bdelete<cr>",
      desc = "Close buffer"
   },
   -- The following is handles my Telescope now.
   -- {
   --    "<leader>bb",
   --    "<cmd>buffers<cr>:b<space>",
   --    mode = "n",
   --    desc = "List Buffers"
   -- },

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
   { "<c-up>",    "<cmd>res -2<cr>",       desc = "Resize window up" },
   { "<c-down>",  "<cmd>res +2<cr>",       desc = "Resize window down" },
   { "<c-left>",  "<cmd>vert res -2<cr>",  desc = "Resize window left" },
   { "<c-right>", "<cmd>vert res +_2<cr>", desc = "Resize window right" }

})

-- SECTION: conform.nvim

wk.add({

   {
      "<localleader>f",
      function()
         require("conform").format({ async = true })
      end,
      desc = "Format buffer"
   },

})

-- SECTION: edgy.nvim

wk.add({

   { "<localleader>e", desc = "edgy.nvim" },
   {
      "<localleader>et",
      function()
         require("edgy").toggle()
      end,
      desc = "Edgy Toggle"
   },
   {
      "<localleader>ew",
      function() require("edgy").select() end,
      desc = "Edgy Select Window"
   }

})

-- SECTION: nvim-comment-frame.nvim

wk.add({

   {
      "<leader>cs",
      "<cmd>lua require('nvim-comment-frame').add_comment()<cr>",
      mode = "n",
      desc = "Add single-line comment frame"
   },
   {
      "<leader>cm",
      "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<cr>",
      mode = "n",
      desc = "Add multiple-line comment frame"
   },

})

-- SECTION: nvim-surround

wk.add({

   { "<leader>s", desc = "Surround" },
   { "<leader>si", desc = "Insert Mode" },
   {
      "<leader>sis",
      "<Plug>(nvim-surround-insert)",
      mode = "i",
      desc = "Spot insert"
   },
   {
      "<leader>sil",
      "<Plug>(nvim-surround-insert-line)",
      mode = "i",
      desc = "Line insert"
   },
   { "<leader>sn", desc = "Normal mode" },
   {
      "<leader>sns",
      "<Plug>(nvim-surround-normal)",
      mode = "n",
      desc = "Spot insert"
   },
   {
      "<leader>snc",
      "<Plug>(nvim-surround-normal-cur)",
      mode = "n",
      desc = "Spot insert in current line"
   },
   {
      "<leader>snls",
      "<Plug>(nvim-surround-normal-line)",
      mode = "n",
      desc = "Line insert"
   },
   {
      "<leader>snlc",
      "<Plug>(nvim-surround-normal-cur-line)",
      mode = "n",
      desc = "Line insert in current line"
   },
   { "<leader>sv", desc = "Visual Mode" },
   {
      "<leader>svs",
      "<Plug>(nvim-surround-visual)",
      mode = "v",
      desc = "Spot insert"
   },
   {
      "<leader>svl",
      "<Plug>(nvim-surround-visual-line)",
      mode = "v",
      desc = "Line insert"
   },
   {
      "<leader>sd",
      "<Plug>(nvim-surround-delete)",
      desc = "Delete"
   },
   { "<leader>sc", desc = "Change" },
   {
      "<leader>scs",
      "<Plug>(nvim-surround-change)",
      desc = "Spot change"
   },
   {
      "<leader>scl",
      "<Plug>(nvim-surround-change-line)",
      desc = "Line change"
   },

})

-- SECTION: nvim-treesitter-textobjects

wk.add({

   { "<leader>to", desc = "Text objects" },

   -- Select
   { "<leader>tos", desc = "Select…"},

   -- Select > Assignment
   { "<leader>tosa", desc = "Select > Assignment…"},
   {
      "<leader>tosai",
      "<cmd>TSTextobjectSelect @assignment.inner<cr>",
      desc = "Select inner part of an assignment"
   },
   {
      "<leader>tosao",
      "<cmd>TSTextobjectSelect @assignment.nuter<cr>",
      desc = "Select outer part of an assignment"
   },
   {
      "<leader>tosal",
      "<cmd>TSTextobjectSelect @assignment.lhs<cr>",
      desc = "Select left hand side of an assignment"
   },
   {
      "<leader>tosar",
      "<cmd>TSTextobjectSelect @assignment.rhs<cr>",
      desc = "Select right hand side of an assignment"
   },

   -- Select > Class
   { "<leader>tosc", desc = "Select > Class…"},
   {
      desc = "Select inner part of a function call"
   },
   {
      "<leader>tosfo",
      "<cmd>TSTextobjectSelect @call.outer<cr>",
      desc = "Select outer part of a function call"
   },

   -- Select > Loop
   { "<leader>tosl", desc = "Select > Loop…" },
   {
      "<leader>tosli",
      "<cmd>TSTextobjectSelect @loop.inner<cr>",
      desc = "Select inner part of a loop"
   },
   {
      "<leader>toslo",
      "<cmd>TSTextobjectSelect @loop.outer<cr>",
      desc = "Select outer part of a loop"
   },

   -- Select > Method/function
   { "<leader>tosm", desc = "Select > Method/function…" },
   {
      "<leader>tosmi",
      "<cmd>TSTextobjectSelect @function.inner<cr>",
      desc = "Select inner part of a method/function definition"
   },
   {
      "<leader>tosmo",
      "<cmd>TSTextobjectSelect @function.outer<cr>",
      desc = "Select outer part of a method/function definition"
   },

   -- Select > Conditional
   { "<leader>toso", desc = "Select > Conditional…" },
   {
      "<leader>tosoi",
      "<cmd>TSTextobjectSelect @conditional.inner<cr>",
      desc = "Select inner part of a conditional"
   },
   {
      "<leader>tosoo",
      "<cmd>TSTextobjectSelect @conditional.outer<cr>",
      desc = "Select outer part of a conditional"
   },

   -- Select > Parameter/argument
   { "<leader>tosp", desc = "Select > Parameter/argument…" },
   {
      "<leader>tospi",
      "<cmd>TSTextobjectSelect @parameter.inner<cr>",
      desc = "Select inner part of a parameter/argument"
   },
   {
      "<leader>tospo",
      "<cmd>TSTextobjectSelect @parameter.outer<cr>",
      desc = "Select outer part of a parameter/argument"
   },

   -- Swap
   { "<leader>tow", desc = "Swap…" },
   {
      "<leader>town",
      "<cmd>TSTextobjectSwapNext<cr>",
      desc = "Swap next"
   },
   {
      "<leader>towp",
      "<cmd>TSTextobjectSwapPrevious<cr>",
      desc = "Swap previous"
   },

   -- Move
   { "<leader>tom", desc = "Move…"},

   -- Move > Class
   { "<leader>tomc", desc = "Move > Class…"},

   -- Move > Class > Next
   { "<leader>tomcn", desc = "Move > Class > Next" },
   {
      "<leader>tomcne",
      "<cmd>TSTextobjectGotoNextEnd class.outer<cr>",
      desc = "Next class end"
   },
   {
      "<leader>tomcns",
      "<cmd>TSTextobjectGotoNextStart class.outer<cr>",
      desc = "Next class start"
   },

   -- Move > Class > Previous
   { "<leader>tomcp", desc = "Move > Class > Previous" },
   {
      "<leader>tomcpe",
      "<cmd>TSTextobjectGotoPreviousEnd class.outer<cr>",
      desc = "Prev class end"
   },
   {
      "<leader>tomcps",
      "<cmd>TSTextobjectGotoPreviousStart class.outer<cr>",
      desc = "Prev class start"
   },

   -- Move > Function call
   { "<leader>tomf", desc = "Move > Function call…"},

   --  Move > Function call > Next
   { "<leader>tomfn", desc = "Move > Function call > Next" },
   {
      "<leader>tomfne",
      "<cmd>TSTextobjectGotoNextEnd call.outer<cr>",
      desc = "Next function call end"
   },
   {
      "<leader>tomfns",
      "<cmd>TSTextobjectGotoNextStart call.outer<cr>",
      desc = "Next function call start"
   },

   -- Move > Function call > Previous
   { "<leader>tomfp", desc = "Move > Function call > Previous" },
   {
      "<leader>tomfpe",
      "<cmd>TSTextobjectGotoPreviousEnd call.outer<cr>",
      desc = "Prev function call end"
   },
   {
      "<leader>tomfps",
      "<cmd>TSTextobjectGotoPreviousStart call.outer<cr>",
      desc = "Prev function call start"
   },

   -- Move > Method/function
   { "<leader>tomm", desc = "Move > Method/function…" },

   -- Move > Method/function > Next
   { "<leader>tommn", desc = "Move > Method/function > Next" },
   {
      "<leader>tommne",
      "<cmd>TSTextobjectGotoNextEnd function.outer<cr>",
      desc = "Next method/function def end"
   },
   {
      "<leader>tommns",
      "<cmd>TSTextobjectGotoNextStart function.outer<cr>",
      desc = "Next method/function definition start"
   },

   -- Move > Method/function > Previous
   { "<leader>tommp", desc = "Move > Method/function > Previous" },
   {
      "<leader>tommpe",
      "<cmd>TSTextobjectGotoPreviousEnd function.outer<cr>",
      desc = "Prev method/function def end"
   },
   {
      "<leader>tommps",
      "<cmd>TSTextobjectGotoPreviousStart function.outer<cr>",
      desc = "Prev method/function def start"
   },

   -- Move > Conditional
   { "<leader>tomo", desc = "Move > Conditional…" },

   -- Move > Conditional > Next
   { "<leader>tomon", desc = "Move > Conditional > Next" },
   {
      "<leader>tomone",
      "<cmd>TSTextobjectGotoNextEnd conditional.outer<cr>",
      desc = "Next conditional end"
   },
   {
      "<leader>tomons",
      "<cmd>TSTextobjectGotoNextStart conditional.outer<cr>",
      desc = "Next conditional start"
   },

   -- Move > Conditional > Previous
   { "<leader>tomop", desc = "Move > Conditional > Previous" },
   {
      "<leader>tomope",
      "<cmd>TSTextobjectGotoPreviousEnd conditional.outer<cr>",
      desc = "Prev conditional end"
   },
   {
      "<leader>tomops",
      "<cmd>TSTextobjectGotoPreviousStart conditional.outer<cr>",
      desc = "Prev conditional start"
   },

   -- Move > Loop
   { "<leader>toml", desc = "Move > Loop…" },

   -- Move > Loop > Next
   { "<leader>tomln", desc = "Move > Loop > Next" },
   {
      "<leader>tomlne",
      "<cmd>TSTextobjectGotoNextEnd loop.outer<cr>",
      desc = "Next loop end"
   },
   {
      "<leader>tomlns",
      "<cmd>TSTextobjectGotoNextStart loop.outer<cr>",
      desc = "Next loop start"
   },

   -- Move > Loop > Previous
   { "<leader>tomlp", desc = "Move > Loop > Previous" },
   {
      "<leader>tomlpe",
      "<cmd>TSTextobjectGotoPreviousEnd loop.outer<cr>",
      desc = "Prev loop end"
   },
   {
      "<leader>tomlps",
      "<cmd>TSTextobjectGotoPreviousStart loop.outer<cr>",
      desc = "Prev loop start"
   },

})

-- SECTION: nvim-treesitter

wk.add({

   { "<localleader>r", desc = "nvim-treesitter"},
   { "<localleader>rb", desc = "Treesitter Buffer" },
   {
      "<localleader>rbe",
      "<cmd>TSBufEnable<cr>",
      desc = "TSBufEnable"
   },
   {
      "<localleader>rbd",
      "<cmd>TSBufDisable<cr>",
      desc = "TSBufDisable"
   },
   {
      "<localleader>rbt",
      "<cmd>TSBufToggle<cr>",
      desc = "TSBufToggle"
   },
   {
      "<localleader>re",
      "<cmd>TSEnable<cr>",
      desc = "TSEnable"
   },
   {
      "<localleader>rd",
      "<cmd>TSDisable<cr>",
      desc = "TSDisable"
   },
   {
      "<localleader>rt",
      "<cmd>TSToggle<cr>",
      desc = "TSToggle"
   },
   {
      "<localleader>rc",
      "<cmd>TSConfigInfo<cr>",
      desc = "TSConfigInfo"
   },
   {
      "<localleader>rq",
      "<cmd>TSEditQuery<cr>",
      desc = "TSEditQuery"
   },
   {
      "<localleader>ru",
      "<cmd>TSEditQueryUserAfter<cr>",
      desc = "TSEditQueryUserAfter"
   }

})

-- SECTION: octo.nvim

wk.add({

   -- The actual keymaps are in the octo.nvim spec file.
   { "<localleader>o", desc = "octo.nvim" },
   { "<localleader>oa", desc = "Assignees" },
   { "<localleader>oc", desc = "Comments" },
   { "<localleader>oe", desc = "Entries" },
   { "<localleader>of", desc = "Files" },
   { "<leaderlocal>oi", desc = "Issues"},
   { "<localleader>ol", desc = "Labels" },
   { "<localleader>op", desc = "Pull requests" },
   { "<localleader>opl", desc = "List…" },
   { "<localleader>or", desc = "Reviews/Reactions"},
   { "<localleader>orr", desc = "Reactions" },
   { "<localleader>orv", desc = "Reviews" },
   { "<localleader>ot", desc = "Threads" }

})

-- SECTION: telescope.nvim

wk.add({

   {
      "<leader>ff",
      "<cmd>Telescope find_files<CR>",
      mode = "n",
      desc = "Find files"
   },
   {
      "<leader>fg",
      "<cmd>Telescope live_grep<CR>",
      mode = "n",
      desc = "Live grep"
   },
   {
      "<leader>fh",
      "<cmd>Telescope help_tags<CR>",
      mode = "n",
      desc = "Help tags"
   },
   {
      "<leader>fo",
      "<cmd>Telescope oldfiles<CR>",
      mode = "n",
      desc = "Old files"
   },
   {
      "<leader>bt",
      "<cmd>Telescope buffers<CR>",
      mode = "n",
      desc = "List buffers (Telescope)"
   },
   {
      "<leader>fz",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      mode = "n",
      desc = "fzf in current buffer"
   },
   {
      "<leader>fg",
      "<cmd>Telescope tags<CR>",
      mode = "n",
      desc = "List global ctags"
   },
   {
      "<leader>fc",
      "<cmd>Telescope current_buffer_tags<CR>",
      mode = "n",
      desc = "This buffer's ctags"
   },
   {
      "<leader>fb",
      "<cmd>Telescope file_browser<CR>",
      mode = "n",
      desc = "Browser"
   },
   {
      "<leader>bb",
      expand = function()
         return require("which-key.extras").expand.buf()
      end,
      desc = "Show Buffers"
   },
   {
      "<localleader>r",
      "<cmd>Telescope resume<cr>",
      desc = "Resume last telescope session"
   },
   {
      "<localleader>p",
      "<cmd>Telescope lazy<cr>",
      desc = "Work with lazy plugins"
   }

})

-- SECTION: todo-comments.nvim

wk.add({

   {
      "<leader>ct",
      group = "Todo-Comments"
   },
   {
      "<leader>ctn",
      function()
         require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment"
   },
   {
      "<leader>ctp",
      function()
         require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment"
   },
   {
      "<leader>ctr",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Todo (Trouble)"
   },
   {
      "<leader>cta",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX}}<cr>",
      desc = "Todo/Fix/Fixme (Trouble)"
   },
   {
      "<leader>ctt",
      "<cmd>TodoTelescope<cr>",
      desc = "Todo"
   },
   {
      "<leader>ctb",
      "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
      desc = "Todo/Fix/Fixme"
   }

})

-- SECTION: trouble.nvim

wk.add({

   { "<localleader>t", desc = "trouble.nvim" },
   {
      "<localleader>td",
      "<cmd>Trouble diagnostics toggle<cr>",
      mode = "n",
      desc = "Diagnostics (Trouble)"
   },
   {
      "<localleader>tb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      mode = "n",
      desc = "Buffer Diagnostics (Trouble)"
   },
   {
      "<localleader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      mode = "n",
      desc = "Symbols (Trouble)"
   },
   { "<localleader>tl", desc = "lsp toggle/loclist toggle" },
   {
      "<localleader>tls",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      mode = "n",
      desc = "LSP Defs / refs / … (Trouble)"
   },
   {
      "<localleader>tll",
      "<cmd>Trouble loclist toggle<cr>",
      mode = "n",
      desc = "Location List (Trouble)"
   },
   {
      "<localleader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      mode = "n",
      desc = "Quickfix List (Trouble)"
   },

})

-- SECTION: which-key.nvim

-- NOTE: Why use <leader>? when , works? To leave , available for ??

-- wk.add({
--    {
--      "<leader>?",
--      function()
--         require("which-key").show({ global = false })
--      end,
--      desc = "Buffer Local Keymaps (which-key)",
--   }
-- })

-- SECTION: yanky.nvim

-- TODO: config.modules.yanky
-- There are eleven yanky put keymap commands set. There are a total of
-- eighty-four commands available. Determine if there is a need for any of the
-- others, or if any of the currently set maps are unnecessary.

wk.add({

   {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank text"
   },
   {
      "p",
      "<Plug>(YankyPutAfter)",

      mode = { "n", "x" },
      desc = "Put yanked text after cursor"
   },
   {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before cursor"
   },
   {
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after selection"
   },
   {
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before selection"
   },
   { "<leader>y", desc = "Yank" },
   {
      "<leader>yp",
      "<Plug>(YankyPreviousEntry)",
      desc = "Select previous entry through yank history"
   },
   {
      "<leader>yn",
      "<Plug>(YankyNextEntry)",
      desc = "Select next entry through yank history"
   },
   {
      "<leader>yh",
      function()
         require("telescope").extensions.yank_history.yank_history({ })
      end,
      mode = "n",
      desc = "Open Yank History"
   },
   { "<leader>p", desc = "Put" },
   { "<leader>pa", desc = "Put after and indent" },
   {
      "<leader>par",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      desc = "Put and indent right"
   },
   {
      "<leader>pal",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      desc = "Put and indent left"
   },
   {
      "<leader>paf",
      "<Plug>(YankyPutAfterFilter)",
      desc = "Put after applying a filter"
   },
   { "<leader>pb", desc = "Put before and indent" },
   {
      "<leader>pbr",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      desc = "Put before and indent right"
   },
   {
      "<leader>pbl",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      desc = "Put before and indent left"
   },
   {
      "<leader>pbf",
      "<Plug>(YankyPutBeforeFilter)",
      desc = "Put before applying a filter"
   },
   { "<leader>pi", desc = "Put indented" },
   {
      "<leader>pia",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)"
   },
   {
      "<leader>pib",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)"
   }

})

