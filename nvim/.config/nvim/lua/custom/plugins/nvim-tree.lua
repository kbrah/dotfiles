return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local tree = require 'nvim-tree'
    -- empty setup using defaults
    tree.setup {
      sort_by = 'case_sensitive',
      renderer = {
        group_empty = true,
      },
      view = {
        float = {
          enable = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      actions = {
        change_dir = {
          enable = false,
        },
      },
    }

    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {})
    -- OR setup with some options
    -- require("nvim-tree").setup({
    --   sort_by = "case_sensitive",
    --   view = {
    --     width = 30,
    --   },
    --   renderer = {
    --     group_empty = true,
    --   },
    --   filters = {
    --     dotfiles = true,
    --   },
    -- })
  end,
}
