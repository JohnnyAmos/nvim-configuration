--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Utility file: $HOME/.config/nvim/lua/config/utils/icons.lua
-- Borrowed with modifications from xero harrison's dotfiles:
-- Source: https://github.com/xero/dotfiles/
-- Source license: CC0-1.0
-- Last Modified: 2024-10-10 00:32
-------------------------------------------------------------------------------


return {
   diagnostics = {
      error = " ",
      hint = " ",
      information = " ",
      other = " ",
      warning = " ",
   },
   git = {
      Added = " ",
      Modified = " ",
      Removed = " ",
   },
   dap = {
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
   },
   lazy = {
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
   },
   mason = {
      package_installed = "󱄲",
      package_pending = "󱄰",
      package_uninstalled = "󱄯",
   },
   trouble = {
      indent = {
         top           = "┊ ",
         middle        = "├╴",
         last          = "└╴",
         fold_open     = " ",
         fold_closed   = " ",
         ws            = "  ",
      },
      folder_closed   = " ",
      folder_open     = " ",
      kinds = {
         Array         = " ",
         Boolean       = "󰨙 ",
         Class         = " ",
         Constant      = "󰏿 ",
         Constructor   = " ",
         Enum          = " ",
         EnumMember    = " ",
         Event         = " ",
         Field         = " ",
         File          = " ",
         Function      = "󰊕 ",
         Interface     = " ",
         Key           = " ",
         Method        = "󰊕 ",
         Module        = " ",
         Namespace     = "󰦮 ",
         Null          = " ",
         Number        = "󰎠 ",
         Object        = " ",
         Operator      = " ",
         Package       = " ",
         Property      = " ",
         String        = " ",
         Struct        = "󰆼 ",
         TypeParameter = " ",
         Variable      = "󰀫 ",
      }
   },
   borders = {
      dashed = { "┄", "┊", "┄", "┊", "╭", "╮", "╯", "╰", },
      double = { "═", "║", "═", "║", "╔", "╗", "╝", "╚", },
      single = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
      blocks = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
      blocky = { "▀", "▐", "▄", "▌", "▄", "▄", "▓", "▀", },
   },
   telescope = {
      prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰", },
      results = { "─", " ", "─", "│", "╭", "─", "─", "╰", },
      preview = { "─", "│", "─", "│", "─", "╮", "╯", "╰", },
   },
}

