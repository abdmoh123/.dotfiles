return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    delete_to_trash = true,
    watch_for_changes = true,
    preview_win = {
      update_on_cursor_moved = true,
      preview_method = 'fast_scratch',
      disable_preview = function(filename)
        local binary_regexes = { '.*.exe', '.*.deb', '.*.rpm', '.*.zip', '.*.tar', '.*.gz', '.*.7z' }
        -- disables preview on any binary files (listed above)
        for regex in binary_regexes do
          if filename:match(regex) then
            return true
          end
        end
        -- allows preview otherwise
        return false
      end,
    },
  },
  keys = {
    {
      '<leader>-',
      ':Oil<CR>',
      desc = 'Open directory in oil.nvim',
    },
  },
}
