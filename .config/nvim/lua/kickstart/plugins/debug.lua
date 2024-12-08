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
  event = 'BufReadPost',
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
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<F4>',
      function()
        require('dap').step_back()
      end,
      desc = 'Debug: Step back',
    },
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<C-F5>',
      function()
        require('dap').pause()
      end,
      desc = 'Debug: Pause',
    },
    {
      '<S-F5>',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<A-F5>',
      function()
        require('dap').restart()
      end,
      desc = 'Debug: Restart',
    },
    {
      '<F6>',
      function()
        require('dap').disconnect()
      end,
      desc = 'Debug: Disconnect/Detach',
    },
    {
      '<F7>',
      function()
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
    {
      '<A-b>',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<A-B>',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
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
        'debugpy',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    local dapui_opts = {
      icons = { expanded = '', collapsed = '', current_frame = '*' },
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
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          play = '',
          pause = '',
          terminate = '',
          restart = '',
          disconnect = '',
        },
      },
    }
    local dapui = require 'dapui'
    dapui.setup(dapui_opts)

    -- Change breakpoint icons (fallbacks to hardcoded values)
    -- set colours for icons
    local red = string.format('#%06x', vim.api.nvim_get_hl_by_name('red', true).foreground) or '#e51400'
    local yellow = string.format('#%06x', vim.api.nvim_get_hl_by_name('yellow', true).foreground) or '#ffcc00'
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = red }) -- breakpoint icon colours
    vim.api.nvim_set_hl(0, 'DapStop', { fg = yellow }) -- arrow when program stops at breakpoint
    -- set what icons to use
    local breakpoint_icons = vim.g.have_nerd_font
      and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install python specific config
    require('dap-python').setup 'python'
  end,
}
