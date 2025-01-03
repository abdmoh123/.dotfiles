return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  version = '*',
  config = true,
  opts = {
    shell = function()
      if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
        -- use pwsh if windows
        return 'pwsh -NoLogo'
      else
        -- use bash if linux
        return '/bin/bash'
      end
    end,
  },
  keys = {
    { '<C-t>s', '<CMD>ToggleTerm direction=horizontal<CR>', desc = 'Open [T]erminal' },
    { '<C-t>v', '<CMD>ToggleTerm direction=vertical<CR>', desc = 'Open [T]erminal [V]ertically' },
    { '<C-t>f', '<CMD>ToggleTerm direction=float<CR>', desc = 'Open [F]loating [T]erminal' },
    { '<C-t>t', '<CMD>ToggleTerm direction=tab<CR>', desc = 'Open [T]erminal in new [T]ab' },
    -- Exit terminal mode by double tapping escape
    -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
    -- or just use <C-\><C-n> to exit terminal mode
    { '<Esc><Esc>', '<C-\\><C-n>', mode = 't', desc = 'Exit terminal mode' },
  },
}
