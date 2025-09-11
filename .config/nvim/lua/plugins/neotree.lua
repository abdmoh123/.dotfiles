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
        commands = {
          avante_add_files = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local relative_path = require('avante.utils').relative_path(filepath)

            local sidebar = require('avante').get()

            local open = sidebar:is_open()
            -- ensure avante sidebar is open
            if not open then
              require('avante.api').ask()
              sidebar = require('avante').get()
            end

            sidebar.file_selector:add_selected_file(relative_path)

            -- remove neo tree buffer
            if not open then
              sidebar.file_selector:remove_selected_file 'neo-tree filesystem [1]'
            end
          end,
        },
      },
      window = {
        mappings = {
          ['oa'] = 'avante_add_files',
        },
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
