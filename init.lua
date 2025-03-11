-- ╔═JMJ═══════════════════════════╡  ✞  ╞════════════════════════════AMDG═╗ --
-- ║                  Neovim configuration for Mac/unix                    ║ --
-- ║                        (Mac now, unix soon.)                          ║ --
-- ╚═══════════════════════════════════════════════════════════════════════╝ --
--                                              Last modified: 2025-03-10 15:28

vim.loader.enable()

require("config.options")
require("config.lazy")
require("config.autocommands")
require("config.keymaps")

--[[

   WARNING: This is a complete mess of several incomplete implementations being
   melded together to make an efficient and extensive nvim configuration
   that works for my particular and peculiar needs. The cheese is being
   moved on the regular. The maze walls are want to dissappear, which is a
   good thing, but so are the floors, so watch your step.


      TODO: Continue configuration of nvim.

      - Move plugin specifications to their own files. Only one-liners should
        stay in init.lua.
      - Add fortune code to footer of startup screen and integrate fortune
        plugin.

      Keymaps:

         -  Finish maps for nvim-various-textobjects.
         -  Add keymaps to replace option-up & option-down for which-key.nvim.
         -  The <c-s> map for flash.nvim makes no sense. Make it make sense.
         -  Arrange core maps as close to asciibetical (or utf-8) order as
            possible.
         -  Move trouble.nvim maps from plugin spec to keymaps.lua.
         -  Get all the keymaps out of specs and with the rest of the maps if
            it means modifying source code and submitting pull requests.

      Plugins in need of configuration:

         -  edgy.nvim:
            -  Change config to new terminal plugin.
         -  gitsigns.nvim:
            -  Set proper keymaps.
            -  Current keymaps are temporary.
         -  telescope.nvim:
            -  Move border icons to icon section.
            -  Consider furthur configuration options.
            -  Explore other extensions.
            -  Determine the best possible options for the extensions.
         -  todo-comments.nvim:
            -  Multiline needs fixed.
            -  Needs better patterns - pcre2?
         -  toggleterm.nvim:
            -  change, or not
         -  yanky.nvim:
            -  There are eleven yanky `put` keymap commands set. There are a
               total of eighty-four commands available. Determine if there is a
               need for any of the others, or if any of the currently set maps
               are unnecessary. Although, writing eighty-four keymaps that may
               never be used could be lots of fun (for somebody).

      Make with the abbreviations:

         -  https://github.com/tpope/vim-abolish
         -  https://github.com/0styx0/abbreinder.nvim
         -  https://github.com/0styx0/abbremand.nvim
         -  Consider other plugins/solutions.

]]

-- ╞══════════════════════════════╡  finis  ╞══════════════════════════════╡ --
