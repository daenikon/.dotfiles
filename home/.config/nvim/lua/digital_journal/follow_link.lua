-- File: follow_link.lua
local M = {}

function M.open_link_under_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1 -- 0-based indexing

  -- Get the line under the cursor
  local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
  if not line or line == '' then
    vim.notify("No line under cursor.", vim.log.levels.WARN)
    return
  end

  local url = nil

  -- Patterns to match Markdown links
  local markdown_link_pattern = "^%s*[-*]%s*%[.-%]%((.-)%)"
  local markdown_link_pattern_nested = "^%s*[-*]%s*%[.-%]%s*:%s*(.-)%s*$" -- For definition-style links

  -- Attempt to match Markdown link patterns
  url = line:match(markdown_link_pattern) or line:match(markdown_link_pattern_nested)

  -- If no URL from pattern, check the word under the cursor
  if not url then
    local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
    local line_before_cursor = line:sub(1, cursor_col)
    local line_after_cursor = line:sub(cursor_col + 1)

    -- Find the start of the URL
    local start_pos = line_before_cursor:find("https?://[^%s%]%)]+$") or 1
    -- Find the end of the URL
    local end_pos = line_after_cursor:find("[%s%)%]]") or #line_after_cursor
    end_pos = end_pos + cursor_col

    url = line:sub(start_pos, end_pos)
    -- Validate the URL
    if not url:match("^https?://") then
      url = nil
    end
  end

  if url then
    -- Open the URL in the default web browser
    vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
    vim.notify("Opening URL: " .. url)
  else
    vim.notify("No URL found under cursor.", vim.log.levels.WARN)
  end
end

return M

