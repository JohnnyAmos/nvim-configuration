--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/octo.lua
-- Plugin source: https://github.com/pwntester/octo.nvim
-- Plugin license: MIT
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      "pwntester/octo.nvim",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim",
         "nvim-tree/nvim-web-devicons",
         "nvim-treesitter/nvim-treesitter"
      },
      opts = {
         enable_builtin = true,
         default_remote = {"origin", "upstream"},
         picker = "telescope",
         picker_config = {
            mappings = {
               open_in_browser = {
                  lhs = "<localleader>ob",
                  desc = "open issue in browser"
               },
               copy_url = {
                  lhs = "<localleader>ou",
                  desc = "copy url to system clipboard"
               },
               checkout_pr = {
                  lhs = "<localleader>opc",
                  desc = "checkout pull request"
               },
               merge_pr = {
                  lhs = "<localleader>opm",
                  desc = "merge pull request"
               }
            }
         },
         default_to_projects_v2 = true,
         ui = {
            -- show "modified" marks on the sign column
            use_signcolumn = false,
            -- show "modified" marks on the status column
            use_signstatus = true,
         },
         mappings_disable_default = true,
         mappings = {
            issue = {
               close_issue = { lhs = "<localleader>oic", desc = "close issue" },
               reopen_issue = { lhs = "<localleader>oir", desc = "reopen issue" },
               list_issues = { lhs = "<localleader>oil", desc = "list open issues on same repo" },
               reload = { lhs = "<localleader>ox", desc = "reload issue" },
               open_in_browser = { lhs = "<localleader>ob", desc = "open issue in browser" },
               copy_url = { lhs = "<localleader>ou", desc = "copy url to system clipboard" },
               add_assignee = { lhs = "<localleader>oaa", desc = "add assignee" },
               remove_assignee = { lhs = "<localleader>oar", desc = "remove assignee" },
               create_label = { lhs = "<localleader>olc", desc = "create label" },
               add_label = { lhs = "<localleader>ola", desc = "add label" },
               remove_label = { lhs = "<localleader>olr", desc = "remove label" },
               goto_issue = { lhs = "<localleader>oig", desc = "navigate to a local repo issue" },
               add_comment = { lhs = "<localleader>oca", desc = "add comment" } ,
               delete_comment = { lhs = "<localleader>ocd", desc = "delete comment" },
               next_comment = { lhs = "<localleader>ocn", desc = "go to next comment" },
               prev_comment = { lhs = "<localleader>ocp", desc = "go to previous comment" },
               react_hooray = { lhs = "<localleader>orry", desc = "add/remove 🎉 reaction" },
               react_heart = { lhs = "<localleader>orrh", desc = "add/remove ❤️ reaction" },
               react_eyes = { lhs = "<localleader>orri", desc = "add/remove 👀 reaction" },
               react_thumbs_up = { lhs = "<localleader>orru", desc = "add/remove 👍 reaction" },
               react_thumbs_down = { lhs = "<localleader>orrd", desc = "add/remove 👎 reaction" },
               react_rocket = { lhs = "<localleader>orrk", desc = "add/remove 🚀 reaction" },
               react_laugh = { lhs = "<localleader>orrl", desc = "add/remove 😄 reaction" },
               react_confused = { lhs = "<localleader>orrc", desc = "add/remove 😕 reaction" }
            },
            pull_request = {
               checkout_pr = { lhs = "<localleader>opc", desc = "checkout PR" },
               merge_pr = { lhs = "<localleader>opm", desc = "merge commit PR" },
               squash_and_merge_pr = { lhs = "<localleader>ops", desc = "squash and merge PR" },
               rebase_and_merge_pr = { lhs = "<localleader>opr", desc = "rebase and merge PR" },
               list_commits = { lhs = "<localleader>oplc", desc = "list PR commits" },
               list_changed_files = { lhs = "<localleader>oplf", desc = "list PR changed files" },
               show_pr_diff = { lhs = "<localleader>opd", desc = "show PR diff" },
               add_reviewer = { lhs = "<localleader>orv+", desc = "add reviewer" },
               remove_reviewer = { lhs = "<localleader>orv-", desc = "remove reviewer request" },
               close_issue = { lhs = "<localleader>oic", desc = "close PR" },
               reopen_issue = { lhs = "<localleader>oir", desc = "reopen PR" },
               list_issues = { lhs = "<localleader>oil", desc = "list open issues on same repo" },
               reload = { lhs = "<localleader>ox", desc = "reload PR" },
               open_in_browser = { lhs = "<localleader>ob", desc = "open PR in browser" },
               copy_url = { lhs = "<localleader>ou", desc = "copy url to system clipboard" },
               goto_file = { lhs = "<localleader>ofg", desc = "go to file" },
               add_assignee = { lhs = "<localleader>oaa", desc = "add assignee" },
               remove_assignee = { lhs = "<localleader>oar", desc = "remove assignee" },
               create_label = { lhs = "<localleader>olc", desc = "create label" },
               add_label = { lhs = "<localleader>ola", desc = "add label" },
               remove_label = { lhs = "<localleader>olr", desc = "remove label" },
               goto_issue = { lhs = "<localleader>oig", desc = "navigate to a local repo issue" },
               add_comment = { lhs = "<localleader>oca", desc = "add comment" },
               delete_comment = { lhs = "<localleader>ocd", desc = "delete comment" },
               next_comment = { lhs = "<localleader>ocn", desc = "go to next comment" },
               prev_comment = { lhs = "<localleader>ocp", desc = "go to previous comment" },
               react_hooray = { lhs = "<localleader>orry", desc = "add/remove 🎉 reaction" },
               react_heart = { lhs = "<localleader>orrh", desc = "add/remove ❤️ reaction" },
               react_eyes = { lhs = "<localleader>orri", desc = "add/remove 👀 reaction" },
               react_thumbs_up = { lhs = "<localleader>orru", desc = "add/remove 👍 reaction" },
               react_thumbs_down = { lhs = "<localleader>orrd", desc = "add/remove 👎 reaction" },
               react_rocket = { lhs = "<localleader>orrk", desc = "add/remove 🚀 reaction" },
               react_laugh = { lhs = "<localleader>orrl", desc = "add/remove 😄 reaction" },
               react_confused = { lhs = "<localleader>orrc", desc = "add/remove 😕 reaction" },
               review_start = { lhs = "<localleader>orvb", desc = "start a review for the current PR" },
               review_resume = { lhs = "<localleader>orvr", desc = "resume a pending review for the current PR" }
            },
            review_thread = {
               goto_issue = { lhs = "<localleader>oig", desc = "navigate to a local repo issue" },
               add_comment = { lhs = "<localleader>oca", desc = "add comment" },
               add_suggestion = { lhs = "<localleader>ocs", desc = "add suggestion" },
               delete_comment = { lhs = "<localleader>ocd", desc = "delete comment" },
               next_comment = { lhs = "<localleader>ocn", desc = "go to next comment" },
               prev_comment = { lhs = "<localleader>ocp", desc = "go to previous comment" },
               select_next_entry = { lhs = "<localleader>oesn", desc = "move to next changed file" },
               select_prev_entry = { lhs = "<localleader>oesp", desc = "move to previous changed file" },
               select_first_entry = { lhs = "<localleader>oesf", desc = "move to first changed file" },
               select_last_entry = { lhs = "<localleader>oesl", desc = "move to last changed file" },
               close_review_tab = { lhs = "<localleader>orvt", desc = "close review tab" },
               react_hooray = { lhs = "<localleader>orry", desc = "add/remove 🎉 reaction" },
               react_heart = { lhs = "<localleader>orrh", desc = "add/remove ❤️ reaction" },
               react_eyes = { lhs = "<localleader>orri", desc = "add/remove 👀 reaction" },
               react_thumbs_up = { lhs = "<localleader>orru", desc = "add/remove 👍 reaction" },
               react_thumbs_down = { lhs = "<localleader>orrd", desc = "add/remove 👎 reaction" },
               react_rocket = { lhs = "<localleader>orrk", desc = "add/remove 🚀 reaction" },
               react_laugh = { lhs = "<localleader>orrl", desc = "add/remove 😄 reaction" },
               react_confused = { lhs = "<localleader>orrc", desc = "add/remove 😕 reaction" }
            },
            submit_win = {
               approve_review = { lhs = "<localleader>orva", desc = "approve review" },
               comment_review = { lhs = "<localleader>orvc", desc = "comment review" },
               request_changes = { lhs = "<localleader>oy", desc = "request changes review" },
               close_review_tab = { lhs = "<localleader>orvt", desc = "close review tab" }
            },
            review_diff = {
               submit_review = { lhs = "<localleader>orvs", desc = "submit review" },
               discard_review = { lhs = "<localleader>orvd", desc = "discard review" },
               add_review_comment = { lhs = "<localleader>orve", desc = "add a new review comment" },
               add_review_suggestion = { lhs = "<localleader>orvu", desc = "add a new review suggestion" },
               focus_files = { lhs = "<localleader>off", desc = "move focus to changed file panel" },
               toggle_files = { lhs = "<localleader>oft", desc = "hide/show changed files panel" },
               next_thread = { lhs = "<localleader>otn", desc = "move to next thread" },
               prev_thread = { lhs = "<localleader>otp", desc = "move to previous thread" },
               select_next_entry = { lhs = "<localleader>oesn", desc = "move to next changed file" },
               select_prev_entry = { lhs = "<localleader>oesp", desc = "move to previous changed file" },
               select_first_entry = { lhs = "<localleader>oesf", desc = "move to first changed file" },
               select_last_entry = { lhs = "<localleader>oesl", desc = "move to last changed file" },
               close_review_tab = { lhs = "<localleader>orvt", desc = "close review tab" },
               toggle_viewed = { lhs = "<localleader>ov", desc = "toggle viewer viewed state" },
               goto_file = { lhs = "<localleader>ofg", desc = "go to file" }
            },
            file_panel = {
               submit_review = { lhs = "<localleader>orvs", desc = "submit review" },
               discard_review = { lhs = "<localleader>orvd", desc = "discard review" },
               next_entry = { lhs = "<localleader>oen", desc = "move to next changed file" },
               prev_entry = { lhs = "<localleader>oep", desc = "move to previous changed file" },
               focus_files = { lhs = "<localleader>off", desc = "move focus to changed file panel" },
               toggle_files = { lhs = "<localleader>oft", desc = "hide/show changed files panel" },
               select_next_entry = { lhs = "<localleader>oesn", desc = "move to next changed file" },
               select_prev_entry = { lhs = "<localleader>oesp", desc = "move to previous changed file" },
               select_first_entry = { lhs = "<localleader>oesf", desc = "move to first changed file" },
               select_last_entry = { lhs = "<localleader>oesl", desc = "move to last changed file" },
               close_review_tab = { lhs = "<localleader>orvt", desc = "close review tab" },
               toggle_viewed = { lhs = "<localleader>ov", desc = "toggle viewer viewed state" }
            }
         }
      }
   }
}

