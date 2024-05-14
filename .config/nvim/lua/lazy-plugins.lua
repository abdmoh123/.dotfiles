-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Make commenting out code easier
  require 'kickstart.plugins.comment-nvim',
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'kickstart.plugins.gitsigns',
  -- Useful plugin to show you pending keybinds.
  require 'kickstart.plugins.which-key',
  -- Fuzzy Finder (files, lsp, etc)
  require 'kickstart.plugins.telescope',
  -- LSP Configuration & Plugins
  require 'kickstart.plugins.lspconfig',
  -- Autoformat
  require 'kickstart.plugins.conform',
  -- Autocompletion
  require 'kickstart.plugins.nvim-comp',
  -- Highlight todo, notes, etc in comments
  require 'kickstart.plugins.todo-comments',
  -- Collection of various small independent plugins/modules
  require 'kickstart.plugins.mini',
  -- Highlight, edit, and navigate code
  require 'kickstart.plugins.treesitter',

  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',

  -- Import all custom themes (e.g. gruvbox-material)
  require 'themes',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  -- Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- import all lazy.nvim plugins (lua/plugins directory)
  { import = 'plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Set default theme to gruvbox-material
vim.cmd.colorscheme 'gruvbox-material'
vim.cmd.hi 'Comment gui=none'
