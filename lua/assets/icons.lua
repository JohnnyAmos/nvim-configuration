-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Asset file: $HOME/.config/nvim/lua/assets/icons.lua                  ║ --
-- ║  Borrowed with modifications from xero harrison's dotfiles:           ║ --
-- ║  Source: https://github.com/xero/dotfiles/                            ║ --
-- ║  Source license: CC0-1.0                                              ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-09 21:30


-- ╞═╡  SECTION: icons_gitsigns (for gitsigns.nvim) ╞══════════════════════╡ --

icons_gitsigns = {
   add = { text = '┃' },
   change = { text = '┃' },
   delete = { text = '_' },
   topdelete = { text = '‾' },
   changedelete = { text = '~' },
   untracked = { text = '┆' }
}

-- ╞═╡  SECTION: icons_gitsigns_staged (for gitsigns.nvim) ╞═══════════════╡ --

icons_gitsigns_staged = {
   add = { text = '┃' },
   change = { text = '┃' },
   delete = { text = '_' },
   topdelete = { text = '‾' },
   changedelete = { text = '~' },
   untracked = { text = '┆' }
}

-- ╞═╡  SECTION: icons_lualine_ff_symbols (for lualine.nvim) ╞═════════════╡ --

icons_lualine_ff_symbols = {
   unix = ' ',
   dos = ' ',
   mac = ' '
}

-- ╞═╡  SECTION: icons_mason_ui (for mason.nvim) ╞═════════════════════════╡ --

icons_mason_ui = {
   package_installed = "✓",   -- ⎧ "󱄲" ⎫  xero's icons: preserved here
   package_pending = "➜",     -- ⎨ "󱄰" ⎬  because I may choose to use
   package_uninstalled = "✗"  -- ⎩ "󱄯" ⎭  them.
}

-- ╞═╡  SECTION: icons_diagnostics ╞═══════════════════════════════════════╡ --

-- icons_diagnostics = {
--    error = " ",
--    hint = " ",
--    information = " ",
--    other = " ",
--    warning = " "
-- }

-- ╞═╡  SECTION: icons_git ╞═══════════════════════════════════════════════╡ --

-- icons_git = {
--    Added = " ",
--    Modified = " ",
--    Removed = " "
-- }

-- ╞═╡  SECTION: icons_dap ╞═══════════════════════════════════════════════╡ --

-- icons_dap = {
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

-- ╞═╡  SECTION: icons_lazy (for lazy.nvim) ╞══════════════════════════════╡ --

icons_lazy = {
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
      "‒"
   }
}

-- ╞═╡  SECTION:  icons_trouble (for trouble.nvim) ╞═══════════════════════╡ --

-- icons_trouble = {
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

-- icons_borders = {
--    dashed = { "┄", "┊", "┄", "┊", "╭", "╮", "╯", "╰", },
--    double = { "═", "║", "═", "║", "╔", "╗", "╝", "╚", },
--    single = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    blocks = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
--    blocky = { "▀", "▐", "▄", "▌", "▄", "▄", "▓", "▀", }
-- }

-- ╞═╡  SECTION:  icons_telescope (for telescope.nvim) ╞═══════════════════╡ --

-- icons_telescope = {
--    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
--    results = { "─", " ", "─", "│", "╭", "─", "─", "╰", },
--    preview = { "─", "│", "─", "│", "─", "╮", "╯", "╰", }
-- }

-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

