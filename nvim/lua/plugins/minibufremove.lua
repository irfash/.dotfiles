return {
  {
    'echasnovski/mini.bufremove',
    opts = {},
    keys = {
      {
        '<leader>bd',
        function()
          require('mini.bufremove').delete(0, false)
        end,
        desc = 'Delete current buffer',
      },
    },
  },
}
