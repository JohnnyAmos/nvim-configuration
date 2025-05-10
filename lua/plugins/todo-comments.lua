-- ╔═JMJ════════════════════════════╡  ✞  ╞═══════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╠═══════════════════════════════════════════════════════════════════════╣ --
-- ║  Plugin file: $HOME/.config/nvim/lua/plugins/todo-comments.lua        ║ --
-- ║  Source: https://github.com/folke/todo-comments.nvim                  ║ --
-- ║  License: Apache-2.0                                                  ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
-- [** ] Coding: comments                       Last modified: 2025-05-10 15:26

local M = {
   "folke/todo-comments.nvim",
   cmd = { "TodoTrouble", "TodoTelescope" },
   lazy = false,
}

function M.config()
   local ok, todo_comments = pcall(require, "todo-comments")
   if not ok then
      print("Error: " .. todo_comments)
   end

   todo_comments.setup({
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
         IDEA = {
            icon = " ",
            color = "note",
         },
         TEST = {
            icon = " ",
            color = "test",
         },
         SECTION = {
            icon = "󰚟 ",
            color = "section",
         },
         SUBSECTION = {
            icon = "¶ ",
            color = "subsection",
         },
         PLUGIN = {
            icon = " ",
            color = "plugin",
         },
         FUNCTION = {
            icon = "󰡱 ",
            color = "plugin",
         },
      },
      merge_keywords = true,

      --  FIX:
      --  TODO:
      --  HACK:
      --  WARN:
      --  PERF:
      --  NOTE:
      --  IDEA:
      --  TEST:
      --  SECTION:
      --  SUBSECTION:
      --  PLUGIN:
      --  FUNCTION:

      colors = {
         fix = { "#b22222" },
         todo = { "#01bfff" },
         hack = { "#ff8c00" },
         warn = { "#ffd703" },
         perf = { "#78889a" },
         note = { "#2e8c22" },
         test = { "#deb887" },
         plugin = { "#ba55d3" },
         section = { "#1e91ff" },
         subsection = { "#87cefa" },
      },
      highlight = {
         multiline = true, -- default: false
         -- FIX: The highlighting starts in line with the beginning of the
         -- keyword instead of the beginning of the line.
         -- matched keyword
         multiline_pattern = "^.",
         -- Extra lines that will be re-evaluated when changing a line.
         multiline_context = 10,

         before = "", -- 'fg', 'bg', or empty
         keyword = "wide_bg", -- 'fg', 'bg', 'wide', 'wide_bg',
         -- 'wide_fg', or empty
         after = "", -- "fg", "bg" or empty
         comments_only = true,
         -- pattern or table of patterns, used for highlightng (vim regex)
         -- pattern = [[[-]{1,2}.*<(KEYWORDS)\s*:]],
         pattern = {
            [[.*<(KEYWORDS)\s*:]],
         },
      },
   })
end

--[[

   TODO: Experiment with different patterns for highlights.

   The backslashes are placed before the closing square brackets only so
   the comment doesn't break. they should be removed before using. (\]\])

   These patterns allow for usernames in the keyword.
   highlight = {
      -- vimgrep regex, supporting the pattern TODO(name):
      pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):\]\],
   },
   search = {
      -- ripgrep regex, supporting the pattern TODO(name):
      pattern = [[\b(KEYWORDS)(\(\w*\))*:\]\],
   },

   Also need to make multiline work. Soonish.

--]]

return M

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
