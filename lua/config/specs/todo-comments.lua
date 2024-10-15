--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/todo-comments.lua
-- Plugin source: https://github.com/folke/todo-comments.nvim
-- Plugin license: Apache-2.0
-- Last modified: 2024-09-29 11:52
-------------------------------------------------------------------------------


return {
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { 'TodoTrouble', 'TodoTelescope' },
      lazy = false,
      config = function()
         require("todo-comments").setup({
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
                     color = 'section'
                  },
                  FUNCTION = {
                     icon = '󰡱 ',
                     color = 'section'
                  },
               },
               merge_keywords = true,
   
               --[[ FIX: it's broken ]]--
               --[[ TODO [$670dfe84dc2f250008cffcd4]: do this ]]-- possible explanation
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
   --                pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]],
                  pattern = [[.*<(KEYWORDS)\s*:]],
               }
            }
         })
      end
   }
}

-- TODO [$670dfe84dc2f250008cffcd5]: Experiment with different patterns for highlights.
--
-- These patterns allow for usernames in the keyword.
--    highlight = {
--      -- vimgrep regex, supporting the pattern TODO(name):
--      pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
--    },
--    search = {
--      -- ripgrep regex, supporting the pattern TODO(name):
--      pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
--    },
--
-- Also need to make multiline work.

