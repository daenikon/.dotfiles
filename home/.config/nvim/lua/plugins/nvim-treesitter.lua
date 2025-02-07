return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({

      ensure_installed = { "c", "bash", "java", "lua", "python", "markdown", "markdown_inline", "yaml", "dockerfile", "rust" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- needs `dev-utils/tree-sitter-cli` (Gentoo)
      auto_install = false,

      highlight = {
        enable = true,

        -- disable = { "markdown" },

        -- use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
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
