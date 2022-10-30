local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	-- EDITOR
	use 'windwp/nvim-autopairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-repeat'
	use 'pbrisbin/vim-mkdir'
	use 'RRethy/vim-illuminate'

	-- VISUAL
	use 'glepnir/dashboard-nvim'
	use 'TaDaa/vimade'
	use 'famiu/feline.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'nvim-telescope/telescope.nvim'
	use 'akinsho/bufferline.nvim'
	use 'Yggdroot/indentLine'
	use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'Mofiqul/dracula.nvim'
  use { 'nvim-lualine/lualine.nvim', require = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'ms-jpq/coq_nvim'

  use 'AmeerTaweel/todo.nvim'

  use {
    'folke/zen-mode.nvim', 
    config = function() 
      require('zen-mode').setup {
        window = {
          width = 510,
          height = 10,
          options = {
            relativenumber = false,
            number = false,
            cursorline = false,
            cursorcolumn = false
          }
        } 
      }
    end
  }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
