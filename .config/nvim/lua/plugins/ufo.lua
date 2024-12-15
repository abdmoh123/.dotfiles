return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = { 'VimEnter' }, -- BufReadPre causes errors sometimes
  config = function()
    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    require('ufo').setup {
      provider_selector = function(
        _ --[[ bufnr ]],
        _ --[[ filetype ]],
        _ --[[ buftype ]]
      )
        return { 'lsp', 'indent' }
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
