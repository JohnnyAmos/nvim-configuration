----------------------------------------------------------------------
--                     nvim initialization file                     --
--                 Last Modified: 2024-09-09 12:57
----------------------------------------------------------------------

vim.loader.enable()

require('config/options')
require('config/keymaps')
require('config/autocmds')
require('config/lazy')

-- vim: set sts=3 sw=3 ts=3 tw=79:

