--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/telescope.lua
--    Plugin source: https://github.com/nvim-telescope/telescope.nvim
--    Last modified: 2024-09-29 11:48
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

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

   })

end

return M

