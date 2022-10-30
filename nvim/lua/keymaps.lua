local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

set('n', ';', ':', { noremap = true })

set('n', '<space>h', ':<C-u>split<CR>', ns)
set('n', '<space>v', ':<C-u>vsplit<CR>', ns)
