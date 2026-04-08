-- File: lua/plugins/diffview.lua

-- Plugin for easy diff viewing (side-by-side)
return {
  'sindrets/diffview.nvim',
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewFileHistory',
    'DiffviewLog',
    'DiffviewRefresh',
  },
  event = 'BufReadPre',
}
