-- File: lua/kickstart/plugins/todo-comments.lua

-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
