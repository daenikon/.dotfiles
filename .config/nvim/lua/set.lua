local options = {
  -- must-have
  number = true,
  relativenumber = true,
  swapfile = false,
  termguicolors = true,
  smartindent = true,
  -- 4-spaced indentation
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  -- misc
  scrolloff = 16,
  signcolumn = "yes",
  --concealcursor = "nc",
  wrap = false,
    
  -- dots for tabs and spaces
  list = true,
  listchars = {
    --lead = '·',
    lead = '⋅',
    tab = '<->'
  },
}

for k, v in pairs (options) do
  vim.opt[k] = v
end
