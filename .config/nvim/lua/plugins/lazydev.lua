return {
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  'folke/lazydev.nvim',
  ft = 'lua',
  cmd = 'LazyDev',
  opts = {
    dependencies = {
      -- Manage libuv types with lazy. Plugin will never be loaded
      { 'Bilal2453/luvit-meta', lazy = true },
    },
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      { path = 'snacks.nvim', words = { 'Snacks' } },
      { path = 'lazy.nvim', words = { 'LazyNvim' } },
    },
  },
}
