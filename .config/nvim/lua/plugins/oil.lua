return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup {

      default_file_explorer = true,

      columns = {
        "icon",
      },

      float = {
        -- Padding around the floating window
        padding = 1,
        max_width = 70,
        max_height = 30,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },

    }

  end
}
