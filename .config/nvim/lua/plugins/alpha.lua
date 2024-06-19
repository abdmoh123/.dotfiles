return {
  'goolord/alpha-nvim',
  config = function()
    -- require('alpha').setup(require('alpha.themes.dashboard').config)

    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', '<cmd>ene <CR>'),
      dashboard.button('SPC s f', '󰈞  Find file'),
      dashboard.button('SPC s .', '󰊄  Recently opened files'),
      -- dashboard.button('SPC s F', '  Frecency/MRU'),
      dashboard.button('SPC s g', '󰈬  Find word (ripgrep)'),
      dashboard.button('SPC h', '  View harpoon bookmarks'),
      dashboard.button('q', '󰅚  Quit Neovim', ':qa<CR>'),
    }
    local handle = io.popen 'fortune'
    local fortune = handle:read '*a'
    handle:close()
    dashboard.section.footer.val = fortune

    dashboard.config.opts.noautocmd = true

    vim.cmd [[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end,
}
