-- File: web_reference.lua
local M = {}

function M.insert_web_reference()
  local url = vim.fn.input('Enter URL: ')
  if url == '' then
    vim.notify("No URL entered.", vim.log.levels.WARN)
    return
  end

  local patterns = {
    ["https://wiki%.archlinux%.org/title/(.+)"] = " | Arch Wiki",
    ["https://wiki%.gentoo%.org/wiki/(.+)"] = " | Gentoo Wiki",
    ["https://github%.com/(.+)"] = " | GitHub",
    ["https://wiki%.hyprland%.org/(.+)"] = " | Hyprland Wiki",
  }

  local title_found = false
  local title = ""

  for pattern, suffix in pairs(patterns) do
    local match = url:match(pattern)
    if match then
      title = match:gsub("_", " "):gsub("/", " > ") .. suffix
      title_found = true
      break
    end
  end

  if not title_found then
    vim.notify("Unsupported URL format.", vim.log.levels.ERROR)
    return
  end

  local reference = string.format("- [%s](%s)", title, url)
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, line_number, line_number, false, { reference })
end

return M

