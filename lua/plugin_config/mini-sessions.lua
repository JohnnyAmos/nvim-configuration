--[[ TODO: add comment header ]]--

local status_ok, mini_sessions = pcall(require, "mini-sessions")
if not status_ok then
  return
end

mini_sessions.setup({
   directory = vim.fn.stdpath('state') .. '/sessions',
   evaluate_single = true,
   items = {
      starter.sections.builtin_actions(),
      starter.sections.telescope(),
      starter.sections.sessions(5, true),
      {
         name = 'Todo',
         section = 'Quick Links',
         action = ':e ~/.todo.lua'
      }
   },
   content_hooks = {
      starter.gen_hook.adding_bullet('░ ☞  '),
      starter.gen_hook.indexing('all', {
         'Builtin actions',
         'Telescope'
      }),
      starter.gen_hook.aligning('center', 'center'),
   },
})

-- vim: set sts=3 sw=3 ts=3 tw=79:

