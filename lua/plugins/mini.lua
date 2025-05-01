-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/mini.lua                 ║ --
-- ║  Source: https://github.com/echasnovski/mini.nvim                     ║ --
-- ║  License: MIT                                                         ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [***] Various                                Last modified: 2025-04-29 14:43

local M = {
   "echasnovski/mini.nvim",
   version = false,
}

function M.config()
   -- ╞═╡ mini.align ╞═══════════════════════════╡ Coding: Formatting ╞═╡ --

   local ok, mini_align = pcall(require, "mini.align")
   if not ok then
      print("Error: " .. mini_align)
   end

   mini_align.setup()

   -- ╞═╡ mini.bracketed ╞═══════════════════════════╡ UI: Navigation ╞═╡ --

   local ok, mini_bracketed = pcall(require, "mini.bracketed")
   if not ok then
      print("Error: " .. mini_bracketed)
   end

   mini_bracketed.setup()

   -- ╞═╡ mini.cursorword ╞══════════════════════════════════╡ Coding ╞═╡ --

   -- i'm of two minds about this one. it can be useful, and it can
   -- be very annoying. The trait it exhibits most wins.

   local ok, mini_cursorword = pcall(require, "mini.cursorword")
   if not ok then
      print("Error: " .. mini_cursorword)
   end

   mini_cursorword.setup()

   -- ╞═╡ mini.icons ╞════════════════════════════════════╡ UI: Icons ╞═╡ --

   local ok, mini_icons = pcall(require, "mini.icons")
   if not ok then
      print("Error: " .. mini_icons)
   end

   mini_icons.setup()

   -- ╞═╡ mini.jump ╞════════════════════════════════╡ UI: Navigation ╞═╡ --

   local ok, mini_jump = pcall(require, "mini.jump")
   if not ok then
      print("Error: " .. mini_jump)
   end

   mini_jump.setup()

   -- ╞═╡ mini.jump2d ╞══════════════════════════════╡ UI: Navigation ╞═╡ --

   local ok, mini_jump2d = pcall(require, "mini.jump2d")
   if not ok then
      print("Error: " .. mini_jump2d)
   end

   mini_jump2d.setup({
      mappings = {
         start_jumping = "\\",
      },
   })

   -- ╞═╡ mini.misc ╞═══════════════════════════════════════╡ Utilily ╞═╡ --

   -- I know it's just a box, but it's a nice box and I might need it
   -- someday. I just hope I can remember where I put it when I need it.

   local ok, mini_misc = pcall(require, "mini.misc")
   if not ok then
      print("Error: " .. mini_misc)
   end

   mini_misc.setup()

   -- ╞═╡ mini.move ╞════════════════════════════════════════╡ Editor ╞═╡ --

   local ok, mini_move = pcall(require, "mini.move")
   if not ok then
      print("Error: " .. mini_move)
   end

   mini_move.setup({
      mappings = {
         -- move visual selection in visual mode.
         left = "<ca-h>",
         right = "<ca-l>",
         down = "<ca-j>",
         up = "<ca-k>",
         -- move current line in normal mode
         line_left = "<a-h>",
         line_right = "<a-l>",
         line_down = "<a-j>",
         line_up = "<a-k>",
      },
   })

   -- ╞═╡ mini.pairs ╞═══════════════════════════════════════╡ Editor ╞═╡ --

   -- i borrowed (blatenly stole) this and i can't remember where from.
   -- As soon as I figure it out I will post the requisite credits. if
   -- it's yours let me know. thanks.

   local ok, mini_pairs = pcall(require, "mini.pairs")
   if not ok then
      print("Error: " .. mini_pairs)
   end

   mini_pairs.setup({
      mappings = {
         -- prevent the addition of the closing symbol when opening
         -- symbol is to the left of any non-space character or to the
         -- immediate right of "\".
         ["("] = {
            action = "open",
            pair = "()",
            neigh_pattern = "[^\\][%s%)%]%}]",
         },
         ["["] = {
            action = "open",
            pair = "[]",
            neigh_pattern = "[^\\][%s%)%]%}]",
         },
         ["{"] = {
            action = "open",
            pair = "{}",
            neigh_pattern = "[^\\][%s%)%]%}]",
         },
         -- this is default (prevents the action if the cursor is just
         -- next to a "\").
         [")"] = {
            action = "close",
            pair = "()",
            neigh_pattern = "[^\\].",
         },
         ["]"] = {
            action = "close",
            pair = "[]",
            neigh_pattern = "[^\\].",
         },
         ["}"] = {
            action = "close",
            pair = "{}",
            neigh_pattern = "[^\\].",
         },
         -- prevents the action if the cursor is just before or next to
         -- any character.
         ['"'] = {
            action = "closeopen",
            pair = '""',
            neigh_pattern = "[^%w][^%w]",
            register = { cr = false },
         },
         ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "[^%w][^%w]",
            register = { cr = false },
         },
         ["`"] = {
            action = "closeopen",
            pair = "``",
            neigh_pattern = "[^%w][^%w]",
            register = { cr = false },
         },
      },
   })

   -- ╞═╡ mini.sessions ╞══════════════════════════════════╡ Projects ╞═╡ --

   -- todo: see if there are any keymaps that can be used, or make some

   local ok, mini_sessions = pcall(require, "mini.sessions")
   if not ok then
      print("Error: " .. mini_sessions)
   end

   mini_sessions.setup()

   -- ╞═╡ mini.starter ╞════════════════════════════╡ UI: Enhancement ╞═╡ --

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
         section = pad .. section,
      }
   end

   -- todo: add fortune and stats to footer and put the cow back
   -- in the header.

   local ok, mini_starter = pcall(require, "mini.starter")
   if not ok then
      print("Error: " .. mini_starter)
   end

   mini_starter.setup({
      evaluating_single = true,
      header = logo,
      items = {
         {
            action = "ene | startinsert",
            name = "new file",
            section = "files",
         },
         {
            action = "telescope oldfiles",
            name = "recent files",
            section = "files",
         },
         {
            action = "telescope find_files",
            name = "find files",
            section = "files",
         },
         {
            action = "telescope file_browser",
            name = "browser",
            section = "files",
         },
         {
            action = "telescope live_grep",
            name = "live grep",
            section = "search",
         },
         {
            action = "telescope command_history",
            name = "command history",
            section = "search",
         },
         {
            action = "telescope repo list",
            name = "git repos",
            section = "projects",
         },
         mini_starter.sections.sessions(5, true),
         {
            action = "telescope man_pages",
            name = "man pages",
            section = "reference/config",
         },
         {
            action = "telescope help_tags",
            name = "help tags",
            section = "reference/config",
         },
         {
            action = "lazy",
            name = "plugins",
            section = "reference/config",
         },
         {
            action = "telescope colorscheme",
            name = "schémas de couleurs",
            section = "reference/config",
         },
         {
            action = "telescope bookmarks",
            name = "vivaldi bookmarks",
            section = "internet resources",
         },
         {
            action = "qa",
            name = "quit",
            section = "exit",
         },
      },
      -- footer = footer, -- need to set up fortune.nvim
      content_hooks = {
         mini_starter.gen_hook.adding_bullet("░ ☞  "),
         mini_starter.gen_hook.aligning("center", "center"),
         mini_starter.gen_hook.indexing("all", {
            "files",
            "search",
            "projects",
            "reference/config",
            "internet resources",
            "exit",
         }),
      },
   })

   -- ╞═╡ mini.visits ╞════════════════════════════════════╡ Projects ╞═╡ --

   local ok, mini_visits = pcall(require, "mini.visits")
   if not ok then
      print("Error: " .. mini_visits)
   end

   mini_visits.setup()
end

return M

--[[

   NOTE: The unused mini.nvim modules.

   TODO: I haven't tried these modules yet:

      mini.colors
      mini.hues
      mini.snippets
      mini.test
      mini.trailspace

   If I get around to writing a plugin or two I might need mini.doc.

   I don't have a need for these modules:

      mini.basics
      mini.extra
      mini.map
      mini.operators

   I am using other plugins for these purposes:

      instead of:      I'm using:

      mini.ai          nvim-treesitter-textobject

      mini.base16      tinty  NOTE: tinty's out. lush.nvim is in… or not.
                       At the moment I am using dark_flat.nvim with custom
                       colors.

      mini.clue        which-key.nvim

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
   well. And then… it moves on. I, however, needed more than one thing.
   so I moved on.

   As for mini.bufremove: it's been a long time since I used vim, and I
   am new to nvim, and I don't get the point of this one. Maybe in time.
   ¯\_(ツ)_/¯

   And finally, firmly in the no-thank-you category:

      mini.animate: ʕ ͡° ʖ̯ ͡°ʔノ Eww, apparantly I am not a fan of flying
      cursors.

      mini.indentscope: This is even worse than the animated cursor. It
      is terribly annoying. (ಠ_ಠ)

--]]

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
