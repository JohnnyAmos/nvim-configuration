--JMJ----------------------------------✝︎---------------------------------AMDG--
--                      nvim keymap configuration file                       --
--                      Last Modified: 2024-09-28 00:43
-------------------------------------------------------------------------------

local wk = require("which-key")

wk.add({

   -- Command/subject group assignments.
   -- (Plugin-specific groups are assigned in their individual sections.)
   { "<leader>b", group = "Buffers" },
   { "<leader>c", group = "Comments" },
   { "<leader>f", group = "Files" },
   { "<leader>t", group = "Text" },

   -- General keymaps are configured in the core file.
   require("config.maps.maps-core")

   -- Plugin-specific keymaps are configured in individual files.
   require("config.maps.maps-edgy")
   require("config.maps.maps-mini")
   require("config.maps.maps-nvim-comment-frame")
   require("config.maps.maps-nvim-treesitter-textobjects")
   require("config.maps.maps-telescope")
   require("config.maps.maps-todo-comments")
   require("config.maps.maps-trouble")
   require("config.maps.maps-yanky")

   -- This all makes for easier debugging.

})

