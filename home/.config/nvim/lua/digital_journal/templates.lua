-- File: templates.lua
local M = {}

M.templates = {
  linux = "/home/neo/.config/nvim/templates/jrnl_linux.md",
  input = "/home/neo/.config/nvim/templates/jrnl_input.md",
}

function M.load_template(bufnr, template_type)
  local template_path = M.templates[template_type]
  if template_path then
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, vim.fn.readfile(template_path))
  else
    vim.notify("Template type '" .. template_type .. "' not found.", vim.log.levels.ERROR)
  end
end

return M

