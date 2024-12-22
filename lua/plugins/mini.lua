-- ╔═JMJ═══════════════════════╡  ❈✧❈  ✞  ❈✧❈  ╞══════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/mini.lua                 ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2024-12-18 15:28


return {

   {
      "echasnovski/mini.nvim",
      version = false,
      config = function()

         -- mini.align
         require("mini.align").setup()

         -- mini.bracketed
         require("mini.bracketed").setup()

         -- mini.cursorword
         -- I'm of two minds about this one. It can be useful, and it can be
         -- very annoying. The trait it exhibits most wins.
         require("mini.cursorword").setup()

         -- mini.icons
         require("mini.icons").setup()

         -- mini.jump
         require("mini.jump").setup()

         -- mini.junp2d
         require("mini.jump2d").setup({
            mappings = {
               start_jumping = "\\",
            },
         })

         -- mini.misc
         -- I know it's just a box, but it's a nice box and I might need it
         -- someday. I just hope I can remember where I put it when I need it.
         require("mini.misc").setup()

         -- mini.move
         require("mini.move").setup({
            mappings = {
               -- Move visual selection in Visual mode.
               -- Defaults are Alt (Meta) + hjkl.
               left = '<ca-h>',
               right = '<ca-l>',
               down = '<ca-j>',
               up = '<ca-k>',
               -- Move current line in Normal mode
               line_left = '<a-h>',
               line_right = '<a-l>',
               line_down = '<a-j>',
               line_up = '<a-k>',
            },
         })

         -- mini.pairs
         -- I borrowed (blatenly stole) this and I can't remember where from.
         -- As soon as I figure it out I will post the requisit credits.
         -- If it's yours let me know. Thanks.
         require("mini.pairs").setup({
            mappings = {
               -- Prevent the addition of the closing symbol when opening
               -- symbol is to the left of any non-space character or to the
               -- immediate right of "\".
               ["("] = {
                  action = "open",
                  pair = "()",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               ["["] = {
                  action = "open",
                  pair = "[]",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               ["{"] = {
                  action = "open",
                  pair = "{}",
                  neigh_pattern = "[^\\][%s%)%]%}]"
               },
               -- This is default (prevents the action if the cursor is just
               -- next to a "\").
               [")"] = {
                  action = "close",
                  pair = "()",
                  neigh_pattern = "[^\\]."
               },
               ["]"] = {
                  action = "close",
                  pair = "[]",
                  neigh_pattern = "[^\\]."
               },
               ["}"] = {
                  action = "close",
                  pair = "{}",
                  neigh_pattern = "[^\\]."
               },
               -- Prevents the action if the cursor is just before or next to
               -- any character.
               ['"'] = {
                  action = "closeopen",
                  pair = '""',
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
               ["'"] = {
                  action = "closeopen",
                  pair = "''",
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
               ["`"] = {
                  action = "closeopen",
                  pair = "``",
                  neigh_pattern = "[^%w][^%w]",
                  register = { cr = false }
               },
            },
         })

         -- mini.sessions
         -- TODO: See if there are any keymaps that can be used, or make some
         require("mini.sessions").setup()

         -- mini.starter
         local logo = table.concat({
            [[,----------------------------------------------------,]],
            [[| [][][][][]  [][][][][]  [][][][]  [][__]  [][][][] |]],
            [[|                                                    |]],
            [[|  [][][][][][][][][][][][][][_]    [][][]  [][][][] |]],
            [[|  [_][][][][][][][][][][][][][ |   [][][]  [][][][] |]],
            [[| [][_][][][][][][][][][][][][]||     []    [][][][] |]],
            [[| [__][][][][][][][][][][][][__]    [][][]  [][][]|| |]],
            [[|   [__][________________][__]              [__][]|| |]],
            [[`----------------------------------------------------"]],
         }, "\n")
         local pad = string.rep(" ", 1)
         local new_section = function(name, action, section)
            return {
               name = name,
               action = action,
               section = pad .. section
            }
         end

         -- TODO: Add fortune and stats to footer and put the cow back
         -- in the header.
         local starter = require("mini.starter")
         starter.setup({
            evaluating_single = true,
            header = logo,
            items = {
               {
                  action = "ene | startinsert",
                  name = "New File",
                  section = "Files"
               },
               {
                  action = "Telescope oldfiles",
                  name = "Recent Files",
                  section = "Files"
               },
               {
                  action = "Telescope find_files",
                  name = "Find Files",
                  section = "Files"
               },
               {
                  action = "Telescope file_browser",
                  name = "Browser",
                  section = "Files"
               },
               {
                  action = "Telescope live_grep",
                  name = "Live Grep",
                  section = "Search"
               },
               {
                  action = "Telescope command_history",
                  name = "Command History",
                  section = "Search"
               },
               {
                  action = "Telescope repo list",
                  name = "Git Repos",
                  section = "Projects"
               },
               starter.sections.sessions(5, true),
               {
                  action = "Telescope man_pages",
                  name = "Man Pages",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope help_tags",
                  name = "Help tags",
                  section = "Reference/Config"
               },
               {
                  action = "Lazy",
                  name = "Plugins",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope colorscheme",
                  name = "Schémas de Couleurs",
                  section = "Reference/Config"
               },
               {
                  action = "Telescope bookmarks",
                  name = "Vivaldi Bookmarks",
                  section = "Internet Resources"
               },
               {
                  action = "qa",
                  name = "Quit",
                  section = "Exit"
               },
            },
            -- footer = footer,
            content_hooks = {
               starter.gen_hook.adding_bullet("░ ☞  "),
               starter.gen_hook.aligning("center", "center"),
               starter.gen_hook.indexing("all", {
                  "Files",
                  "Search",
                  "Projects",
                  "Reference/Config",
                  "Internet Resources",
                  "Exit"
               })
            }
         })

         -- mini.visits
         require("mini.visits").setup()

      end

   }

}

   --[[

      NOTE: The unused mini.nvim modules.

      TODO: I haven't tried these modules yet:

         mini.hues      mini.test      mini.colors    mini.trailspace

      If I get around to writing a plugin or two I might need mini.doc.

      I don't have a need for these modules:

         mini.basics      mini.extra       mini.map         mini.operators

      I am using other plugins for these purposes:

         instead of:      I'm using:

         mini.ai          nvim-treesitter-textobject

         mini.base16      tinty  TODO: tinty's out. Time to reconsider mini.base16

         mini.clu         which-key.nvim

         mini.completion  nvim-cmp

         mini.deps        lazy.nvim

         mini.diff        gitsigns.nvim

         mini.files       neo-tree.nvim

         mini.fuzzy       telescope-fzf-native.nvim

         mini.git         gitsigns.nvim

         mini.hipatterns  todo-comments.nvim

         mini.notify      nvim-notify (I'm using neither at the moment.)

         mini.pick        telescope.nvim

         mini.splitjoin   treesj

         mini.statusline  lualine.nvim

         mini.surround    nvim-surround

         mini.tabline     lualine.nvim

      As regards mini.comment: It does one thing at a time. It does it very
      well. And then… It moves on. I, however, needed more than one thing.
      So I moved on.

      As for mini.bufremove: it's been a long time since I used vim, and I
      am new to nvim, and I don't get the point of this one. Maybe in time.
      ¯\_(ツ)_/¯

      And Finally, firmly in the no-thank-you category:

         mini.animate: ʕ ͡° ʖ̯ ͡°ʔノ Eww, apparantly I am not a fan of flying
        cursors.

         mini.indentscope: This is even worse than the animated cursor. It
         is terribly annoying. (ಠ_ಠ)

   --]]


-- ╞═════════════════════════╡  ❈✧❈  finis  ❈✧❈  ╞═════════════════════════╡ --

