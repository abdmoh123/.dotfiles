return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
      preview = {
        win_config = {
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
      },
      mappings = {
        scrollU = '<C-u>',
        scrollD = '<C-d>',
      },
    }

    -- folding keybinds using ufo
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

    -- preview fold
    vim.keymap.set('n', 'zp', function()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Preview fold' })
  end,
}
