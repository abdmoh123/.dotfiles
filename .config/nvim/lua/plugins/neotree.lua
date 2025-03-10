-- File: lua/custom/plugins/neotree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = { 'Neotree' },
  opts = function(_, opts)
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require 'neo-tree.events'
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })

    return {
      source_selector = {
        winbar = false,
        statusline = false,
        separator = { left = '', right = '' },
      },
      filesystem = {
        group_empty_dirs = true,
      },
      buffers = {
        group_empty_dirs = true,
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
      nesting_rules = {
        ['xaml'] = { 'xaml.cs' },
        ['fxml'] = { 'java' },
        ['h'] = { 'c', 'cpp', 'cxx' },
        ['hpp'] = { 'cpp', 'cxx' },
        ['hxx'] = { 'cxx' },
      },
      popup_border_style = 'rounded',
    }
  end,
  keys = {
    { '<leader><Tab>', '<CMD>Neotree filesystem reveal left<CR>', desc = 'Reveal Explorer', silent = true },
  },
}
