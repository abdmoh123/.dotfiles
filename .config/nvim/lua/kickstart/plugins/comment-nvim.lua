-- File: lua/kickstart/plugins/comment-nvim.lua

-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--    require('Comment').setup({})

-- Make commenting out code easier e.g. "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  opts = {},
}
