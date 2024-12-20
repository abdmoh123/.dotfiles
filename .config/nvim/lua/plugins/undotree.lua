return {
  'mbbill/undotree',
  cmd = { 'UndotreeFocus', 'UndotreeToggle', 'UndotreeShow', 'UndotreeHide', 'UndotreePersistUndo' },
  keys = {
    { '<leader>u', '<CMD>UndotreeToggle<CR>', desc = 'Reveal Undo tree', silent = true },
  },
}
