---------------------------------------------------------------------
--                  nvim keymap configuration file                  --
--                  Last Modified: 2024-09-06 21:38
----------------------------------------------------------------------

function Map(mode, lhs, rhs, opts)
   local options   =   { noremap = true, silent = true }
   if opts then
      options   =   vim.tbl_extend("force", options, opts)
   end
   vim.keymap.set(mode, lhs, rhs, options)
end

--[[ LITTLE HELPERS ]]--

-- male Y act like C of D
Map('n', 'Y', 'y$')


Map("n", ";", ":")

-- close all but current window (in a single tab, aka close all other splits)
Map('n', '<space>o', ':only<cr>')

-- exit insert mode quickly
Map("i", "jk", "<ESC>")

-- Run :helpc with fewer keystrokes.
Map('n', 'hc', ':helpc<CR>')

-- Insert empty line in normal mode.
--   For lines below cursor:
--     <leader><down> = one line
--     \n<leader><down> = n lines
--   For lines above cursor:
--     <leader><up> = one line
--     \n<leader><up> = n lines
Map(
   'n',
   '<leader><down>',
   ':<C-u>call append(line("."), repeat([""], v:count1))<CR>',
   { desc = 'Add lines below cursor.' }
)
Map(
   'n',
   '<leader><up>',
   ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>',
   { desc = 'Add lines above cursor.' }
)

-- Move line up or down.
Map('n', '<S-Up>', 'yyddkP')
Map('n', '<S-Down>', 'yyddp')

-- Use U for :redo.
Map('n', 'U', '<C-r>')

-- Clear highlights on search when pressing <Esc> in normal mode
Map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
--  { desc   =   'Open diagnostic [Q]uickfix list' }
--)

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own
-- mapping or just use <C-\><C-n> to exit terminal mode

-- Map("t", "<Esc><Esc>", "<C-\\><C-n>",
--    { desc   =   "Exit terminal mode" }
-- )

-- Switch buffers quickly.
Map("n", "<leader>bb", ":buffers<cr>:b<space>")
Map("n", "bn", ":bnext<CR>")
Map("n", "bp", ":bprevious<CR>")

-- Disable arrow keys in normal mode.
Map('n', '<Up>', '<Nop>')
Map('n', '<Down>', '<Nop>')
Map('n', '<Left>', '<Nop>')
Map('n', '<Right>', '<Nop>')

-- Use CTRL+<hjkl> to switch between windows.
Map("n", "<C-h>", "<C-w><C-h>")
Map("n", "<C-l>", "<C-w><C-l>")
Map("n", "<C-j>", "<C-w><C-j>")
Map("n", "<C-k>", "<C-w><C-k>")

-- Easy window resizing.
Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

--[[ PLUGIN: TROUBLE.NVIM ]]--
--[[ FIX: 'c', 'x', or what? with <leader> or no?
Map{
   "<leader>xx",
   "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
}
Map{
   "<leader>xX",
   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
   desc = "Buffer Diagnostics (Trouble)",
}
Map{
   "<leader>cs",
   "<cmd>Trouble symbols toggle focus=false<cr>",
   desc = "Symbols (Trouble)",
}
Map{
   "<leader>cl",
   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
   desc = "LSP Defs / refs / … (Trouble)",
}
Map{
   "<leader>xL",
   "<cmd>Trouble loclist toggle<cr>",
   desc = "Location List (Trouble)",
}
Map{
   "<leader>xQ",
   "<cmd>Trouble qflist toggle<cr>",
   desc = "Quickfix List (Trouble)",
}
]]

--[[ PLUGIN: NVIM-COMMENT-FRAME ]]--
Map(
   'n',
   '<leader>cc',
   ":lua require('nvim-comment-frame').add_comment()<CR>",
   { desc = 'Single-line comment' }
)
Map(
   'n',
   '<leader>C',
   ":lua require('nvim-comment-frame').add_multiline_comment()<CR>",
   { desc = 'Multi-line comment' }
)

-- PLUGIN: Telescope
Map(
   'n',
   '<leader>ff',
   "<cmd>Telescope find_files<CR>",
   { desc = 'Find files' }
)
Map(
   'n',
   '<leader>fg',
   "<cmd>Telescope live_grep<CR>",
   { desc = 'Live grep' }
)
Map(
   'n',
   '<leader>fh',
   "<cmd>Telescope help_tags<CR>",
   { desc = 'Help tags' }
)
Map(
   'n',
   '<leader>fo',
   "<cmd>Telescope oldfiles<CR>",
   { desc = 'Old files' }
)
Map(
   'n',
   '<leader>fbu',
   "<cmd>Telescope buffers<CR>",
   { desc = 'List buffers' }
)
Map(
   'n',
   '<leader>ffc',
   "<cmd>Telescope current_buffer_fuzzy_find<CR>",
   { desc = 'fzf in current buffer' }
)
Map(
   'n',
   '<leader>ft',
   "<cmd>Telescope tags<CR>",
   { desc = 'List ctags' }
)
Map(
   'n',
   '<leader>ftb',
   "<cmd>Telescope current_buffer_tags<CR>",
   { desc = "This buffer's ctags" }
)
Map(
   "n",
   "<leader>fbr",
   ":Telescope file_browser<CR>",
   { desc = 'Browser' }
)

--[[ PLUGIN: YANKY.NVIM ]]--
--[[ FIX: <leader>, <localleader>. or neither. probably neither
Map{
   "<leader>p", function()
      require("telescope").extensions.yank_history.yank_history({ })
   end,
   desc = "Open Yank History"
}
Map{
   "y",
   "<Plug>(YankyYank)",
   mode = { "n", "x" },
   desc = "Yank text"
}
Map{
   "p",
   "<Plug>(YankyPutAfter)",
   mode = { "n", "x" },
   desc = "Put yanked text after cursor"
}
Map{
   "P",
   "<Plug>(YankyPutBefore)",
   mode = { "n", "x" },
   desc = "Put yanked text before cursor"
}
Map{
   "gp",
   "<Plug>(YankyGPutAfter)",
   mode = { "n", "x" },
   desc = "Put yanked text after selection"
}
Map{
   "gP",
   "<Plug>(YankyGPutBefore)",
   mode = { "n", "x" },
   desc = "Put yanked text before selection"
}
Map{
   "<c-p>",
   "<Plug>(YankyPreviousEntry)",
   desc = "Select previous entry through yank history"
}
Map{
   "<c-n>",
   "<Plug>(YankyNextEntry)",
   desc = "Select next entry through yank history"
}
Map{
   "]p",
   "<Plug>(YankyPutIndentAfterLinewise)",
   desc = "Put indented after cursor (linewise)"
}
Map{
   "[p",
   "<Plug>(YankyPutIndentBeforeLinewise)",
   desc = "Put indented before cursor (linewise)"
}
Map{
   "]P",
   "<Plug>(YankyPutIndentAfterLinewise)",
   desc = "Put indented after cursor (linewise)"
}
Map{
   "[P",
   "<Plug>(YankyPutIndentBeforeLinewise)",
   desc = "Put indented before cursor (linewise)"
}
Map{
   ">p",
   "<Plug>(YankyPutIndentAfterShiftRight)",
   desc = "Put and indent right"
}
Map{
   "<p",
   "<Plug>(YankyPutIndentAfterShiftLeft)",
   desc = "Put and indent left"
}
Map{
   ">P",
   "<Plug>(YankyPutIndentBeforeShiftRight)",
   desc = "Put before and indent right"
}
Map{
   "<P",
   "<Plug>(YankyPutIndentBeforeShiftLeft)",
   desc = "Put before and indent left"
}
Map{
   "=p",
   "<Plug>(YankyPutAfterFilter)",
   desc = "Put after applying a filter"
}
Map{
   "=P",
   "<Plug>(YankyPutBeforeFilter)",
   desc = "Put before applying a filter"
}
]]

-- vim: set sts=3 sw=3 ts=3 tw=79:

