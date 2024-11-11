-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  event = 'BufReadPre',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'

    require('mason-nvim-dap').setup {
      automatic_installation = false,
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<S-F5>', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<F4>', dap.restart, { desc = 'Debug: Restart' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<A-b>', dap.toggle_breakpoint, { desc = 'Debug: Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader><A-B>', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set [B]reakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    local dapui_opts = {
      icons = { current_frame = '*' },
      layouts = {
        {
          position = 'left',
          size = 40,
          elements = {
            { id = 'scopes', size = 0.3 },
            { id = 'watches', size = 0.3 },
            { id = 'breakpoints', size = 0.2 },
          },
        },
        {
          position = 'right',
          size = 40,
          elements = {
            { id = 'stacks', size = 0.5 },
            { id = 'repl', size = 0.5 },
          },
        },
        {
          position = 'bottom',
          size = 10,
          elements = {
            { id = 'console', size = 1.0 },
          },
        },
      },
      controls = {
        element = 'console',
        enabled = true,
        icons = {
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '',
        },
      },
    }
    local dapui = require 'dapui'
    dapui.setup(dapui_opts)
    -- set breakpoint symbol
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-python').setup 'python'
  end,
}
