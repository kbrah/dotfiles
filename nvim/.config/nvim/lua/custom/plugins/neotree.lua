return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.cmd [[nnoremap \ :Neotree reveal<cr>]]

    require'neo-tree'.setup {
      -- window = {
      --   position = 'current',
      -- },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        hijack_netrw_behavior = "open_current"
      },
      buffers = {
        follow_current_file = {
          enabled = true
        },
      },
      -- auto_close = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      -- view = {
      --   width = 30,
      --   side = 'left',
      --   auto_resize = false,
      -- },
    }
  end,
}
