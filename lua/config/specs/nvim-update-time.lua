--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Spec file: $HOME/.config/nvim/lua/config/specs/nvim-update-time
-- Plugin source: https://github.com/StonyBoy/nvim-update-time
-- Plugin license: None (EEEK!) (⚆ _ ⚆)
-- Last modified: 2024-09-26 21:30
-------------------------------------------------------------------------------


return {
   {
      'StonyBoy/nvim-update-time',
      opts = {
         last = 8,
         format = '%Y-%m-%d %H:%M',
         pattern = 'Last Modified: '
      }
   }
}

