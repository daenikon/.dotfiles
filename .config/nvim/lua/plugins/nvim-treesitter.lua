return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({

      ensure_installed = { "c", "lua", "python", "markdown", "markdown_inline", "yaml", "dockerfile" },

      sync_install = false,

      -- needs `dev-utils/tree-sitter-cli` (Gentoo)
      auto_install = true,

      highlight = {
        enable = true,

        disable = { "markdown" },

        disable = function(lang, buf)
          local max_filesize = 256 * 1024 -- 256 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
        end,
      },

      indent = { enable = true },

      additional_vim_regex_highlighting = false,
    })
  end
}
