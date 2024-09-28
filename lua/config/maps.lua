--JMJ----------------------------------✝︎---------------------------------AMDG--
--                      nvim keymap configuration file                       --
--                      Last Modified: 2024-09-27 20:59
-------------------------------------------------------------------------------

local wk = require("which-key")

--[[  SECTION: command/subject group assignments ]]--
-- plugin-specific groups are assigned in their individual sections

wk.add({
   { "<leader>b", group = "Buffers" },
   { "<leader>c", group = "Comments" },
   { "<leader>f", group = "Files" },
   { "<leader>t", group = "Text" },
})


--[[ SECTION: little helpers ]]--

wk.add({
   -- close all but current window (in a single tab)
   {
      "<leader>o",
      "<cmd>only<cr>",
      mode = "n",
      desc = "Close all but this window"
   },
   { "hc", "<cmd>helpc<cr>" },
   { "tc", "<cmd>tabc<cr>" },

   -- Insert empty line in normal mode.
   --    For lines below cursor:
   --       <leader><down> = one line
   --       \n<leader><down> = n lines
   --    For lines above cursor:
   --       <leader><up> = one line
   --       \n<leader><up> = n lines
   {
      "<leader><down>",
      "<cmd>call append(line('.'),     repeat([''], v:count1))<cr>",
      desc = "Add lines below cursor."
   },
   {
      "<leader><up>",
      "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>",
      desc = "Add lines above cursor."
   },
   -- Move line up or down.
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
      "<leader>d",
      "vim.diagnostic.setloclist",
      desc = "Open diagnostic quickfix list"
   },
   -- exit terminal mode (doesn"t work in all situations)
   { "<esc><esc>", "<c-\\><c-n>", mode = "t", desc = "Exit terminal mode" },
   -- Switch buffers quickly.
   -- List buffers is handled by 
   -- {
   --    "<leader>bb",
   --    "<cmd>buffers<cr>:b<space>",
   --    mode = "n",
   --    desc = "List Buffers"
   -- },
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
      "<leader>bc",
      "<cmd>bdelete<cr>",
      desc = "Close buffer"
   },
   -- Disable arrow keys in normal mode.
   { "<up>", "<nop>", desc = "Inactive, use k" },
   { "<down>", "<nop>", desc = "Inactive, use j" },
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
}) -- end little helpers group


--[[ PLUGIN: edgy.nvim ]]--
wk.add({

   required("config.maps.maps-edgy")

}) -- end edgy.nvim


--[[ PLUGIN: mini.surround (mini.nvim) ]]--
wk.add({

   require("config.maps.maps-mini")

}) -- end mini.surround


--[[  PLUGIN: nvim-comment-frame ]]--

wk.add({

   require("config.maps.maps-nvim-comment-frame")

}) -- end nvim-comment-frame

--[[ PLUGIN: nvim-treesitter-textobjects ]]--

wk.add({

   require("config.maps.maps-nvim-treesitter-textobjects")

}) -- end mvin-treesetter-testobjects

--[[ PLUGIN: nvim-treesitter-textsubjects ]]--

wk.add({
--    { "<leader>ts", desc = "Text subjects" },
}) -- end nvim-treesitter-textsubjects


--[[ PLUGIN: telescope.nvim ]]--

wk.add({

   require("config.maps.maps-telescope")

}) -- end telescope.nvim


--[[ PLUGIN: todo-comments.nvim ]]--

wk.add({

   require("config.maps.maps-todo-comments")

}) -- end todo-comments.nvim


--[[ PLUGIN: trouble.nvim ]]--

wk.add({

   require("config.maps.maps-trouble")

}) -- end trouble.nvim


--[[ PLUGIN: YANKY.NVIM ]]--

wk.add({

   require("config.maps.maps-yanky")

}) -- end yanky.nvim

