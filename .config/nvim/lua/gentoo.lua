#local DIR = "/home/neo/digital-journal/Gentoo"
local DIR = "/home/neo/digital-journal"
local TEMPLATE = "/home/neo/.config/nvim/templates/gentoo_note.md"


-- FUNCTIONS
-- change date in metadata fields
local function change_date(field, line_index)
  local buf = vim.api.nvim_get_current_buf()
  local current_date = os.date("%d.%m.%Y") 

  local lines = vim.api.nvim_buf_get_lines(buf, line_index, line_index + 1, false)

  if #lines == 0 then return end -- Early exit on empty file
  
  local line = lines[1]
  local new_line = field .. ": " .. current_date 

  -- Check if matches template value ("dd.mm.yyyy")
  if line:match("^" .. field .. ": dd%.mm%.yyyy$") then
    vim.api.nvim_buf_set_lines(buf, line_index, line_index + 1, false, {new_line})
    return
  end

  local date_pattern = "^" .. field .. ": (%d%d%.%d%d%.%d%d%d%d)$"
  local creation_date = line:match(date_pattern)
    
  -- if dates are different - update
  if creation_date and creation_date ~= current_date then
    vim.api.nvim_buf_set_lines(buf, line_index, line_index + 1, false, {new_line})
  end
end
-- keymaps for easy reference
local function set_reference_keymap(key, file)
    vim.api.nvim_set_keymap('n', '<Leader>r' .. key, ':e ' .. file .. '<CR>', {noremap = true, silent = true})
end
-- [Title | {Arch/Gentoo} Wiki](URL)
-- Examples:
-- url="https://wiki.gentoo.org/wiki/Wpa_supplicant" --> reference = "[Wpa_supplicant | Gentoo Wiki](https://wiki.gentoo.org/wiki/Wpa_supplicant)"
-- url="https://wiki.archlinux.org/title/Wpa_supplicant" --> reference = "[Wpa_supplicant | Arch Wiki](https://wiki.archlinux.org/title/Wpa_supplicant)"
function insert_web_reference()
  local url = vim.fn.input('Enter URL: ')
  local arch_wiki = "https://wiki.archlinux.org/title/"
  local gentoo_wiki = "https://wiki.gentoo.org/wiki/"

  local title = nil

  if string.sub(url, 1, #arch_wiki) == arch_wiki then
    title = url:match("title/(.+)") .. " | Arch Wiki"
  elseif string.sub(url, 1, #gentoo_wiki) == gentoo_wiki then
    title = url:match("wiki/(.+)") .. " | Gentoo Wiki"
  end

  if title then
    local reference = string.format("- [%s](%s)", title, url)
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, current_line, current_line + 1, false, {reference})
  end

  print("Invalid URL")
end


-- AUTOCOMMANDS
-- change "created" metadata-field on entering new buffer
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = DIR .. "/*.md",
  callback = function()
    vim.cmd('0r ' .. TEMPLATE)
    change_date("created", 1)
  end
})
-- change "updated" metadata-field on saving buffer to file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = DIR .. "/*.md",
    callback = function()
      change_date("updated", 2)
    end
})


-- KEYMAPS
set_reference_keymap('s', DIR .. "/standardization.md") -- rs (reference standardization)
set_reference_keymap('m', DIR .. "/metadata.md") -- rm (reference metadata)
vim.api.nvim_set_keymap('n', '<leader>ir', '<cmd>lua insert_web_reference()<CR>', {noremap = true, silent = true})
