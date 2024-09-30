--JMJ----------------------------------✝︎---------------------------------AMDG--
--    Neovim configuration for Mac/Unix
--    Module: $HOME/.config/nvim/lua/config/modules/nvim-treesitter-textobjects.lua
--    Plugin source: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--    Last modified: 2024-09-29 11:44
-------------------------------------------------------------------------------


local M = {}

function M.keys()

   local ok, wk = pcall(require, "which-key")
   if not ok then
      return
   end

   wk.add({

      { "<leader>to", desc = "Text objects" },

      -- Select
      { "<leader>tos", desc = "Select…"},

      -- Select > Assignment
      { "<leader>tosa", desc = "Select > Assignment…"},
      {
         "<leader>tosai",
         "<cmd>TSTextobjectSelect @assignment.inner<cr>",
         desc = "Select inner part of an assignment"
      },
      {
         "<leader>tosao",
         "<cmd>TSTextobjectSelect @assignment.nuter<cr>",
         desc = "Select outer part of an assignment"
      },
      {
         "<leader>tosal",
         "<cmd>TSTextobjectSelect @assignment.lhs<cr>",
         desc = "Select left hand side of an assignment"
      },
      {
         "<leader>tosar",
         "<cmd>TSTextobjectSelect @assignment.rhs<cr>",
         desc = "Select right hand side of an assignment"
      },

      -- Select > Class
      { "<leader>tosc", desc = "Select > Class…"},
      {
         "<leader>tosci",
         "<cmd>TSTextobjectSelect @class.inner<cr>",
         desc = "Select inner part of a class"
      },
      {
         "<leader>tosco",
         "<cmd>TSTextobjectSelect @class.outer<cr>",
         desc = "Select outer part of a class"
      },

      -- Select > Function call
      { "<leader>tosf", desc = "Select > Function call…"},
      {
         "<leader>tosfi",
         "<cmd>TSTextobjectSelect @call.inner<cr>",
         desc = "Select inner part of a function call"
      },
      {
         "<leader>tosfo",
         "<cmd>TSTextobjectSelect @call.outer<cr>",
         desc = "Select outer part of a function call"
      },

      -- Select > Loop
      { "<leader>tosl", desc = "Select > Loop…" },
      {
         "<leader>tosli",
         "<cmd>TSTextobjectSelect @loop.inner<cr>",
         desc = "Select inner part of a loop"
      },
      {
         "<leader>toslo",
         "<cmd>TSTextobjectSelect @loop.outer<cr>",
         desc = "Select outer part of a loop"
      },

      -- Select > Method/function
      { "<leader>tosm", desc = "Select > Method/function…" },
      {
         "<leader>tosmi",
         "<cmd>TSTextobjectSelect @function.inner<cr>",
         desc = "Select inner part of a method/function definition"
      },
      {
         "<leader>tosmo",
         "<cmd>TSTextobjectSelect @function.outer<cr>",
         desc = "Select outer part of a method/function definition"
      },

      -- Select > Conditional
      { "<leader>toso", desc = "Select > Conditional…" },
      {
         "<leader>tosoi",
         "<cmd>TSTextobjectSelect @conditional.inner<cr>",
         desc = "Select inner part of a conditional"
      },
      {
         "<leader>tosoo",
         "<cmd>TSTextobjectSelect @conditional.outer<cr>",
         desc = "Select outer part of a conditional"
      },

      -- Select > Parameter/argument
      { "<leader>tosp", desc = "Select > Parameter/argument…" },
      {
         "<leader>tospi",
         "<cmd>TSTextobjectSelect @parameter.inner<cr>",
         desc = "Select inner part of a parameter/argument"
      },
      {
         "<leader>tospo",
         "<cmd>TSTextobjectSelect @parameter.outer<cr>",
         desc = "Select outer part of a parameter/argument"
      },

      -- Swap
      { "<leader>tow", desc = "Swap…" },
      {
         "<leader>town",
         "<cmd>TSTextobjectSwapNext<cr>",
         desc = "Swap next"
      },
      {
         "<leader>towp",
         "<cmd>TSTextobjectSwapPrevious<cr>",
         desc = "Swap previous"
      },

      -- Move
      { "<leader>tom", desc = "Move…"},

      -- Move > Class
      { "<leader>tomc", desc = "Move > Class…"},

      -- Move > Class > Next
      { "<leader>tomcn", desc = "Move > Class > Next" },
      {
         "<leader>tomcne",
         "<cmd>TSTextobjectGotoNextEnd class.outer<cr>",
         desc = "Next class end"
      },
      {
         "<leader>tomcns",
         "<cmd>TSTextobjectGotoNextStart class.outer<cr>",
         desc = "Next class start"
      },

      -- Move > Class > Previous
      { "<leader>tomcp", desc = "Move > Class > Previous" },
      {
         "<leader>tomcpe",
         "<cmd>TSTextobjectGotoPreviousEnd class.outer<cr>",
         desc = "Prev class end"
      },
      {
         "<leader>tomcps",
         "<cmd>TSTextobjectGotoPreviousStart class.outer<cr>",
         desc = "Prev class start"
      },

      -- Move > Function call
      { "<leader>tomf", desc = "Move > Function call…"},

      --  Move > Function call > Next
      { "<leader>tomfn", desc = "Move > Function call > Next" },
      {
         "<leader>tomfne",
         "<cmd>TSTextobjectGotoNextEnd call.outer<cr>",
         desc = "Next function call end"
      },
      {
         "<leader>tomfns",
         "<cmd>TSTextobjectGotoNextStart call.outer<cr>",
         desc = "Next function call start"
      },

      -- Move > Function call > Previous
      { "<leader>tomfp", desc = "Move > Function call > Previous" },
      {
         "<leader>tomfpe",
         "<cmd>TSTextobjectGotoPreviousEnd call.outer<cr>",
         desc = "Prev function call end"
      },
      {
         "<leader>tomfps",
         "<cmd>TSTextobjectGotoPreviousStart call.outer<cr>",
         desc = "Prev function call start"
      },

      -- Move > Method/function
      { "<leader>tomm", desc = "Move > Method/function…" },

      -- Move > Method/function > Next
      { "<leader>tommn", desc = "Move > Method/function > Next" },
      {
         "<leader>tommne",
         "<cmd>TSTextobjectGotoNextEnd function.outer<cr>",
         desc = "Next method/function def end"
      },
      {
         "<leader>tommns",
         "<cmd>TSTextobjectGotoNextStart function.outer<cr>",
         desc = "Next method/function definition start"
      },

      -- Move > Method/function > Previous
      { "<leader>tommp", desc = "Move > Method/function > Previous" },
      {
         "<leader>tommpe",
         "<cmd>TSTextobjectGotoPreviousEnd function.outer<cr>",
         desc = "Prev method/function def end"
      },
      {
         "<leader>tommps",
         "<cmd>TSTextobjectGotoPreviousStart function.outer<cr>",
         desc = "Prev method/function def start"
      },

      -- Move > Conditional
      { "<leader>tomo", desc = "Move > Conditional…" },

      -- Move > Conditional > Next
      { "<leader>tomon", desc = "Move > Conditional > Next" },
      {
         "<leader>tomone",
         "<cmd>TSTextobjectGotoNextEnd conditional.outer<cr>",
         desc = "Next conditional end"
      },
      {
         "<leader>tomons",
         "<cmd>TSTextobjectGotoNextStart conditional.outer<cr>",
         desc = "Next conditional start"
      },

      -- Move > Conditional > Previous
      { "<leader>tomop", desc = "Move > Conditional > Previous" },
      {
         "<leader>tomope",
         "<cmd>TSTextobjectGotoPreviousEnd conditional.outer<cr>",
         desc = "Prev conditional end"
      },
      {
         "<leader>tomops",
         "<cmd>TSTextobjectGotoPreviousStart conditional.outer<cr>",
         desc = "Prev conditional start"
      },

      -- Move > Loop
      { "<leader>toml", desc = "Move > Loop…" },

      -- Move > Loop > Next
      { "<leader>tomln", desc = "Move > Loop > Next" },
      {
         "<leader>tomlne",
         "<cmd>TSTextobjectGotoNextEnd loop.outer<cr>",
         desc = "Next loop end"
      },
      {
         "<leader>tomlns",
         "<cmd>TSTextobjectGotoNextStart loop.outer<cr>",
         desc = "Next loop start"
      },

      -- Move > Loop > Previous
      { "<leader>tomlp", desc = "Move > Loop > Previous" },
      {
         "<leader>tomlpe",
         "<cmd>TSTextobjectGotoPreviousEnd loop.outer<cr>",
         desc = "Prev loop end"
      },
      {
         "<leader>tomlps",
         "<cmd>TSTextobjectGotoPreviousStart loop.outer<cr>",
         desc = "Prev loop start"
      },

   })

end

return M

