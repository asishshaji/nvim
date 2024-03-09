vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
	filters = {
		git_ignored = false,
		exclude = {"venv"}
	}
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<c-b>', ':NvimTreeFocus<CR>')
