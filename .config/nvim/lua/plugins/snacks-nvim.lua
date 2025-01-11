return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
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
    ---@class snacks.lazygit.Config: snacks.terminal.Opts
    ---@field args? string[]
    ---@field theme? snacks.lazygit.Theme
    lazygit = {
      configure = true,
      config = {
        -- WARNING: Will result in nested windows (workaround until nvim-remote stops freezing)
        os = { editPreset = 'nvim' },
        gui = {
          -- set to an empty string "" to disable icons
          nerdFontsVersion = '3',
        },
      },
    },
    quickfile = { enabled = true }, -- speeds up inputted file loading (e.g. nvim foo.txt)
    words = { enabled = true }, -- allow jumping between references of a symbol (e.g. variable)
    notifier = { -- prettier notifications
      timeout = 2500, -- 2.5s
      -- all notifications are stored in history
      level = vim.log.levels.TRACE,
      ---@type snacks.notifier.style
      style = 'compact',
    },
    styles = {
      notification = {
        ft = 'markdown',
        wo = { wrap = true }, -- Wrap notifications
      },
      notification_history = {
        border = 'rounded',
        ft = 'markdown',
        wo = {
          wrap = true, -- Wrap notifications
          colorcolumn = '',
          winhighlight = 'Normal:Normal,FloatBorder:Normal,FloatTitle:Normal',
        },
      },
    },
  },
  keys = {
    {
      '<leader>nd',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss notifications',
    },
    {
      '<leader>nh',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification history',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit()
      end,
      desc = 'Open Lazygit',
    },
    {
      '<leader>gB',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Get git blame details',
    },
    {
      '<leader>rf',
      function()
        Snacks.rename.rename_file()
      end,
      desc = '[R]ename [F]ile',
    },
    {
      ']r',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[r',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Previous Reference',
      mode = { 'n', 't' },
    },
    {
      '<leader>bx',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete current buffer',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- [[ Create some toggle mappings ]]

        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'

        Snacks.toggle.diagnostics():map '<leader>td'
        Snacks.toggle.treesitter():map '<leader>tT' -- treesitter highlighting
        Snacks.toggle.inlay_hints():map '<leader>th' -- example 'func([str: ]"hello");' inlay_hint = in square brackets

        -- toggle between dark and light background
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tb'
        -- toggle scope dimming feature (e.g. only current function is highlighted)
        Snacks.toggle.dim():map '<leader>tD'
      end,
    })
  end,
}
