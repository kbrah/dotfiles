return {
  {
    "stevearc/oil.nvim",
    enabled = true,
    keys = {
      { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open files" },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["q"] = "actions.close",
      },
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 100,
        max_height = 100,
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
    },
  },
}
