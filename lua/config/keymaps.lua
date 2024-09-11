--JMJ--------------------------------------------------------------------AMDG--
--                      nvim keymap configuration file                       --
--                      Last Modified: 2024-09-10 19:26
-------------------------------------------------------------------------------

local wk = require('which-key')

--[[ SECTION: little helpers group ]]--

wk.add({
   -- make Y act like C or D
   { 'Y', 'y$', mode = 'n' },
   -- use ; for :
   { ';', ':', mode = 'n' },
   -- close all but current window (in a single tab)
   { '<leader>o', ':only<cr>', mode = 'n' },
   -- exit insert mode quickly
   { 'jk', '<esc>', mode = 'i' },
   { 'kj', '<esc>', mode = 'i' },
   -- Run :helpc & :tabc with fewer keystrokes.
   { 'hc', ':helpc<cr>', mode = 'n' },
   { 'tc', ':tabc<cr>', mode = 'n' },
   -- Insert empty line in normal mode.
   --    For lines below cursor:
   --       <leader><down> = one line
   --       \n<leader><down> = n lines
   --    For lines above cursor:
   --       <leader><up> = one line
   --       \n<leader><up> = n lines
   {
      '<leader><down>',
      ':<c-u>call append(line("."), repeat([""], v:count1))<cr>',
      mode = 'n',
      desc = 'Add lines below cursor.'
   },
   {
      '<leader><up>',
      ':<c-u>call append(line(".")-1, repeat([""], v:count1))<cr>',
      mode = 'n',
      desc = 'Add lines above cursor.'
   },
   -- Move line up or down.
   { '<s-up>', 'yyddkP', mode = 'n' },
   { '<s-down>', 'yyddp', mode = 'n' },
   -- Use U for :redo.
   { 'U', '<c-r>', mode = 'n' },
   -- Clear highlights on search when pressing <esc> in normal mode
   { '<esc>', '<cmd>nohlsearch<cr>', mode = 'n' },
   -- Diagnostic keymaps
   {
      '<leader>q',
      'vim.diagnostic.setloclist',
      mode = 'n',
      desc = 'Open diagnostic quickfix list'
   },
   -- exit terminal mode (doesn't work in all situations)
   { '<esc><esc>', '<c-\\><c-n>', mode = 't', desc = 'Exit terminal mode' },
   -- Switch buffers quickly.
   {
      '<leader>bb',
      ':buffers<cr>:b<space>',
      mode = 'n',
      desc = 'List Buffers'
   },
   {
      '<leader>bn',
      ':bnext<cr>',
      mode = 'n',
      desc = 'Next buffer'
   },
   {
      '<leader>bp',
      ':bprevious<cr>',
      mode = 'n',
      desc = 'Previous buffer'
   },
   {
      '<leader>bd',
      ':bdelete<cr>',
      mode = 'n',
      desc = 'Close buffer'
   },
   -- Disable arrow keys in normal mode.
   { '<up>', '<nop>', mode = 'n' },
   { '<down>', '<nop>', mode = 'n' },
   { '<left', '<nop>', mode = 'n' },
   { '<right>', '<nop>', mode = 'n' },
   -- Use CTRL+<hjkl> to switch between windows.
   { '<c-h>', '<c-w><c-h>', mode = 'n' },
   { '<c-l>', '<c-w><c-l>', mode = 'n' },
   { '<c-j>', '<c-w><c-j>', mode = 'n' },
   { '<c-k>', '<c-w><c-k>', mode = 'n' },
   -- Easy window resizing.
   { '<c-up>', ':res -2<cr>', mode = 'n' },
   { '<c-down>', ':res +2<cr>', mode = 'n' },
   { '<c-left>', ':vert res -2<cr>', mode = 'n' },
   { '<c-right>', ':vert res +_2<cr>', mode = 'n' },
}) -- end little helpers group

--[[  PLUGIN: nvim-comment-frame ]]--

wk.add({
   { '<leader>cs', ":lua require('nvim-comment-frame').add_comment()<cr>", mode = 'n', desc = 'Add single-line comment frame' },
   { '<leader>cm', ":lua require('nvim-comment-frame').add_multiline_comment()<cr>", mode = 'n', desc = 'Add multiple-line comment frame' },
}) -- end nvim-comment-frame

--[[ PLUGIN: trouble.nvim ]]--

wk.add({
   {
      '<leader>tr',
      group = 'Trouble'
   },
   {
      '<leader>trd',
      '<cmd>Trouble diagnostics toggle<cr>',
      mode = 'n',
      desc = 'Diagnostics (Trouble)'
   },
   {
      '<leader>trb',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      mode = 'n',
      desc = 'Buffer Diagnostics (Trouble)'
   },
   {
      '<leader>trs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      mode = 'n',
      desc = 'Symbols (Trouble)'
   },
   {
      '<leader>trls',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      mode = 'n',
      desc = 'LSP Defs / refs / … (Trouble)'
   },
   {
      '<leader>trll',
      '<cmd>Trouble loclist toggle<cr>',
      mode = 'n',
      desc = 'Location List (Trouble)'
   },
   {
      '<leader>trq',
      '<cmd>Trouble qflist toggle<cr>',
      mode = 'n',
      desc = 'Quickfix List (Trouble)'
   },
}) -- end trouble.nvim

--[[ PLUGIN: Telescope.nvim ]]--

wk.add({
   { '<leader>f', group = 'Files' },
   {
      '<leader>ff',
      "<cmd>Telescope find_files<CR>",
      mode = 'n',
      desc = 'Find files'
   },
   {
      '<leader>fg',
      "<cmd>Telescope live_grep<CR>",
      mode = 'n',
      desc = 'Live grep'
   },
   {
      '<leader>fh',
      "<cmd>Telescope help_tags<CR>",
      mode = 'n',
      desc = 'Help tags'
   },
   {
      '<leader>fo',
      "<cmd>Telescope oldfiles<CR>",
      mode = 'n',
      desc = 'Old files'
   },
   {
      '<leader>fbu',
      "<cmd>Telescope buffers<CR>",
      mode = 'n',
      desc = 'List buffers'
   },
   {
      '<leader>ffc',
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      mode = 'n',
      desc = 'fzf in current buffer'
   },
   {
      '<leader>ft',
      "<cmd>Telescope tags<CR>",
      mode = 'n',
      desc = 'List ctags'
   },
   {
      '<leader>ftb',
      "<cmd>Telescope current_buffer_tags<CR>",
      mode = 'n',
      desc = "This buffer's ctags"
   },
   {
      "<leader>fbr",
      ":Telescope file_browser<CR>",
      mode = "n",
      desc = 'Browser'
   },
   {
      "<leader>fbl",
      group = "buffers",
      expand = function()
         return require("which-key.extras").expand.buf()
      end
   },
}) -- end telescope.nvim


--[[ PLUGIN: YANKY.NVIM ]]--
--[[ FIX: <leader>, <localleader>. or neither. probably neither ]]--

wk.add({
   {
      "<leader>p",
      function()
         require("telescope").extensions.yank_history.yank_history({ })
      end,
      mode = 'n',
      desc = "Open Yank History"
   },
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
   {
      "<c-p>",
      "<Plug>(YankyPreviousEntry)",
      desc = "Select previous entry through yank history"
   },
   {
      "<c-n>",
      "<Plug>(YankyNextEntry)",
      desc = "Select next entry through yank history"
   },
   {
      "]p",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)"
   },
   {
      "[p",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)"
   },
   {
      "]P",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)"
   },
   {
      "[P",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)"
   },
   {
      ">p",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      desc = "Put and indent right"
   },
   {
      "<p",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      desc = "Put and indent left"
   },
   {
      ">P",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      desc = "Put before and indent right"
   },
   {
      "<P",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      desc = "Put before and indent left"
   },
   {
      "=p",
      "<Plug>(YankyPutAfterFilter)",
      desc = "Put after applying a filter"
   },
   {
      "=P",
      "<Plug>(YankyPutBeforeFilter)",
      desc = "Put before applying a filter"
   },
}) -- end yanky.nvim

