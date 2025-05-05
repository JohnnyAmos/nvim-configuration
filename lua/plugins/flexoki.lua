-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/flexoki.lua              ║ --
-- ║  Source: https://github.com/nuvic/flexoki-nvim                        ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] UI: Colorscheme                        Last modified: 2025-05-04 21:29

Local M = {
   "nuvic/flexoki-nvim",
   name = "flexoki",
}

function M.config()
   local ok, flexoki = pcall(require, "flexoki")
   if not ok then
      print("Error: " .. flexoki)
   end

   flexoki.setup({
      variant = "auto", -- auto, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
         terminal = true,
      },

      styles = {
         bold = true,
         italic = false,
      },

      -- may experiment with this later
      -- groups = {
      --    border = "muted",
      --    link = "purple_two",
      --    panel = "surface",
      --
      --    error = "red_one",
      --    hint = "purple_one",
      --    info = "cyan_one",
      --    ok = "green_one",
      --    warn = "orange_one",
      --    note = "blue_one",
      --    todo = "magenta_one",
      --
      --    git_add = "green_one",
      --    git_change = "yellow_one",
      --    git_delete = "red_one",
      --    git_dirty = "yellow_one",
      --    git_ignore = "muted",
      --    git_merge = "purple_one",
      --    git_rename = "blue_one",
      --    git_stage = "purple_one",
      --    git_text = "magenta_one",
      --    git_untracked = "subtle",
      --
      --    h1 = "purple_two",
      --    h2 = "cyan_two",
      --    h3 = "magenta_two",
      --    h4 = "orange_two",
      --    h5 = "blue_two",
      --    h6 = "cyan_two",
      -- },

      palette = {
         moon = {
            base = "#000000",
            overlay = "#111111",
            muted = "#afafaf",
         },
         dawn = {
            base = "#ffffff",
            overlay = "#f2f0e5",
         },
      },

      highlight_groups = {
         Comment = { fg = "muted" },
         --    VertSplit = { fg = "muted", bg = "muted" },
      },

      -- before_highlight = function(group, highlight, palette)
      --    -- Disable all undercurls
      --    if highlight.undercurl then
      --        highlight.undercurl = false
      --    end
      --
      --    -- Change palette colour
      --    if highlight.fg == palette.blue_two then
      --        highlight.fg = palette.cyan_two
      --    end
      -- end,
      -- vim.cmd("colorscheme flexoki-moon")
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
