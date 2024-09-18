--JMJ----------------------------------✝︎---------------------------------AMDG--
--                           PLUGIN: nvim-treesitter                         --
--                      Last Modified: 2024-09-12 18:46
-------------------------------------------------------------------------------

return {
   {
      'nvim-treesitter/nvim-treesitter',
      verdion = false,
      build = function()
         require('nvim-treesitter.install').update({ with_sync = true })()
      end,
      opts = {
         highlight = {
            enable = true,
         },
         ensure_installed = {
            'arduino',
            'astro',
            'authzed',
            'c',
            'cpp',
            'css',
            'csv',
            'diff',
            'dtd',
            'editorconfig',
            'git_config',
            'git_rebase',
            'gitattributes',
            'gitcommit',
            'gitigniore',
            'glimmer',
            'glimmer_javascript',
            'html',
            'http',
            'java',
            'javascript',
            'jsdoc',
            'json',
            'json5',
            'lua',
            'luadocs',
            'luap',
            'markdown',
            'mermaid',
            'meson',
            'muttrc',
            'ninja',
            'perl',
            'pod',
            'printf',
            'properties',
            'python',
            'query',
            'r',
            'regex',
            'robots',
            'ron',
            'rust',
            'scss',
            'sql',
            'openssh',
            'styled',
            'swift',
            'tmux',
            'todotxt',
            'toml',
            'vim',
            'vimdoc',
            'yaml',
         }
      }
   },
}

