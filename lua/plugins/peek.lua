--JMJ--------------------------------------------------------------------AMDG--
--                            PLUGIN: [name]                                 --
--                      Last Modified: 2024-09-11 23:21
-------------------------------------------------------------------------------

return {
   {
      "toppair/peek.nvim",
      event = { "VeryLazy" },
      build = "deno task --quiet build:fast",
      config = function()
         require("peek").setup()
      end,
   },
}

