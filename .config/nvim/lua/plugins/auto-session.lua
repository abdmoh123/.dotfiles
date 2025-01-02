return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    use_git_branch = true,
    suppressed_dirs = {
      '/',
      '~/',
      '~/Documents',
      '~/OneDrive',
      '~/OneDrive/Documents/',
      '~/Downloads',
    },
    mappings = {
      -- on both insert and normal modes
      delete_session = { { 'i', 'n' }, '<C-D>' },
      alternate_session = { { 'i', 'n' }, '<C-S>' },
      copy_session = { { 'i', 'n' }, '<C-Y>' },
    },
  },
}
