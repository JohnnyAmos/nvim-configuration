--[[ TODO: insert comment header ]]--


return {
   --[[ PLUGIN: comment-box.nvim ]]-- not for comment headers
   {
      "LudoPinelli/comment-box.nvim",
      opts = {
         comment_style = "auto", -- also "line" and "block"
         doc_width = 79,
         box_width = 73,
         line_width = 79,
         outer_blank_lines_above = true,
         outer_blank_lines_below = true,
         inner_blank_lines = true,
         line_blank_line_above = true,
         line_blank_line_below = true,
      },
   },
   --[[ PLUGIN: nvim-colorizer.lua ]]--
   {
      'norcalli/nvim-colorizer.lua',
      opts = {}
   },
   --[[ PLUGIN: custom-theme.nvim ]]--
   {
      "Djancyp/custom-theme.nvim",
      opts = {}
   },
   --[[ PLUGIN: base16-vim ]]--
   {
      'tinted-theming/base16-vim',
      priority = 1000
   },
   --[[ PLUGIN: onedarkpro.nvim ]]--
   {
      "olimorris/onedarkpro.nvim",
      priority = 1000,
   },
   --[[ PLUGIN: nvim-comment-frame ]]--
   {
      's1n7ax/nvim-comment-frame',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      opts = {
         disable_default_keymap = true,
         frame_width = 79,
         line_wrap_len = 60,
      }
   },
   --[[ PLUGIN: todo-comments.nvim ]]--
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { 'TodoTrouble', 'TodoTelescope' },
      lazy = false;
      opts = {
         keywords = {
            FIX = {
               icon = " ",
               color = "fix"
            },
            TODO = {
               icon = " ",
               color = "todo"
            },
            HACK = {
               icon = " ",
               color = "hack"
            },
            WARN = {
               icon = " ",
               color = "warn"
            },
            PERF = {
               icon = "󰇬 ",
               color = "perf"
            },
            NOTE = {
               icon = " ",
               color = "note"
            },
            TEST = {
               icon = " ",
               color = "test"
            },
            IDEA = {
               icon = " ",
               color = "idea"
            },
            PLUGIN = {
               icon = ' ',
               color = 'plugin'
            },
            SECTION = {
               icon = '󰡱 ',
               color = 'section',
               alt = { 'FUNCTION' }
            },
            FUNCTION = {
               icon = '󰡱 ',
               color = 'section'
            },

         },
         merge_keywords = true,

         --[[ FIX: it's broken ]]--
         --[[ TODO: do this ]]-- possible explanation
         --[[ HACK: held together with chewing gum and bailing wire ]]--
         --[[ WARN: something bad may happen ]]--
         --[[ PERF: make it go faster ]]--
         --[[ NOTE: something informative ]]--
         --[[ TEST: will it work ]]--
         --[[ IDEA: try this ]]--
         --[[ PLUGIN: pluggy.nvim ]]-- what it does, perhaps
         --[[ SECTION: complementary items ]]--

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
            multiline = true, -- default: false
            before = "fg", -- 'fg', 'bg', or empty
            keyword = "wide", -- 'fg', 'bg', 'wide', 'wide_bg',
                              -- 'wide_fg', or empty
            after = "fg",  -- "fg", "bg" or empty
            comments_only = false,
            -- pattern or table of patterns, used for highlightng (vim regex)
--             pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]],
            pattern = [[.*<(KEYWORDS)\s*:]],

                                                     
         },
      },
      --[[ TODO: eperiment with different patterns ]]
      -- these patterns allow for usernames in the keyword
--       highlight = {
--         -- vimgrep regex, supporting the pattern TODO(name):
--         pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
--       },
--       search = {
--         -- ripgrep regex, supporting the pattern TODO(name):
--         pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
--       },
   }


}



