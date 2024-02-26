return {
  'stevearc/conform.nvim',
  enabled = true,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      clojure = { 'cljfmt' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      css = { 'prettier' },
      lua = { 'stylua' },
      sql = { 'pg_format' },
    },
    async = true,
    format_on_save = { timeout = 500, lsp_fallback = true },
    log_level = vim.log.levels.DEBUG,
    formatters = {
      sql_formatter = {
        prepend_args = { '-l', 'postgresql' },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
