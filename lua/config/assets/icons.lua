-- ╔═JMJ══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞═══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Asset module: $HOME/.config/nvim/lua/config/assets/icons.lua         ║ --
-- ║  Borrowed with modifications from xero harrison's dotfiles:           ║ --
-- ║  Source: https://github.com/xero/dotfiles/                            ║ --
-- ║  Source license: CC0-1.0                                              ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-10-23 23:26



local M = {}

-- ╞═╡  FUNCTION: M.gitsigns_signs() (for gitsigns.nvim) ╞═════════════════╡ --

---@return table
function M.gitsigns_signs()
   return {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' }
   }
end

-- ╞═╡  FUNCTION: M.gitsigns_signs_staged() (for gitsigns.nvim) ╞══════════╡ --

---@return table
function M.gitsigns_signs_staged()
   return {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' }
   }
end

-- ╞═╡  FUNCTION: M.lualine_fileformat_symbols() (for lualine.nvim) ╞══════╡ --

---@return table
function M.lualine_fileformat_symbols()
   return {
      unix = ' ',
      dos = ' ',
      mac = ' '
   }
end

-- ╞═╡  FUNCTION: M.mason_ui_icons() (for mason.nvim) ╞════════════════════╡ --

---@return table
function M.mason_ui_icons()
   return {
      package_installed = "✓",   -- ⎧ "󱄲" ⎫  xero's icons: preserved here
      package_pending = "➜",     -- ⎨ "󱄰" ⎬  because I may choose to use
      package_uninstalled = "✗", -- ⎩ "󱄯" ⎭  them.
   }
end

-- ╞═╡  FUNCTION: M.render_markdown_icons() (for render-markdown.nvim) ════╡ --

---@return table
function M.render_markdown_icons()
   return {
      '󰎥 ',
      '󰎨 ',
      '󰎫 ',
      '󰎲 ',
      '󰎯 ',
      '󰎴 '
   }
end

-- ╞═╡  FUNCTION: M.diagnostics() ╞═════════════════════════════════════════╡ --

---@return table
function M.diagnostics()
   return {
      error = " ",
      hint = " ",
      information = " ",
      other = " ",
      warning = " ",
   }
end

-- ╞═╡ SECTION: M.git() ╞══════════════════════════════════════════════════╡ --

---@return table
function M.git()
   return {
      Added = " ",
      Modified = " ",
      Removed = " ",
   }
end

-- ╞═╡ SECTION: M.dap() ╞══════════════════════════════════════════════════╡ --

---@return table
function M.dap()
   return {
      breakpoint = " ",
      breakpoint_condition = " ",
      log_point = " ",
      stopped = " ",
      breakpoint_rejected = " ",
      pause = " ",
      play = " ",
      step_into = " ",
      step_over = " ",
      step_out = " ",
      step_back = " ",
      run_last = " ",
      terminate = " ",
   }
end

-- ╞═╡ FUNCTION: M.lazy (for lazy.nvim) ╞══════════════════════════════════╡ --

---@return table
function M.lazy()
   return {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "󱄲",
      not_loaded = "󱄯",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
         "󱄰",
         "➜",
         "★",
         "‒",
      },
   }
end

-- ╞═╡  FUNCTION: M.trouble() (for trouble.nvim) ╞═════════════════════════╡ --

---@return table
function M.trouble()
   return {
      indent = {
         top = "┊ ",
         middle = "├╴",
         last = "└╴",
         fold_open = " ",
         fold_closed = " ",
         ws = "  ",
      },
      folder_closed = " ",
      folder_open = " ",
      kinds = {
         Array = " ",
         Boolean = "󰨙 ",
         Class = " ",
         Constant = "󰏿 ",
         Constructor = " ",
         Enum = " ",
         EnumMember = " ",
         Event = " ",
         Field = " ",
         File = " ",
         Function = "󰊕 ",
         Interface = " ",
         Key = " ",
         Method = "󰊕 ",
         Module = " ",
         Namespace = "󰦮 ",
         Null = " ",
         Number = "󰎠 ",
         Object = " ",
         Operator = " ",
         Package = " ",
         Property = " ",
         String = " ",
         Struct = "󰆼 ",
         TypeParameter = " ",
         Variable = "󰀫 ",
      }
   }
end

-- ╞═╡  FUNCTION: borders() ╞══════════════════════════════════════════════╡ --

---@return table
function M.borders()
   return {
      dashed = { "┄", "┊", "┄", "┊", "╭", "╮", "╯", "╰", },
      double = { "═", "║", "═", "║", "╔", "╗", "╝", "╚", },
      single = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
      blocks = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
      blocky = { "▀", "▐", "▄", "▌", "▄", "▄", "▓", "▀", },
   }
end

-- ╞═╡  FUNCTION: M.telescope() (for telescope.nvim) ╞═════════════════════╡ --

---@return table
function M.telescope()
   return {
         prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
         results = { "─", " ", "─", "│", "╭", "─", "─", "╰", },
         preview = { "─", "│", "─", "│", "─", "╮", "╯", "╰", },
   }
end

return M

