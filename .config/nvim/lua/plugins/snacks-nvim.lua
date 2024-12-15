return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    bigfile = {
      notify = true,
      size = 50.0 * 1024 * 1024, -- 20MB
      ---@param ctx {buf: number, ft: string}
      setup = function(ctx)
        vim.cmd [[NoMatchParen]]
        Snacks.util.wo(0, { foldmethod = 'manual', spell = false, statuscolumn = '', conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ctx.ft
        end)
        vim.cmd 'UfoDetach'
        vim.cmd 'Gitsigns detach'
        vim.cmd 'set norelativenumber'
        vim.cmd 'syntax off'
        vim.cmd 'TSBufDisable highlight'
        vim.cmd 'TSBufDisable incremental_selection'
        vim.cmd 'TSBufDisable indent'
      end,
    },
    -- sets lazygit colorscheme to match neovim's
    lazygit = { enabled = true },
    -- speeds up file loading (e.g. nvim foo.txt)
    quickfile = { enabled = true },
  },
}
