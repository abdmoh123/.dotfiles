return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'InsertEnter',
  config = function()
    require('codeium').setup {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        idle_delay = 50, -- delay in ms before making a request
      },
    }
  end,
}
