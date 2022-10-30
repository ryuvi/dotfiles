local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

opt.compatible = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
opt.conceallevel = 0
opt.colorcolumn = '80'
opt.cursorline = true
opt.cursorcolumn = true
opt.scrolloff = 10
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.shortmess:append {c = true}
opt.syntax = 'on'
opt.filetype = 'on'
opt.filetype.plugin = 'on'
opt.filetype.indent = 'on'



cmd[[colorscheme dracula]]

require('lualine').setup {
  options = {
   theme = 'dracula-nvim'
  }
}
