local theme_manager = require 'themes'

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
  -- Import all custom themes (e.g. gruvbox-material)
  theme_manager.themes,

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  -- Uncomment the following line and add your plugins to `lua/plugins/*.lua` to get going.
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

-- set the theme
theme_manager.init()
