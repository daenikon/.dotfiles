-- File: journal.lua
local templates = require('digital_journal.templates')
local metadata = require('digital_journal.metadata')
local keymaps = require('digital_journal.keymaps')
local web_reference = require('digital_journal.web_reference')
local follow_link = require('digital_journal.follow_link')

local M = {}

function M.setup()
  -- Set up keymaps
  keymaps.setup()

  -- Keymap to open link under cursor
  vim.api.nvim_set_keymap('n', '<Leader>ol', '<cmd>lua require("digital_journal.follow_link").open_link_under_cursor()<CR>', { noremap = true, silent = true })
  -- Keymap to insert web reference
  vim.api.nvim_set_keymap('n', '<leader>ir', '<cmd>lua require("digital_journal.web_reference").insert_web_reference()<CR>', { noremap = true, silent = true })

  -- Autocommands for new files in Linux and Input directories
  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "/home/neo/digital-journal/Linux/*.md",
    callback = function()
      templates.load_template(0, 'linux')
      metadata.update_date("created", 1)
    end,
  })

  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "/home/neo/digital-journal/Input/*.md",
    callback = function()
      templates.load_template(0, 'input')
      metadata.update_date("created", 1)
    end,
  })

  -- Autocommand to update 'updated' metadata on file save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "/home/neo/digital-journal/*.md",
    callback = function()
      metadata.update_date("updated", 2)
    end,
  })
end

return M

