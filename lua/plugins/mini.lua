--JMJ--------------------------------------------------------------------AMDG--
--                             PLUGIN: mini.lua                              --
--                      Last Modified: 2024-09-26 13:43
-------------------------------------------------------------------------------

return {
   {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
         require("mini.ai").setup()
         require("mini.align").setup()
         require("mini.basics").setup()
         require("mini.bracketed").setup()
         require("mini.bufremove").setup()
         require("mini.comment").setup()
         require("mini.cursorword").setup()
         require("mini.diff").setup()
         require("mini.extra").setup()
         require("mini.files").setup()
         require("mini.fuzzy").setup()
         require("mini.git").setup()
         require("mini.icons").setup()
         require("mini.jump").setup()
         require("mini.map").setup()
         require("mini.misc").setup()
         require("mini.move").setup()
         require("mini.notify").setup()
         require("mini.operators").setup()
         require("mini.pick").setup()
         require("mini.sessions").setup()
         require("mini.splitjoin").setup()
         require("mini.visits").setup()

         --[[ SECTION: mini.surround ]]--
         require("mini.surround").setup({
            -- How to search for surrounding (first inside current line, then
            -- inside neighborhood). One of "cover", "cover_or_next",
            -- "cover_or_prev", "cover_or_nearest", "next", "prev", "nearest".
            search_method = "cover_or_nearest", -- default; "cover"
         })

         --[[ SECTION: mini.indentscope ]]--
         --[[ FIX: or remove ]]-- apparently, verticle lines annoy me
--          require("mini.indentscope").setup({
--             draw = {
--                animation = require("mini.indentscope").gen_animation.none()
--             },
--             try_as_border = true,
--          })

         --[[ SECTION: mini.jump2d ]]--
         require("mini.jump2d").setup({
            mappings = {
               start_jumping = "<leader><cr>",
            },
         })

         --[[ SECTION: mini.pairs ]]--
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

         --[[ SECTION: mini.starter ]]--
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

         --[[ TODO [$66fa5109d28c3e0008b8bbab]: add fortune and stats to footer ]]--
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
            },
         })
      end
   }
}

--[[ unused modules
         require("mini.animate").setup()
         require("mini.base16").setup()
         require("mini.clue").setup()
         require("mini.completion").setup()
         require("mini.colors").setup()
         require("mini.deps").setup()
         require("mini.doc").setup()
         require("mini.hipatterns").setup()
         require("mini.hues").setup()
         require("mini.statusline").setup()
         require("mini.tabline").setup()
         require("mini.test").setup()
         require("mini.trailspace").setup()
]]

