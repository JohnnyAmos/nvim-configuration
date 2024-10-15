--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/mini.lua
-- Plugin source: https://github.com/echasnovski/mini.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-29 11:34
-------------------------------------------------------------------------------


return {
   {
      "echasnovski/mini.nvim",
      version = false,
      config = function()

         -- PLUGIN: mini.align
         require("mini.align").setup()

         -- PLUGIN: mini.bracketed
         require("mini.bracketed").setup()

         -- PLUGIN: mini.cursorword
         -- I'm of two minds about this one. It can be useful, and it can be
         -- very annoying. The trait it exhibits most wins.
         require("mini.cursorword").setup()

         -- PLUGIN: mini.icons
         require("mini.icons").setup()

         -- PLUGIN: mini.jump
         require("mini.jump").setup()

         -- PLUGIN: mini.junp2d
         require("mini.jump2d").setup({
            mappings = {
               start_jumping = "<leader><cr>",
            },
         })

         -- PLUGIN: mini.misc
         -- I know it's just a box, but it's a nice box and I might need it
         -- someday. I just hope I can remember where I put it when I need it.
         require("mini.misc").setup()

         -- PLUGIN: mini.move
         require("mini.move").setup()

         -- PLUGIN: mini.operators
         -- The default keymaps didn't work so I am trying them in the config.
         require("mini.operators").setup({
            evaluate = { prefix = "g=" },
            exchange = { prefix = "gx" },
            multiply = { prefix = "gm" },
            replace  = { prefix = "gr" },
            sort     = { prefix = "gs" }
         })

         -- PLUGIN: mini.pairs 
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

         -- PLUGIN: mini.sessions
         -- TODO: See if there are any keymaps that can be used, or make some
         require("mini.sessions").setup()

         -- PLUGIN: mini.starter
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
         -- TODO: mini.starter 
            -- Add fortune and stats to footer and put the cow back in the
            -- header.
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

         -- PLUGIN: mini.visits
         require("mini.visits").setup()

      end
   }
}

--[[ NOTE: The unused mini.nvim modules.

 TODO: I haven't tried these modules yet:

mini.hues      mini.test      mini.colors    mini.trailspace

I don't have a need for these modules:

mini.basics    mini.doc       mini.extra     mini.map

I am using other plugins for these purposes:

I am using:                   instead of:

nvim-treesitter-textobject    mini.ai

tinty                         mini.base16

which-key.nvim                mini.clu

nvim-cmp                      mini.completion

lazy.nvim                     mini.deps

gitsigns.nvim                 mini.diff

neo-tree.nvim                 mini.files

telescope-fzf-native.nvim     mini.fuzzy

gitsigns.nvim                 mini.git

todo-comments.nvim            mini.hipatterns

nvim-notify                   mini.notify

telescope.nvim                mini.pick

treesj                        mini.splitjoin

lualine.nvim                  mini.statusline

nvim-surround                 mini.surround

lualine.nvim                  mini.tabline

As regards mini.comment: It does one thing at a time. It does it very well.
And then… It moves on. I, however, needed more than one thing. So I moved on.

As for mini.bufremove: it's been a long time since I used vim, and I am new to
nvim, and I don't get the point of this one. Maybe in time. ¯\_(ツ)_/¯

And Finnaly, firmly in the no thank you category:

mini.animate: ʕ ͡° ʖ̯ ͡°ʔノ eww, apparantly I am not a fan of flying cursors.

mini.indentscope: this is even worse than the animated cursor. It is rather
annoying (ಠ_ಠ)

--]]

