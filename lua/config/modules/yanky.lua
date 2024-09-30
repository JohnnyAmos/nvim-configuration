--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/plugins/yanky.lua
--    Plugin source: https://github.com/gbprod/yanky.nvim
--    Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

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
      },
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

   })

end

return M

