-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Config file: $HOME/.config/nvim/lua/config/options.lua               ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-04-21 16:12

local api = vim.api
local aucmd = api.nvim_create_autocmd
local augrp = api.nvim_create_augroup
local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local lsp = vim.lsp

-- Automatically run code formatters using conform.nvim.
vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = "*",
   callback = function(args)
      require("conform").format({ bufnr = args.buf })
   end,
})

-- Save/load folds with mkview & loadview.
augrp("Folds", { clear = true })
aucmd({ "BufWritePre" }, {
   group = "Folds",
   desc = "Save folds",
   pattern = "*",
   callback = function()
      cmd("mkview 1")
   end,
})
aucmd({ "BufEnter", "BufWinEnter" }, {
   group = "Folds",
   desc = "Restore folds",
   pattern = "*",
   callback = function()
      cmd("silent! loadview 1")
   end,
})

augrp("Help", { clear = true })
aucmd("FileType", {
   pattern = { "help", "man" },
   group = "Help",
   command = "nnoremap <buffer> q <cmd>quit<cr>",
})

-- Set cwd to the buffer directory. This means that the filename that is
-- displayed in the statusline doesn't include any of the path.
-- I wonder how long it will take before this becomes a problem.
augrp("WorkingDirectory", { clear = true })
aucmd({ "BufEnter" }, {
   group = "WorkingDirectory",
   pattern = { "*.*" },
   callback = function()
      local path = fn.expand("%:h") .. "/"
      path = "cd " .. path
      api.nvim_command(path)
   end,
})

-- Reload files changed outside of nvim not currently modified in nvim.
augrp("General autoread", {})
aucmd({ "FocusGained", "BufEnter", "WinEnter" }, {
   group = "General autoread",
   callback = function()
      if api.nvim_get_option_value("buftype", {}) ~= "" then
         return
      end
      api.nvim_command("silent! checktime")
   end,
   desc = "perform a read when entering a new buffer",
})

-- Don't auto-comment new lines. This may cause problems. Is the convenience
-- worth the potential hassle.
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- Highlight text on yank.
augrp("highlight_yank", {})
aucmd({ "TextYankPost" }, {
   group = "highlight_yank",
   pattern = "*",
   callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
   end,
   desc = "Hightlight selection on yank",
})

-- Make nvim stop loading files in insert mode.
aucmd("WinLeave", {
   callback = function()
      if bo.ft == "TelescopePrompt" and fn.mode() == "i" then
         api.nvim_feedkeys(
            api.nvim_replace_termcodes("<Esc>", true, false, true),
            "i",
            false
         )
      end
   end,
})

---@param on_attach fun(client, buffer)
function on_attach(on_attach)
   api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
         local buffer = args.buf
         local client = lsp.get_client_by_id(args.data.client_id)
         on_attach(client, buffer)
      end,
   })
end

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
