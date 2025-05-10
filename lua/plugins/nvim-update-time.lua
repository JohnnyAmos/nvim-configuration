-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/nvim-update-time.lua     ║ --
-- ║  Source: https://github.com/StonyBoy/nvim-update-time                 ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] Utilities: Timestamp                   Last modified: 2025-05-10 11:02

local M = {
   "StonyBoy/nvim-update-time",
}

function M.config()
   local ok, nvim_update_time = pcall(require, "nvim-update-time")
   if not ok then
      print("Error: " .. nvim_update_time)
   end

   nvim_update_time.setup({
      last = 15,
      format = "%Y-%m-%d %H:%M",
      pattern = "Last modified: ",
   })
end

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
