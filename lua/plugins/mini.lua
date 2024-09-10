--[[ TODO: add comment header ]]--

return {
   {
      'echasnovski/mini.nvim',
      version = false,
      config = function()
         require('mini.ai').setup()
         require('mini.align').setup()
--          require('mini.animate').setup()
         require('mini.basics').setup()
         require('mini.bracketed').setup()
         require('mini.bufremove').setup()
--          require('mini.clue').setup({})
         require('mini.colors').setup()
         require('mini.comment').setup()
--          require('mini.completion').setup()
         require('mini.cursorword').setup()
--          require('mini.deps').setup()
         require('mini.diff').setup()
--          require('mini.doc').setup()
         require('mini.extra').setup()
         require('mini.files').setup()
         require('mini.fuzzy').setup()
         require('mini.git').setup()
--          require('mini.hipatterns').setup({
--             highlighters = {
--                fix = { pattern = 'FIX', group = 'MiniHipatternsFix' },
--                 - { pattern = '', group = '' },
--             }
--          })
--          require('mini.hues').setup()
         require('mini.icons').setup()
--          require('mini.indentscope').setup()
--          require('mini.jump').setup()
--          require('mini.jump2d').setup()
         require('mini.map').setup()
         require('mini.misc').setup()
         require('mini.move').setup()
         require('mini.notify').setup()
         require('mini.operators').setup()
         require('mini.pairs').setup()
         require('mini.pick').setup()

         --[[ SECTION: mini.sessions ]]--
         require('mini.sessions').setup()
         require('mini.splitjoin').setup()
         --[[ SECTION: mini.starter ]]--
         local logo = table.concat({
            [[                         ___                          ]],
            [[                        (o o)                         ]],
            [[                   -ooO--(_)--Ooo-                    ]],
            [[,----------------------------------------------------,]],
            [[| [][][][][]  [][][][][]  [][][][]  [][__]  [][][][] |]],
            [[|                                                    |]],
            [[|  [][][][][][][][][][][][][][_]    [][][]  [][][][] |]],
            [[|  [_][][][][][][][][][][][][][ |   [][][]  [][][][] |]],
            [[| [][_][][][][][][][][][][][][]||     []    [][][][] |]],
            [[| [__][][][][][][][][][][][][__]    [][][]  [][][]|| |]],
            [[|   [__][________________][__]              [__][]|| |]],
            [[`----------------------------------------------------']],
         }, '\n')
         local pad = string.rep(" ", 1)
         local new_section = function(name, action, section)
            return {
               name = name,
               action = action,
               section = pad .. section
            }
         end

         --[[ TODO: add fortune and stats to footer ]]--
         local starter = require('mini.starter')
         starter.setup({
            evaluating_single = true,
            header = logo,
            items = {
               {
                  action = 'ene | startinsert',
                  name = 'New File',
                  section = 'Files'
               },
               {
                  action = 'Telescope oldfiles',
                  name = 'Recent Files',
                  section = 'Files'
               },
               {
                  action = 'Telescope find_files',
                  name = 'Find Files',
                  section = 'Files'
               },
               {
                  action = 'Telescope file_browser',
                  name = 'Browser',
                  section = 'Files'
               },
               {
                  action = 'Telescope live_grep',
                  name = 'Live Grep',
                  section = 'Search'
               },
               {
                  action = 'Telescope command_history',
                  name = 'Command History',
                  section = 'Search'
               },
               {
                  action = 'Telescope repo list',
                  name = 'Git Repos',
                  section = 'Projects'
               },
               starter.sections.sessions(5, true),
               {
                  action = 'Telescope man_pages',
                  name = 'Man Pages',
                  section = "Reference/Config"
               },
               {
                  action = 'Telescope help_tags',
                  name = 'Help tags',
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
               starter.gen_hook.adding_bullet('░ ☞  '),
               starter.gen_hook.aligning("center", "center"),
               starter.gen_hook.indexing('all', {
                  'Files',
                  'Search',
                  'Projects',
                  'Reference/Config',
                  'Internet Resources',
                  'Exit'
               })
            },
         })
--          require('mini.statusline').setup()
--          require('mini.surround').setup()
--          require('mini.tabline').setup()
--          require('mini.test').setup()
--          require('mini.trailspace').setup()
         require('mini.visits').setup()
      end
   }
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

