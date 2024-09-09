------------------------------------------------------------------------------
--                       PLUGIN: todo-comments.nvim                         --
--                     Last Modified: 2024-09-08 17:17
------------------------------------------------------------------------------

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
            },
         },
         keys = {
            {
               "]t",
               function()
                  require("todo-comments").jump_next()
               end,
               desc = "Next Todo Comment"
            },
            {
               "[t",
               function() require("todo-comments").jump_prev()
               end,
               desc = "Previous Todo Comment"
            },
            {
               "<leader>xt",
               "<cmd>Trouble todo toggle<cr>",
               desc = "Todo (Trouble)"
            },
            {
               "<leader>xT",
               "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
               desc = "Todo/Fix/Fixme (Trouble)"
            },
            {
               "<leader>st",
               "<cmd>TodoTelescope<cr>",
               desc = "Todo"
            },
            {
               "<leader>sT",
               "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
               desc = "Todo/Fix/Fixme"
            },
         },
         merge_keywords = true,
         colors = {
            fix = { "#ff5151" },
            todo = { "#5a8dff" },
            hack = { "#ff8e00" },
            warn = { "#e8e805" },
            perf = { "#e461ff" },
            note = { "#dedf97" },
            test = { "#dea4d8" },
            idea = { "#b2e35c" },
            plugin = { "#42d74d" },
            section = { "#91c1de" },
         },
         highlight = {
            multiline = false, -- default: false
            before = "fg", -- 'fg', 'bg', or empty
            keyword = "wide", -- 'fg', 'bg', 'wide', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "fg",  -- "fg", "bg" or empty
            pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]], -- pattern or table of patterns,
                                             -- used for highlightng (vim regex)
         },
      }
   }
}

-- vim: set sts=3 sw=3 ts=3 tw=79:

