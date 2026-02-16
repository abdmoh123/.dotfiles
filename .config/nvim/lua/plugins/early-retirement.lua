return {
  'chrisgrieser/nvim-early-retirement', -- closes buffers after a period of inactivity
  event = 'BufReadPost',
  opts = {
    notificationOnAutoClose = true,
    retirementAgeMins = 20,
    deleteFunction = function(buf)
      require('snacks').bufdelete(buf)
    end,
  },
}
