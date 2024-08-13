return {
  { 'tpope/vim-dispatch', event = 'BufRead', filetypes = { 'clojure' } },
  { 'clojure-vim/vim-jack-in', event = 'BufRead', filetypes = { 'clojure' } },
  { 'radenling/vim-dispatch-neovim', event = 'BufRead', filetypes = { 'clojure' } },
  {
    'Olical/conjure',
    event = 'BufRead',
    filetypes = { 'clojure' },
    init = function()
      -- local colorize = require('lazyvim.util').has 'baleia.nvim'
      vim.g['conjure#log#strip_ansi_escape_sequences_line_limit'] = 1

      -- Disable diagnostics in log buffer and colorize it
      vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
        pattern = 'conjure-log-*',
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          vim.diagnostic.enable(false, { bufnr = buffer })
          if colorize and vim.g.conjure_baleia then
            vim.g.conjure_baleia.automatically(buffer)
          end
        end,
      })
    end,
    config = function()
      require('conjure.main').main()
      require('conjure.mapping')['on-filetype']()
      -- Disable the documentation mapping
      vim.g['conjure#mapping#doc_word'] = false
    end,
  },

  {
    'PaterJason/cmp-conjure',
    filetypes = { 'clojure' },
    event = 'BufRead',
  },
  {
    'm00qek/baleia.nvim',
    version = '*',
    config = function()
      vim.g.conjure_baleia = require('baleia').setup { line_starts_at = 3 }

      local augroup = vim.api.nvim_create_augroup('ConjureBaleia', { clear = true })

      vim.api.nvim_create_user_command('BaleiaColorize', function()
        vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      vim.api.nvim_create_user_command('BaleiaLogs', vim.g.conjure_baleia.logger.show, { bang = true })
    end,
  },
}
