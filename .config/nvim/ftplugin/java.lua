-- File: lua/ftplugin/java.lua

local jdtls_bin = vim.fn.stdpath 'data' .. '\\mason\\bin\\jdtls.cmd'

local config = {
  cmd = { jdtls_bin }, -- Windows only
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

  settings = {
    java = {},
  },

  init_options = {
    bundles = {},
  },
}
require('jdtls').start_or_attach(config)
