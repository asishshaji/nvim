local dap, dapui = require("dap"), require("dapui")

dapui.setup()
vim.keymap.set('n', '<leader>dt', 
function() 
	dapui.toggle() 
	vim.cmd('NvimTreeClose')
end)


-- Define a function to add the current hovered element to watch
local function add_hovered_element_to_watch()
    -- Get the current line number and column number
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local col = vim.api.nvim_win_get_cursor(0)[2]

    -- Get the text under the cursor
    local text_under_cursor = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]

    -- Extract the variable name at the cursor position
    local variable_name = string.match(text_under_cursor, "[%w_]+", col)

    -- Add the variable to watch
    if variable_name then
        dapui.elements.watches.add(variable_name)
    end
end

-- Set a key mapping to call the function
vim.keymap.set('n', '<leader>wh', function() add_hovered_element_to_watch() end)
