local status_ok, mini_starter = pcall(require, "mini-starter")
if not status_ok then
  return
end

mini_starter.setup({
   evaluating_single = true,
   items = {
      {
         action = 'ene | startinsert',
         name = 'New File',
         section = 'Files'
      },
      {
         action = 'Telescope oldfiles',
         name = 'Recent Files',
         section = 'Files'
      },
      {
         action = 'Telescope find_files',
         name = 'Find Files',
         section = 'Files'
      },
      {
         action = 'Telescope file_browser',
         name = 'Browser',
         section = 'Files'
      },
      {
         action = 'Telescope live_grep',
         name = 'Live Grep',
         section = 'Search'
      },
      {
         action = 'Telescope command_history',
         name = 'Command History',
         section = 'Search'
      },
      {
         action = 'Pick visit_paths',
         name = 'Visited Paths',
         section = 'Search'
      },
      {
         action = 'Telescope repo list',
         name = 'Git Repos',
         section = 'Projects'
      },
      {
         action = 'starter.sections.sessions(5, true)',
         name = 'Sessions',
         section = 'Projects'
      },
      {
         action = "Telescope colorscheme",
         name = "Colorschemes",
         section = "Configuration"
      },
      {
         action = 'Telescopoe man_pages',
         name = 'Man Pages',
         section = 'Reference'
      },
      {
         action = 'Telescope help_tags',
         name = 'Help tags',
         section = 'Reference'
      },
      {
         action = "qa",
         name = "Quit",
         section = "Exit"
      },
   },
   content_hooks = {
      mini_starter.gen_hook.adding_bullet('░ ☞  '),
      starter.gen_hook.aligning("center", "center"),
   },
})


-- vim: set sts=3 sw=3 ts=3 tw=79:

