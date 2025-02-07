-- File: metadata.lua
local M = {}

function M.update_date(field, line_index)
  local bufnr = vim.api.nvim_get_current_buf()
  local current_date = os.date("%d.%m.%Y")

  local lines = vim.api.nvim_buf_get_lines(bufnr, line_index, line_index + 1, false)
  if #lines == 0 then return end

  local line = lines[1]
  local new_line = field .. ": " .. current_date

  if line:match("^" .. field .. ":.*") then
    vim.api.nvim_buf_set_lines(bufnr, line_index, line_index + 1, false, { new_line })
  end
end

return M

