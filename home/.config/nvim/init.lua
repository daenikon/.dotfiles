







vim.g.mapleader = " ";

require("lazy_init")

-- testing
require("denikon");


-- located in lua/ directory
require("set")
require("remap")
require("digital_journal.journal").setup()

-- Syntax highlight for Gentoo (/etc/portage) files
vim.opt.rtp:append('/usr/share/vim/vimfiles')
-- Colorscheme
vim.cmd[[colorscheme tokyonight-night]]


---
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
