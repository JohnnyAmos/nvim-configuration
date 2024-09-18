--JMJ----------------------------------✝︎---------------------------------AMDG--
--                       PLUGIN: todo-comments.nvim                          --
--                     Last Modified: 2024-09-14 22:48
-------------------------------------------------------------------------------

return {
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { 'TodoTrouble', 'TodoTelescope' },
      lazy = false;
      opts = {
         keywords = {
            FIX = {
               icon = " ",
               color = "fix",
            },
            TODO = {
               icon = " ",
               color = "todo",
            },
            HACK = {
               icon = " ",
               color = "hack",
            },
            WARN = {
               icon = " ",
               color = "warn",
            },
            PERF = {
               icon = "󰇬 ",
               color = "perf",
            },
            NOTE = {
               icon = " ",
               color = "note",
            },
            TEST = {
               icon = " ",
               color = "test",
            },
            IDEA = {
               icon = " ",
               color = "idea",
            },
            PLUGIN = {
               icon = ' ',
               color = 'plugin',
            },
            SECTION = {
               icon = '󰚟 ',
               color = 'section',
               alt = { 'FUNCTION' }
            },
         },
         merge_keywords = true,
         --[[  FIX: ]]--
         --[[  TODO: ]]--
         --[[  HACK: ]]--
         --[[  WARN: ]]--
         --[[  PERF: ]]--
         --[[  NOTE: ]]--
         --[[  TEST: ]]--
         --[[  IDEA: ]]--
         --[[  PLUGIN: ]]--
         --[[  SECTION: ]]--
         colors = {
            fix = { "#ff5445" },
            todo = { "#76c7b7" },
            hack = { "#fda331" },
            warn = { "#e8e805" },
            perf = { "#d381c3" },
            note = { "#6fb3d2" },
            test = { "#b0b0b0" },
            idea = { "#a1c659" },
            plugin = { "#e3845a" },
            section = { "#6fb3d2" },
         },
         highlight = {
            multiline = false, -- default: false
            before = "fg", -- 'fg', 'bg', or empty
            keyword = "wide", -- 'fg', 'bg', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "fg",  -- "fg", "bg" or empty
            comments_only = false,
            pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]], -- pattern or table of
                                                     -- patterns, used for
                                                     -- highlightng (vim regex)
         },
      }
   }
}

