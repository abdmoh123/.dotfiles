-- File: lua/plugins/jdtls.lua

-- Java LSP (Eclipse)
return {
  'mfussenegger/nvim-jdtls',
  dependencies = { 'mfussenegger/nvim-dap' },
  ft = { 'java', 'fxml' },
}
