local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>cf', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>gcf', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gbf', builtin.git_branches, {})
vim.keymap.set('n', '<leader>O', builtin.treesitter, {})

function fuzzyFindFiles()
  builtin.grep_string({
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  })
end

vim.keymap.set('n', '<leader>ps', '<cmd>lua fuzzyFindFiles{}<cr>', {}) -- map whatever you want, I use ctrl-g
