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
}
