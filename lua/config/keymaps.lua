---------------------------------------------------------------------
--                  nvim keymap configuration file                  --
--                  Last Modified: 2024-08-30 16:40
----------------------------------------------------------------------
function Map(mode, lhs, rhs, opts)
    local options   =   { noremap = true, silent = true }
    if opts then
        options   =   vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", ";", ":")

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
--   { desc   =   "Exit terminal mode" }
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

-- PLUGIN: Telescope
-- local builtin   =   require('telescope.builtin')
-- Map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
-- Map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
-- Map('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
-- Map('n', '<leader>fo', builtin.oldfiles, { desc = 'Old files' })
-- Map('n', '<leader>fbu', builtin.buffers, { desc = 'List buffers' })
-- Map('n', '<leader>ffc', builtin.current_buffer_fuzzy_find, {
--   desc = 'fzf in current buffer'
-- })
-- Map('n', '<leader>ft', builtin.tags, { desc = 'List ctags' })
-- Map('n', '<leader>ftb', builtin.current_buffer_tags, {
--   desc = "This buffer's ctags"
-- })
-- Map("n", "<leader>fbr", ":Telescope file_browser<CR>", { desc = 'Browser' })

-- PLUGIN: Yanky TODO: audit
-- Map({"n","x"}, "p", "<Plug>(YankyPutAfter)")
-- Map({"n","x"}, "P", "<Plug>(YankyPutBefore)")
-- Map({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
-- Map({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
-- Map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- Map("n", "<c-n>", "<Plug>(YankyNextEntry)")
-- Map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
-- Map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
-- Map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
-- Map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
-- Map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
-- Map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
-- Map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
-- Map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
-- Map("n", "  =  p", "<Plug>(YankyPutAfterFilter)")
-- Map("n", "  =  P", "<Plug>(YankyPutBeforeFilter)")
-- Map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- Map("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- TODO: delete modline when nvim is set up
-- vim: set ts=2 sts=2 sw=2: --

