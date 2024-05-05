-- located in lua/ directory
require("set")
require("remap")
require("lazy_init")
require("gentoo")

-- Syntax highlight for Gentoo (/etc/portage) files
vim.opt.rtp:append('/usr/share/vim/vimfiles')
-- Colorscheme
vim.cmd[[colorscheme tokyonight-night]]
