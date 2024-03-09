vim.g.mapleader = " "
vim.keymap.set("n", "<C-t>", function() require("neotest").run.run() end, opts)
vim.keymap.set("n", "<C-d-t>", function() require("neotest").run.run({strategy = "dap"}) end, opts)
vim.keymap.set("n", "<C-d-t-s>", function() require("neotest").run.stop() end, opts)



vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)

