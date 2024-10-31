return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
      { name = 'dev', url = 'postgres://postgres:dev123admin@localhost:55122/postgres' },
      -- { name = 'staging', url = 'postgres://postgres:mypassword@localhost:5432/my-staging-db' },
      -- { name = 'wp', url = 'mysql://root@localhost/wp_awesome' },
      -- {
      --   name = 'production',
      --   url = function()
      --     return vim.fn.system 'get-prod-url'
      --   end,
      -- },
    }
    local cmp = require 'cmp'
    cmp.setup.filetype({ 'sql' }, {
      sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      },
    })
  end,
}
