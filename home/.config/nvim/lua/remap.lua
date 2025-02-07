vim.g.mapleader = " "

-- Map to wrap a word with double asterisks
vim.api.nvim_set_keymap('n', '<leader>b', '<esc>viw<esc>bi**<esc>ea**<esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>w', '<esc>viw<esc>bi*<esc>ea*<esc>', {noremap = true, silent = true})
