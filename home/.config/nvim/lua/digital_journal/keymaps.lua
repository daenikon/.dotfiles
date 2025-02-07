-- File: keymaps.lua
local M = {}

function M.set_reference_keymap(key, file)
  vim.api.nvim_set_keymap('n', '<Leader>r' .. key, ':e ' .. vim.fn.fnameescape(file) .. '<CR>', { noremap = true, silent = true })
end

function M.setup()
  M.set_reference_keymap('s', "/home/neo/digital-journal/standardization.md")
  M.set_reference_keymap('m', "/home/neo/digital-journal/metadata.md")
end

return M

