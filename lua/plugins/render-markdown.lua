-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/render-markdown.lua      ║ --
-- ║  Source: https://github.com/MeanderingProgrammer/render-markdown.nvim ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [*  ] Editor: Languages                      Last modified: 2025-06-05 16:22

local M = {
   "MeanderingProgrammer/render-markdown.nvim",
   dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
   },
   ---@module 'render-markdown'
   ---@type render.md.UserConfig
}

function M.config()
   local ok, markdown = pcall(require, "render-markdown")
   if not ok then
      print("Error: " .. markdown)
   end

   -- local ok, cmp = pcall(require, "cmp")
   -- if not ok then
   --    print("Error: " .. cmp)
   -- end

   -- cmp.setup({
   --    sources = cmp.config.sources({
   --       { name = "render-markdown" },
   --    }),
   -- })

   markdown.setup({
      completions = { lsp = { enabled = true } },
      code = { style = "language" },
      heading = { position = "inline" },
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
