-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Asset file: $HOME/.config/nvim/lua/assets/icons.lua                  ║ --
-- ║  Based on xero harrison's dotfiles:                                   ║ --
-- ║  Source: https://github.com/xero/dotfiles/                            ║ --
-- ║  Source license: CC0-1.0                                              ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-09 21:30

local icons = {}

-- ╞═╡  SECTION: icons.gitsigns (for gitsigns.nvim) ╞══════════════════════╡ --

function icons.gitsigns()
   return {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' }
   }
end

-- ╞═╡  SECTION: icons.gitsigns_staged (for gitsigns.nvim) ╞═══════════════╡ --

function icons.gitsigns_staged()
   return {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' }
   }
end

-- ╞═╡  SECTION: icons.lualine_ff_symbols (for lualine.nvim) ╞═════════════╡ --

function icons.lualine_ff_symbols()
   return {
      unix = ' ',
      dos = ' ',
      mac = ' '
   }
end

-- ╞═╡  SECTION: icons.mason_ui (for mason.nvim) ╞═════════════════════════╡ --

function icons.mason_ui()
   return {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
   }
end

-- ╞═╡  SECTION: icons.diagnostics ╞═══════════════════════════════════════╡ --

-- icons.diagnostics = {
--    error = " ",
--    hint = " ",
--    information = " ",
--    other = " ",
--    warning = " "
-- }

-- ╞═╡  SECTION: icons.git ╞═══════════════════════════════════════════════╡ --

-- icons.git = {
--    Added = " ",
--    Modified = " ",
--    Removed = " "
-- }

-- ╞═╡  SECTION: icons.dap ╞═══════════════════════════════════════════════╡ --

-- icons.dap = {
--    breakpoint = " ",
--    breakpoint_condition = " ",
--    log_point = " ",
--    stopped = " ",
--    breakpoint_rejected = " ",
--    pause = " ",
--    play = " ",
--    step_into = " ",
--    step_over = " ",
--    step_out = " ",
--    step_back = " ",
--    run_last = " ",
--    terminate = " "
-- }

-- ╞═╡  SECTION: icons.lazy (for lazy.nvim) ╞══════════════════════════════╡ --

function icons.lazy()
   return {
      cmd = " ",
      config = "",
      event = " ",
      favorite = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒"
      }
   }
end

-- ╞═╡  SECTION: icons.trouble (for trouble.nvim) ╞═══════════════════════╡ --

-- icons.trouble = {
--    indent = {
--       top = "┊ ",
--       middle = "├╴",
--       last = "└╴",
--       fold_open = " ",
--       fold_closed = " ",
--       ws = "  "
--    },
--    folder_closed = " ",
--    folder_open = " ",
--    kinds = {
--       Array = " ",
--       Boolean = "󰨙 ",
--       Class = " ",
--       Constant = "󰏿 ",
--       Constructor = " ",
--       Enum = " ",
--       EnumMember = " ",
--       Event = " ",
--       Field = " ",
--       File = " ",
--       Function = "󰊕 ",
--       Interface = " ",
--       Key = " ",
--       Method = "󰊕 ",
--       Module = " ",
--       Namespace = "󰦮 ",
--       Null = " ",
--       Number = "󰎠 ",
--       Object = " ",
--       Operator = " ",
--       Package = " ",
--       Property = " ",
--       String = " ",
--       Struct = "󰆼 ",
--       TypeParameter = " ",
--       Variable = "󰀫 "
--    }
-- }

-- ╞═╡  SECTION: borders() ╞═══════════════════════════════════════════════╡ --

-- icons.borders = {
--    dashed = { "┄", "┊", "┄", "┊", "╭", "╮", "╯", "╰", },
--    double = { "═", "║", "═", "║", "╔", "╗", "╝", "╚", },
--    single = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    blocks = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
--    blocky = { "▀", "▐", "▄", "▌", "▄", "▄", "▓", "▀", }
-- }

-- ╞═╡  SECTION:  icons.telescope (for telescope.nvim) ╞═══════════════════╡ --

-- icons.telescope = {
--    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    results = { "─", " ", "─", "│", "╭", "─", "─", "╰", },
--    preview = { "─", "│", "─", "│", "─", "╮", "╯", "╰", }
-- }


return icons

-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

