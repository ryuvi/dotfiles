require 'settings'
require 'plugins'

vim.api.nvim_create_autocmd('BufWritePost', { 
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }), 
  pattern = 'plugins.lua', command = 'source <afile> | PackerCompile', 
})

--vim.api.nvim_create_autocmd('BufWritePost', {
--  group = vim.api.nvim_create_augroup('INST', { clear = true }),
--  pattern = 'plugins.lua', command = 'source <afile> | PackerInstall',
--})

--vim.api.nvim_create_autocmd('BufWritePost', {
--  group = vim.api.nvim_create_augroup('SYNC', { clear = true }),
--  pattern = 'plugins.lua', command = 'source <afile> | PackerSync',
--})

