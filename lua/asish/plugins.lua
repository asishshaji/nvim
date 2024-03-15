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
	use 'ellisonleao/gruvbox.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	-- cmp plugins
	use "hrsh7th/nvim-cmp"             
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	-- use "hrsh7th/cmp-nvim-Usp"

	-- lsp
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}


	use { "catppuccin/nvim", as = "catppuccin" }

	-- debuggers
	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-dap-python'
	use 'leoluz/nvim-dap-go'
	use 'theHamsta/nvim-dap-virtual-text'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use (
		'nvim-treesitter/nvim-treesitter', {run =':TSUpdate'}
	)
	use 'm4xshen/autoclose.nvim'
	use 'tanvirtin/monokai.nvim'
	-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
	
	use 'romgrk/barbar.nvim'
	use {
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
		end,
	}
	use {
		'cameron-wags/rainbow_csv.nvim',
		config = function()
			require 'rainbow_csv'.setup()
		end,
		-- optional lazy-loading below
		module = {
			'rainbow_csv',
			'rainbow_csv.fns'
		},
		ft = {
			'csv',
			'tsv',
			'csv_semicolon',
			'csv_whitespace',
			'csv_pipe',
			'rfc_csv',
			'rfc_semicolon'
		}
	}

	-- tests
	use "nvim-lua/plenary.nvim"
	use 'antoinemadec/FixCursorHold.nvim'

	-- git 
	use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
	use 'f-person/git-blame.nvim'
	use 'tanvirtin/vgit.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)



