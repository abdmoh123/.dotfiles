return {
  'goolord/alpha-nvim',
  config = function()
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

    -- display things to do
    dashboard.section.buttons.val = {
      dashboard.button('e', '󰈔  New file', '<cmd>ene <CR>'),
      dashboard.button('SPC s f', '󰱼  Find file'),
      dashboard.button('SPC s .', '󰋚  Recently opened files'),
      dashboard.button('SPC s F', '󰑖  Frecency/MRU'),
      dashboard.button('SPC s g', '󰦨  Find word (ripgrep)'),
      dashboard.button('SPC h', '󰃀  View harpoon bookmarks'),
      dashboard.button('?', '󰋗  Neovim help', ':h nvim<CR>'),
      dashboard.button('q', '󰅙  Quit Neovim', ':qa<CR>'),
    }

    -- display neovim version at the bottom
    local version_str = 'v' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
    dashboard.section.footer.val = version_str

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
