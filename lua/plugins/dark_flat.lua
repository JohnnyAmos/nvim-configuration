-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/dark_flat.lua            ║ --
-- ║  Source: https://github.com/uncleTen276/dark_flat.nvim                ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] UI: Colourscheme                       Last modified: 2025-05-04 10:53

local M = {
   "sekke276/dark_flat.nvim",
   priority = 1000,
}

function M.config()
   local ok, dark_flat = pcall(require, "dark_flat")
   if not ok then
      print("Error: " .. dark_flat)
   end

   dark_flat.setup({
      colors = {
         fg = "#ddeedd",
         bg = "#060606",
         gray = "#aaaaaa",
         pink = "#d60075",
         green = "#00bb28",
         light_green = "#14df4c",
         cyan = "#00d2cb",
         aqua = "#4a63f7",
         purple = "#a733c9",
         peanut = "#e6a868",
         orange = "#ff4704",
         dark_pink = "#c70053",
         dark_cyan = "#2b8db3",
         red = "#c00102",
         dark_red = "#a60404",
         light_gray = "#bababa",
         dark_gray = "#777777",
         dark_green = "#00570e",
         dark_blue = "#00156d",
      },
      italics = false,
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
