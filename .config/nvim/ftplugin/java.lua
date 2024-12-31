-- File: lua/ftplugin/java.lua

local function get_jdtls_path()
  -- returns path using windows back slashes if required
  if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
    return vim.fn.stdpath 'data' .. '\\mason\\bin\\jdtls.cmd'
  else
    return vim.fn.stdpath 'data' .. '/mason/bin/jdtls'
  end
end

local config = {
  cmd = { get_jdtls_path() },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

  settings = {
    java = {},
  },

  init_options = {
    bundles = {
      -- setup java-debug debugger
      vim.fn.glob('~/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', true),
    },
  },
}
require('jdtls').start_or_attach(config)
